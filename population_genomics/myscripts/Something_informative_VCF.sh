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

