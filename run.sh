#!/bin/bash
#SBATCH -p long
#SBATCH --job-name=k562_chip
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=kristen.schneider@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=6gb
#SBATCH --time=100:00:00
#SBATCH --output=nextflow.out
#SBATCH --error=nextflow.err

pwd; hostname; date
echo "Booyakasha, Big up Yaself -- you've requested $SLURM_CPUS_ON_NODE core."

module load singularity/3.1.1

nextflow run nf-core/chipseq -r 1.1.0 \
-profile singularity \
--input NRF1_SIN3B_HDAC3_designfile.csv \
--fasta /Shares/rinn_class/data/genomes/human/gencode/v32/GRCh38.p13.genome.fa \
--gtf /Shares/rinn_class/data/genomes/human/gencode/v32/gencode.v32.annotation.gtf \
--macs_gsize 2.7e9 
--blacklist hg38-blacklist.v2.bed \
--save_reference \
--email kristen.schneider@colorado.edu \
-resume \
-c nextflow.config

date
