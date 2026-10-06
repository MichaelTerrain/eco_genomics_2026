# Transcriptomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 9.15.2026 - Setting up lab notebook and learning markdown

-   Setting up transcriptomics notebook

-   Learn how to take notes in markdown

-   push notes to github

**Working Directory:**

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics`

**Input Files**:

`none`

**Output Files**:

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics/Transcriptomics.notebook.md`

**Programs and dependencies**:

-   `R Version 4.5.1`

-   `R-Studio`

**Scripts**:

`none`

**Code**:

``` r
Print ("Hello World")
```

**Table:**

| Col1 | Col2 | Col3 |
|------|------|------|
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |

![](images/markdown-syntax-cheatsheet.webp)

**Notes/Observation**:

-   Graph stuff

**Next Steps?**

------------------------------------------------------------------------

# Transcriptomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 9.17.2026 - Diving into code

-   learned zcat

-   used vacc shell to check out data

-   commands i used in VACC shell

```         
zcat filename
```

-this opened a gzipped file. but DONT RUN IT,ITS HUGE. you gotta pipe it with "\| Head"

**Working Directory:**

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics`

or maybe

`/gpfs1/cl/biol3990`

**Input Files**:

`/gpfs1/cl/biol3990`

**Output Files**:

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics/Transcriptomics.notebook.md`

**Programs and dependencies**:

-   `R Version 4.5.1`

-   `R-Studio`

-   Vacc Shell

**Scripts**:

`zcat AA_F0_Rep3_2_clean.fq.gz | head -n 8`

**Code**:

\`\`\` [[mboconno\@vacc-login1](mailto:mboconno@vacc-login1){.email} mboconno]\$ cd /gpfs1/cl/biol3990

**Code**:

``` r
[mboconno@vacc-login1 biol3990]$ ll
total 1
drwxrwsr-x 5 mpespeni biol3990 4096 Sep 15 11:42 Transcriptomics
[mboconno@vacc-login1 biol3990]$ ls
Transcriptomics
[mboconno@vacc-login1 biol3990]$ cd Transcriptomics/
[mboconno@vacc-login1 Transcriptomics]$ ll
total 3
drwxrwsr-x 2 mpespeni biol3990 4096 Sep 15 11:42 CleanData
drwxrwsr-x 2 mpespeni biol3990 4096 Sep 15 11:41 CountsMatrix
drwxrwsr-x 2 mpespeni biol3990 4096 Sep 15 11:29 RawData
[mboconno@vacc-login1 Transcriptomics]$ cd c
-bash: cd: c: No such file or directory
[mboconno@vacc-login1 Transcriptomics]$ cd CleanData/
[mboconno@vacc-login1 CleanData]$ ll
total 9574520
-rw-r--r-- 1 mpespeni biol3990 1443367162 Sep 15 11:38 AA_F0_Rep1_1_clean.fq.gz
-rw-r--r-- 1 mpespeni biol3990 1466551500 Sep 15 11:38 AA_F0_Rep1_2_clean.fq.gz
-rw-r--r-- 1 mpespeni biol3990 1747188307 Sep 15 11:38 AA_F0_Rep2_1_clean.fq.gz
-rw-r--r-- 1 mpespeni biol3990 1780157475 Sep 15 11:38 AA_F0_Rep2_2_clean.fq.gz
-rw-r--r-- 1 mpespeni biol3990 1659953125 Sep 15 11:38 AA_F0_Rep3_1_clean.fq.gz
-rw-r--r-- 1 mpespeni biol3990 1707066880 Sep 15 11:38 AA_F0_Rep3_2_clean.fq.gz
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep
AA_F0_Rep1_1_clean.fq.gz  AA_F0_Rep1_2_clean.fq.gz  AA_F0_Rep2_1_clean.fq.gz  AA_F0_Rep2_2_clean.fq.gz  AA_F0_Rep3_1_clean.fq.gz  AA_F0_Rep3_2_clean.fq.gz
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep3_
AA_F0_Rep3_1_clean.fq.gz  AA_F0_Rep3_2_clean.fq.gz  
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep3_2_clean.fq.gz | head -n 8
@A00742:278:HH5VYDSX2:2:1101:3965:1000 2:N:0:CTCGTGTA+NTAGGCTT
TGGCAGATAGAGAAGAAGGGAAGGAGTACACCATTGAACACCTGTGCTATCAGAATAACAGTTGTTCTTTCATCTACACCAATTAAGGAGTTAACAAAAGCTGCAACAATGACCATAACAACCATTATTGCCATGTAAATCCACCGCGGC
+
FFFFFFF:FFFFFFFFFFFFF,FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFF,FFFFFF:FFFFF:FFFFFFFFFFFFFFFFFF:FFFFFFF
@A00742:278:HH5VYDSX2:2:1101:11614:1000 2:N:0:CTCGTGTA+NTAGGCTT
ATTTTAGAAACCAATAAAAGTTTTTCTTCTTCACTAAAAGAGGTTGCTGTCCAAGGATTAGGTTCACTACCAACTTTCATAGCTTTCAGCTTATCAGATTCAAAAAAAGCATCCGGAGGAAAGTGATCACTACAGAGTCTGGAGTTGATG
+
FF:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFFFFFFFFFFFFFF:FFFFFFFFF,FFFFFFFFFFF:,FFFF,F:FFFFFFFFFFFFFFFFFFFF,FFFFFFFF
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep3_2_clean.fq.gz | head -n 4
@A00742:278:HH5VYDSX2:2:1101:3965:1000 2:N:0:CTCGTGTA+NTAGGCTT
TGGCAGATAGAGAAGAAGGGAAGGAGTACACCATTGAACACCTGTGCTATCAGAATAACAGTTGTTCTTTCATCTACACCAATTAAGGAGTTAACAAAAGCTGCAACAATGACCATAACAACCATTATTGCCATGTAAATCCACCGCGGC
+
FFFFFFF:FFFFFFFFFFFFF,FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFF,FFFFFF:FFFFF:FFFFFFFFFFFFFFFFFF:FFFFFFF
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep3_2_clean.fq.gz | WC - l
-bash: WC: command not found
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep3_2_clean.fq.gz | wc - l
93638040 117047550 8504182762 -
wc: l: No such file or directory
93638040 117047550 8504182762 total
[mboconno@vacc-login1 CleanData]$ 
```

------------------------------------------------------------------------

# Transcriptomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 9.24.2026 - review and fixing stuff

-   fixed my project i thing

-   reviewed the code we've been learning

-   push notes to github

**Working Directory:**

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics`

**Input Files:**

`none`

**Output Files:**

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics/Transcriptomics.notebook.md`

**Programs and dependencies:**

`R Version 4.5.1`

`R-Studio`

`Vacc`

**Scripts:**

**Code:**

**Notes/Observation:**

`Home directory /users/mboconno`

`1class directory /gpfsl/cl/biol3990/transcriptomics`

**Next Steps?**

`figure out what went wrong with my stuff`

------------------------------------------------------------------------

# Transcriptomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 9.29.2026 - working with DESEQ day 2

-   compared the different conditions

-   made some graphs for each comparison

-   volcano plot, heatmap, euler plot, upset plot

**Working Directory:**

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics/mydata`

**Input Files**:

`none`

**Output Files**:

**Programs and dependencies**:

-   `R Version 4.5.1-tidyverse`

-   `R-Studio`

**Scripts**:

`\~/Projects/eco_genomics_2026/transcriptomics/myscripts`

**Code**:

``` r
countsTable <- read.table("salmon.isoform.counts.matrix.filteredAssembly", header=TRUE, row.names=1)
head(countsTable)
dim(countsTable)
countsTableRound <- round(countsTable) # bc DESeq2 doesn't like decimals (and Salmon outputs data with decimals)
head(countsTableRound)

res_OWvsAM <- results(dds_F0, name="treatment_OW_vs_AM", alpha=0.05)
res_OWvsAM <- res_OWvsAM[order(res_OWvsAM$padj),]
head(res_OWvsAM) 
summary(res_OWvsAM)
```

![](~/Projects/eco_genomics_2026/transcriptomics/myfigures/Euler.png)

![](~/Projects/eco_genomics_2026/transcriptomics/myfigures/heatmap.png)

![](~/Projects/eco_genomics_2026/transcriptomics/myfigures/volcano.png)

**Notes/Observation**:

-   i got my stuff working again B)

**Next Steps?**

------------------------------------------------------------------------

# Transcriptomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 10.01.2026 - DGEA wrap up, GO and maybe WGCNA analyses

-   merge and mutate

-   Create a Scatter plot

-   Create a function to run a TopGO contrast

-   push notes to github

**Working Directory:**

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics/mydata`

**Input Files**:

`none`

**Output Files**:

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics/Transcriptomics.notebook.md`

`/Projects/eco_genomics_2026/transcriptomics/myscripts/9.29.26_AHUD_DESEQpt.r`

**Programs and dependencies**:

-   `R Version 4.5.1-tidyverse`

-   `R-Studio`

**Scripts**:

`none`

**Code**:

``` r
filter() #to remove rows
mutate() #to add a new variable
case_when() #to classify genes into categories
arrange() #to sort the rows
```

**Table/Graphs:**

![](~/Projects/eco_genomics_2026/transcriptomics/myfigures/Scatter_plot.png)

**Notes/Observation**:

-   Graph stuff

**Next Steps?**

------------------------------------------------------------------------

# Transcriptomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 10.06.2026 - Setting up lab notebook and learning markdown

-   test for functional enrichment using annotated GO categories for each gene and the TopGO program.

-   Make bubble plot

-   Weighted Gene Correlation Network Analyses

-   push notes to github

**Working Directory:**

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics/mydata`

**Input Files**:

`none`

**Output Files**:

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics/Transcriptomics.notebook.md`

`/Projects/eco_genomics_2026/transcriptomics/myscripts/10.06.26_AHUD_GoandMaybe.r`

**Programs and dependencies**:

-   `R Version 4.5.1-tidyverse`

-   `R-Studio`

**Scripts**:

`none`

**Code**:

``` r
## Set your working directory
setwd("/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics")

## Import the libraries that we're likely to need in this session

library(DESeq2)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(ggpubr)
library(wesanderson)
library(vsn)  

####################################################

### Import our data

####################################################


# Import the counts matrix
countsTable <- read.table("salmon.isoform.counts.matrix.filteredAssembly", header=TRUE, row.names=1)
head(countsTable)
dim(countsTable)

countsTableRound <- round(countsTable) # bc DESeq2 doesn't like decimals (and Salmon outputs data with decimals)
head(countsTableRound)

#import the sample description table
conds <- read.delim("ahud_samples_R.txt", header=TRUE, stringsAsFactors = TRUE, row.names=1)
head(conds)


dds <- DESeqDataSetFromMatrix(countData = countsTableRound, colData=conds, 
                              design= ~ treatment)

dim(dds)
# [1] 130580     38

# Filter 
dds <- dds[rowSums(counts(dds) >= 15) >= 28,]
nrow(dds) 

# Subset the DESeqDataSet to the specific level of the "generation" factor
dds_F0 <- subset(dds, select = generation == 'F0')
dim(dds_F0)
# [1] 25260    12

# Perform DESeq2 analysis on the subset
dds_F0 <- DESeq(dds_F0)


resultsNames(dds_F0)
# [1] "Intercept"           "treatment_OA_vs_AM"  "treatment_OW_vs_AM"  "treatment_OWA_vs_AM"

res_OWAvsAM <- results(dds_F0, name="treatment_OWA_vs_AM", alpha=0.05)
res_OWAvsAM <- res_OWAvsAM[order(res_OWAvsAM$padj),]
head(res_OWAvsAM)  
summary(res_OWAvsAM)


res_OWvsAM <- results(dds_F0, name="treatment_OW_vs_AM", alpha=0.05)
res_OWvsAM <- res_OWvsAM[order(res_OWvsAM$padj),]
head(res_OWvsAM) 
summary(res_OWvsAM)

res_OAvsAM <- results(dds_F0, name="treatment_OA_vs_AM", alpha=0.05)
res_OAvsAM <- res_OAvsAM[order(res_OAvsAM$padj),]
head(res_OAvsAM) 
summary(res_OAvsAM)


res_OWAvsAM.df <- as.data.frame(res_OWAvsAM)
res_OWAvsAM.df$fullID <- rownames(res_OWAvsAM.df)

parts <- strsplit(res_OWAvsAM.df$fullID, "::")

res_OWAvsAM.df$shortID <- sapply(
  parts,
  function(x) paste(x[1:2], collapse="::")
)

write.csv(
  res_OWAvsAM.df,
  "myresults/F0_OWAvsAM_results.csv",
  row.names = FALSE
)

res_OWvsAM.df <- as.data.frame(res_OWvsAM)
res_OWvsAM.df$fullID <- rownames(res_OWvsAM.df)

parts <- strsplit(res_OWvsAM.df$fullID, "::")

res_OWvsAM.df$shortID <- sapply(
  parts,
  function(x) paste(x[1:2], collapse="::")
)

write.csv(
  res_OWvsAM.df,
  "myresults/F0_OWvsAM_results.csv",
  row.names = FALSE
)

res_OAvsAM.df <- as.data.frame(res_OAvsAM)
res_OAvsAM.df$fullID <- rownames(res_OAvsAM.df)

parts <- strsplit(res_OAvsAM.df$fullID, "::")

res_OAvsAM.df$shortID <- sapply(
  parts,
  function(x) paste(x[1:2], collapse="::")
)

write.csv(
  res_OAvsAM.df,
  "myresults/F0_OAvsAM_results.csv",
  row.names = FALSE
)



run_topGO_contrast <- function(
    infile,
    outfile,
    ontology = "BP",
    padj.cutoff = 0.05){

  deseq <- read.csv(
    infile,
    stringsAsFactors = FALSE
  )

  deseq <- subset(
    deseq,
    !is.na(padj)
  )

  geneList <- factor(
    as.integer(deseq$padj < padj.cutoff)
  )

  names(geneList) <- deseq$shortID

  cat("\nGenes tested:",
      length(geneList))

  cat("\nSignificant genes:",
      sum(geneList == 1),
      "\n")

  GOdata <- new(
    "topGOdata",
    ontology = ontology,
    allGenes = geneList,
    geneSelectionFun = function(x) x == 1,
    annot = annFUN.gene2GO,
    gene2GO = geneID2GO.filtered
  )

  resultWeight <- runTest(
    GOdata,
    algorithm = "weight01",
    statistic = "fisher"
  )

  GOresults <- GenTable(
    GOdata,
    weightFisher = resultWeight,
    orderBy = "weightFisher",
    topNodes = 100
  )

  write.csv(
    GOresults,
    outfile,
    row.names = FALSE
  )

  return(GOresults)
}
GO_OA <- run_topGO_contrast(
  "myresults/F0_OAvsAM_results.csv",
  "myresults/GO_F0_OAvsAM_BP.csv"
)

GO_OW <- run_topGO_contrast(
  "myresults/F0_OWvsAM_results.csv",
  "myresults/GO_F0_OWvsAM_BP.csv"
)

GO_OWA <- run_topGO_contrast(
  "myresults/F0_OWAvsAM_results.csv",
  "myresults/GO_F0_OWAvsAM_BP.csv"
)

head(GO_OA)
```

**Table:**

![](~/Projects/eco_genomics_2026/transcriptomics/myfigures/Bubbleplot.png) ![](~/Projects/eco_genomics_2026/transcriptomics/myfigures/bubble%20owam.png) ![](~/Projects/eco_genomics_2026/transcriptomics/myfigures/bubble%20oaam.png)

**Notes/Observation**:

-   Graph stuff

**Next Steps?**

------------------------------------------------------------------------

# 
