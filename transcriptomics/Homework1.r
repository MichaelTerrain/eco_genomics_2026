
library(DESeq2)
library(tidyverse)
library(ggvenn)
library(patchwork)

#Load data
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

print(table(meta$treatment, meta$generation))

#DESeq2 per generation, contrasts vs AM
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

#DEG counts
deg_summary <- all_res |>
  filter(!is.na(padj), padj < padj_cut) |>
  group_by(generation, contrast) |>
  summarise(n_DEG = n(),
            n_up = sum(log2FoldChange > 0),
            n_down = sum(log2FoldChange < 0), .groups = "drop")
print(deg_summary)

#Venn diagrams
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

#PCA (F0 and F4 samples)
keep <- rownames(meta)[meta$generation %in% c("F0", "F4")]
dds_pca <- DESeqDataSetFromMatrix(counts[, keep], droplevels(meta[keep, ]), design = ~ 1)
dds_pca <- dds_pca[rowSums(counts(dds_pca) >= 10) >= 3, ]
vsd <- vst(dds_pca, blind = TRUE)

pca <- plotPCA(vsd, intgroup = c("treatment", "generation"), returnData = TRUE)
pct <- round(100 * attr(pca, "percentVar"))

p_pca <- ggplot(pca, aes(PC1, PC2, color = treatment, shape = generation)) +
  geom_point(size = 4) +
  xlab(paste0("PC1: ", pct[1], "% variance")) +
  ylab(paste0("PC2: ", pct[2], "% variance")) +
  theme_bw()
print(p_pca)

#Up/down DEG barplot
p_deg <- deg_summary |>
  filter(generation %in% c("F0", "F4")) |>
  pivot_longer(c(n_up, n_down), names_to = "direction", values_to = "n") |>
  mutate(direction = recode(direction, n_up = "Up", n_down = "Down"),
         contrast  = factor(contrast, levels = c("OA_vs_AM", "OW_vs_AM", "OWA_vs_AM"))) |>
  ggplot(aes(contrast, n, fill = direction)) +
  geom_col() +
  facet_wrap(~ generation) +
  scale_fill_manual(values = c(Up = "firebrick", Down = "steelblue")) +
  labs(y = "Number of DEGs (padj < 0.05)", x = NULL) +
  theme_bw()
print(p_deg)

#Observed vs expected additive effect
lfc <- all_res |>
  filter(generation %in% c("F0", "F4")) |>
  select(gene, generation, contrast, log2FoldChange, padj) |>
  pivot_wider(names_from = contrast, values_from = c(log2FoldChange, padj)) |>
  filter(!is.na(log2FoldChange_OA_vs_AM),
         !is.na(log2FoldChange_OW_vs_AM),
         !is.na(log2FoldChange_OWA_vs_AM)) |>
  mutate(sig_any = coalesce(padj_OA_vs_AM, 1) < 0.05 |
           coalesce(padj_OW_vs_AM, 1) < 0.05 |
           coalesce(padj_OWA_vs_AM, 1) < 0.05,
         expected = log2FoldChange_OA_vs_AM + log2FoldChange_OW_vs_AM,
         observed = log2FoldChange_OWA_vs_AM) |>
  filter(sig_any)

p_add <- ggplot(lfc, aes(expected, observed)) +
  geom_point(alpha = 0.25, size = 0.8) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed") +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  facet_wrap(~ generation) +
  labs(x = "Expected additive log2FC (OA + OW)",
       y = "Observed log2FC (OWA)") +
  theme_bw()
print(p_add)

# Slope of observed vs expected 
stats <- lfc |>
  group_by(generation) |>
  summarise(slope = coef(lm(observed ~ expected))[2],
            r     = cor(observed, expected),
            n     = n(),
            .groups = "drop") |>
  mutate(label = sprintf("slope = %.2f\nr = %.2f\nn = %s",
                         slope, r, format(n, big.mark = ",")))

print(stats) 

p_add <- ggplot(lfc, aes(expected, observed)) +
  geom_point(alpha = 0.25, size = 0.8) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed") +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  geom_text(data = stats, aes(label = label),
            x = -Inf, y = Inf, hjust = -0.1, vjust = 1.2,
            inherit.aes = FALSE, size = 3.5) +
  facet_wrap(~ generation) +
  labs(x = "Expected additive log2FC (OA + OW)",
       y = "Observed log2FC (OWA)") +
  theme_bw()

print(p_add)

ggsave("~/Projects/eco_genomics_2026/transcriptomics/myfigures/PCA.png", p_pca, width = 6, height = 5, dpi = 300, bg = "white")
ggsave("~/Projects/eco_genomics_2026/transcriptomics/myfigures/DEG_up_down.png", p_deg, width = 7, height = 4, dpi = 300, bg = "white")
ggsave("~/Projects/eco_genomics_2026/transcriptomics/myfigures/observed_vs_expected.png", p_add, width = 9, height = 4.5, dpi = 300, bg = "white")

tested <- all_res |>
  filter(generation %in% c("F0", "F4")) |>
  group_by(generation, contrast) |>
  summarise(n_tested = n(), .groups = "drop")

table1 <- deg_summary |>
  filter(generation %in% c("F0", "F4")) |>
  left_join(tested, by = c("generation", "contrast")) |>
  mutate(pct_DEG = round(100 * n_DEG / n_tested, 1),
         contrast = factor(contrast, levels = c("OA_vs_AM", "OW_vs_AM", "OWA_vs_AM"))) |>
  arrange(generation, contrast) |>
  select(Generation = generation, Contrast = contrast,
         `Transcripts tested` = n_tested,
         `DEGs` = n_DEG, Up = n_up, Down = n_down, `% DEGs` = pct_DEG)

print(table1)
write.csv(table1, "Table1_DEG_summary.csv", row.names = FALSE)

