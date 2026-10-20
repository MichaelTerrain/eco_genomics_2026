#!/bin/bash
#SBATCH --job-name=PCA
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=24:00:00
#SBATCH --output=./logs/%x.%j.out
#SBATCH --error=./logs/%x.%j.err
#SBATCH --mail-type=END
#SBATCH --mail-user=mboconno@uvm.edu

cd /gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/population_genomics/mydata

OUTDIR=/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/population_genomics/mydata/myresults

echo $OUTDIR

VCF=Lottia_gigantea_pl_flt3.renamed.vcf.gz

echo $VCF

module load plink

plink --vcf $VCF --double-id --allow-extra-chr \
    --set-missing-var-ids @:# \
    --indep-pairwise 50 10 0.2 \
    --out $OUTDIR Lg_LD_0.2_alldata
    
plink --vcf $VCF --double-id --allow-extra-chr --set-missing-var-ids @:# \
    --extract Lg_LD_0.2.prune.in \
    --make-bed --pca --out $OUTDIR/Lg_LD_0.2_alldata
    
echo "im fully cooked"