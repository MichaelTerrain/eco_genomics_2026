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
