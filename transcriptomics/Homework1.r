# ---- Packages (run install lines once if needed) ----
# install.packages(c("tidyverse", "ggvenn", "patchwork"))
# BiocManager::install("DESeq2")
library(DESeq2)
library(tidyverse)
library(ggvenn)
library(patchwork)

# ---- Load data ----
counts <- read.table("salmon.isoform.counts.matrix.filteredAssembly",
                     header = TRUE, row.names = 1, sep = "\t", check.names = FALSE)
counts <- round(as.matrix(counts))

meta <- read.table("ahud_samples_R.txt", header = TRUE, sep = "\t",
                   stringsAsFactors = FALSE)
rownames(meta) <- meta$sample
counts <- counts[, rownames(meta)]
stopifnot(all(colnames(counts) == rownames(meta)))

meta$treatment  <- factor(trimws(meta$treatment), levels = c("AM", "OA", "OW", "OWA"))
meta$generation <- factor(trimws(meta$generation), levels = c("F0", "F2", "F4", "F11"))

stopifnot(!anyNA(meta$treatment), !anyNA(meta$generation))
print(table(meta$treatment, meta$generation))
table(meta$generation, useNA = "ifany")
table(meta$treatment,  useNA = "ifany")
unique(read.table("ahud_samples_R.txt", header = TRUE, sep = "\t")$generation)

print(table(meta$treatment, meta$generation))   # check replicate numbers

# ---- DESeq2 per generation, contrasts vs AM ----
padj_cut <- 0.05

run_gen <- function(gen) {
  s <- rownames(meta)[meta$generation == gen]
  dds <- DESeqDataSetFromMatrix(counts[, s], droplevels(meta[s, ]),
                                design = ~ treatment)
  dds <- dds[rowSums(counts(dds) >= 10) >= 3, ]
  dds <- DESeq(dds)
  
  trts <- intersect(c("OA", "OW", "OWA"), levels(droplevels(meta[s, ])$treatment))
  bind_rows(lapply(trts, function(trt) {
    results(dds, contrast = c("treatment", trt, "AM"), alpha = padj_cut) |>
      as.data.frame() |>
      rownames_to_column("gene") |>
      mutate(contrast = paste0(trt, "_vs_AM"), generation = gen)
  }))
}

gens    <- levels(meta$generation)
all_res <- bind_rows(lapply(gens, run_gen))

# ---- DEG counts ----
deg_summary <- all_res |>
  filter(!is.na(padj), padj < padj_cut) |>
  group_by(generation, contrast) |>
  summarise(n_DEG = n(),
            n_up = sum(log2FoldChange > 0),
            n_down = sum(log2FoldChange < 0), .groups = "drop")
print(deg_summary)

# ---- Venn diagrams (one per generation) ----
gens <- c("F0", "F4")

deg_lists <- function(gen) {
  contrasts <- c("OA_vs_AM", "OW_vs_AM", "OWA_vs_AM")
  setNames(lapply(contrasts, function(cn) {
    all_res |>
      filter(generation == gen, contrast == cn, !is.na(padj), padj < padj_cut) |>
      pull(gene)
  }), contrasts)
}

venn_plots <- lapply(gens, function(g) {
  ggvenn(deg_lists(g), stroke_size = 0.5, set_name_size = 4) + ggtitle(g)
})
venn_all <- wrap_plots(venn_plots, nrow = 1)
print(venn_all)

ggsave("~/Projects/eco_genomics_2026/transcriptomics/myfigures/venn_DEGs_F0_F4.png", venn_all, width = 10, height = 5, dpi = 300, bg = "white")

