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
