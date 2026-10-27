# Population Genomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 10.13.2026 - Working with VCF files

-   move data from vcf to my directory

-   make new notebook

-   push notes to github

**Working Directory:**

`~/Projects/eco_genomics_2026/population_genomics/mydata`

**Input Files**:

`lottia_gigantea_biallelic`

**Output Files**:

`~/Projects/eco_genomics_2026/population_genomics/Population_genomics_Transcriptomics.notebook.md`

**Programs and dependencies**:

-   `R Version 4.5.1-tidyverse`

-   `R-Studio`

-   `bcftools 1.19`

**Code**:

``` r
zcat Lottia_gigantea_biallelic.vcf.gz | head -n 20

module load gcc
module load bcftools

bcftools --version   # record the versions you use in your methods
bcftools -h          # -h or --help usually gets you the manual

bcftools head Lottia_gigantea_biallelic.vcf.gz
```

**Table:**

**Notes/Observation**:

-   vacc is difficult

**Next Steps?**

------------------------------------------------------------------------

# Population Genomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 10.15.2026 - Working with VCF files day 2?

-   fixed our files from vacc so we could actually use them

-   

-   push notes to github

**Working Directory:**

`~/Projects/eco_genomics_2026/population_genomics/mydata`

**Input Files**:

`lottia_gigantea_pl_flt3`

**Output Files**:

`~/Projects/eco_genomics_2026/population_genomics/Population_genomics_Transcriptomics.notebook.md`

**Programs and dependencies**:

-   `R Version 4.5.1-tidyverse`

-   `R-Studio`

-   `bcftools 1.19`

**Code**:

``` r
bcftools query -f '%CHROM\t%POS\t%REF\t%ALT[\t%GT]\n' \Lottia_gigantea_pl_flt3.renamed.vcf.gz | head -n 5


  GNU nano 5.6.1                                                                   New Buffer                                                                    Modified  
#!/bin/bash
#SBATCH --job-name=vcf_stats
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5G
#SBATCH --time=1:00:00
#SBATCH --output=./logs/%x.%j.out
#SBATCH --error=./logs/%x.%j.err
#SBATCH --mail-type=END
#SBATCH --mail-user=mboconno@uvm.edu
~/Projects/eco_genomics_2026/population_genomics/mdata    
module load gcc
module load vcftools
OUT=~/Projects/eco_genomics_2026/population_genomics/mydata/myresults
vcftools --gzvcf Lottia_gigantea_pl_flt3.renamed.vcf.gz --missing-indv --out missing_data
vcftools --gzvcf Lottia_gigantea_pl_flt3.renamed.vcf.gz --depth --out depth_data
```

**Table:**

**Notes/Observation**:

-   vacc is difficult

**Next Steps?**

------------------------------------------------------------------------

## 10.15.2026 - Population structure

-   move files from vacc... again

-   made DATA_DIR

-   CV stuff

-   push notes to github

-   Submitted batch job 5963708

**Working Directory:**

`~/Projects/eco_genomics_2026/population_genomics/mydata`

**Input Files**:

`Lg_LD_0.2`

**Output Files**:

`~/Projects/eco_genomics_2026/population_genomics/Population_genomics_Transcriptomics.notebook.md`

`~/Projects/eco_genomics_2026/population_genomics/mydata/PopulationStructure`

**Programs and dependencies**:

-   `R Version 4.5.1-tidyverse`

-   `R-Studio`

-   `VACC`

-   `PLINK v1.9.0-b.7.7 64-bit (22 Oct 2024)`

**Code**:

``` r
DATA_DIR=~/Projects/eco_genomics_2026/population_genomics/mydata
```

**Table:**

**Notes/Observation**:

-   vacc is difficult

**Next Steps?**

# Population Genomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 10.22.2026 - Genetic Diversity

-   

-   

-   push notes to github

**Working Directory:**

`~/Projects/eco_genomics_2026/population_genomics/mydata`

**Input Files**:

`sample_metadata.csv`

**Output Files**:

`~/Projects/eco_genomics_2026/population_genomics/Population_genomics_Transcriptomics.notebook.md`

`~/Projects/eco_genomics_2026/population_genomics/mydata/myresults/pi`

**Programs and dependencies**:

-   `R Version 4.5.1-tidyverse`

-   `R-Studio`

-   `vcftools/0.1.16`

**Code**:

``` r
dir.create(paste0(OUTDIR,"/TajD"))


taj_files <- list.files("TajD", pattern = "Tajima.D$", full.names = TRUE)

tajd <- taj_files %>%
  set_names(str_remove(basename(taj_files), fixed(".Tajima.D"))) %>%
  # vcftools writes "nan" when D can't be calculated, so treat that as missing (NA)
  map_dfr(read_tsv, .id = "Population", na = c("", "NA", "nan", "-nan"),
          show_col_types = FALSE) %>%
  filter(N_SNPS >= 5) %>%   # drop windows with too few SNPs to be reliable
  left_join(sites, by = "Population") %>%
  mutate(Site = fct_reorder(Population, Latitude))

tajd %>%
  group_by(Site) %>%
  summarise(n_windows = n(),
            mean_D    = mean(TajimaD, na.rm = TRUE),
            median_D  = median(TajimaD, na.rm = TRUE))

tajd_plot <- ggplot(tajd, aes(Site, TajimaD, fill = Site)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_violin() +
  geom_boxplot(width = 0.15, fill = "white", outlier.shape = NA) +
  scale_fill_viridis_d(end = 0.9) +
  labs(x = "Site", y = "Tajima's D") +
  theme_classic() +
  theme(legend.position = "none")+
  coord_flip()

ggsave(paste0(OUTDIR, "/TajD/tajimasD_by_site.png"), plot = tajd_plot, width = 4, height = 7)
```

**Figures:**

![](~/Projects/eco_genomics_2026/population_genomics/myfigures/pi/pi_by_site.png)

![](~/Projects/eco_genomics_2026/population_genomics/myfigures/pi/pi_vs_latitude.png)

**Notes/Observation**:

-   vacc is difficult

**Next Steps?**

------------------------------------------------------------------------

# # Population Genomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 10.27.2026 - Genetic Diversity p2 and Signatures of selection

-   finish code from yesterday

-  Fst and such on vacc 

-   push notes to github

**Working Directory:**

`~/Projects/eco_genomics_2026/population_genomics/mydata`

**Input Files**:

`sample_metadata.csv`

**Output Files**:

`~/Projects/eco_genomics_2026/population_genomics/Population_genomics_Transcriptomics.notebook.md`

`~/Projects/eco_genomics_2026/population_genomics/mydata/myresults/pi`

**Programs and dependencies**:

-   `R Version 4.5.1-tidyverse`

-   `R-Studio`

-   `vcftools/0.1.16`

**Code**:

``` r

```

**Figures:**

![](~/Projects/eco_genomics_2026/population_genomics/myfigures/pi/pi_along_scaffold.png)

![](~/Projects/eco_genomics_2026/population_genomics/myfigures/pi/pi_scaffold_facet.png)

**Notes/Observation**:

-   its tuesday

**Next Steps?**
