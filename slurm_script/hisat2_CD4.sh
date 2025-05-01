#!/bin/bash

## Specify a partition. Check available partitions using sinfo Slurm command.
#SBATCH --partition=cpu

## The following line will send an email notification to your registered email
## address when the job ends or fails.
#SBATCH --mail-type=END,FAIL

## Specify the amount of memory that your job needs. This is for the whole job.
## Asking for much more memory than needed will mean that it takes longer to
## start when the cluster is busy.
#SBATCH --mem=10G

## Specify the number of CPU cores that your job can use. This is only relevant for
## jobs which are able to take advantage of additional CPU cores. Asking for more
## cores than your job can use will mean that it takes longer to start when the
## cluster is busy.
## For this script, I am going to use 8 cores


#SBATCH --ntasks=8

## Specify the maximum amount of time that your job will need to run. Asking for
## the correct amount of time can help to get your job to start quicker. Time is
## specified as DAYS-HOURS:MINUTES:SECONDS. This example is one hour.
#SBATCH --time=0-01:00:00

## Provide file name (files will be saved in directory where job was ran) or path
## to capture the terminal output and save any error messages. This is very useful
## if you have problems and need to ask for help.
#SBATCH --output=%j_%x.out
#SBATCH --error=%j_%x.err

## ################### CODE TO RUN ##########################

# Execute these commands to run HISAT2
##note: index is a series of files in the same directory, all which share the prefix mm10 - line 2 shows how
## this is managed in hisat2

hisat2 --threads 8 \
        --rna-strandness RF \
   -x /project/shared/linux/5_rnaseq/hisat2_index/mm10 \
   -1 /project/grte3920/1_linux/2_rnaseq/1_fastq/cd4_rep1_read1.fastq.gz \
   -2 /project/grte3920/1_linux/2_rnaseq/1_fastq/cd4_rep1_read2.fastq.gz \
   --summary-file /project/grte3920/1_linux/2_rnaseq/3_analysis/2_mapping/cd4_mapping_stats.txt \
   -S /project/grte3920/1_linux/2_rnaseq/3_analysis/2_mapping/cd4.sam

