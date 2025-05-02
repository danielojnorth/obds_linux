##Copy of commands used to perform fastqc and multiqc analysis
## WD: /project/grte3920/1_linux/2_rnaseq

fastqc -o 3_analysis/1_fastqc  1_fastq/cd4_rep1_read1.fastq.gz 1_fastq/cd4_rep1_read2.fastq.gz

multiqc -o 3_analysis/reports 3_analysis/1_fastqc

## Example of how to access help function for fastqc and multiqc for reference

$fastqc -h
$multiqc -h

## Code used to run fastqc on cluster
### WD:  /project/grte3920/1_linux/2_rnaseq/4_slurm/slurm_fastqc01_05_25.sh
####   slurm_fastqc01_05_25.sh adapted from slurm_template.sh
sbatch slurm_fastqc01_05_25.sh
## Code used to check location in queue
squeue --me

##Code used to log job to convert .sam file into sorted.bam file
## note: script assumes specific directory location - uses relative paths 
sbatch /project/grte3920/1_linux/2_rnaseq/4_slurm/samtools_BAM_SORT_CD4.sh

##Code used to pull reference genome for -a argument of featureCount
wget ftp://ftp.ensembl.org/pub/release-102/gtf/mus_musculus//Mus_musculus.GRCm38.102.gtf.gz

##Code used to run script to generate index for sorted .bam file, and perform mapping qc on this .bam file
sbatch /project/grte3920/1_linux/2_rnaseq/4_slurm/CD4_index.sh

##Command used to run featureCount script
sbatch /project/grte3920/1_linux/2_rnaseq/4_slurm/cd4_featurecount.sh


