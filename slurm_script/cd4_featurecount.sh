#!/bin/bash

##########################################################################

##A script to run featureCounts on cd4 data set as part of linux on
## the command line course

######################################################

## Specify a partition. Check available partitions using sinfo Slurm command.
#SBATCH --partition=cpu

## The following line will send an email notification to your registered email
## address when the job ends or fails.
#SBATCH --mail-type=END,FAIL

## Specify the amount of memory that your job needs. This is for the whole job.
## Asking for much more memory than needed will mean that it takes longer to
## start when the cluster is busy.
#SBATCH --mem=20G

## Specify the number of CPU cores that your job can use. Setting at 8.

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

featureCounts -a /project/grte3920/1_linux/2_rnaseq/2_genome/Mus_musculus.GRCm38.102.gtf.gz \
 -t exon -T 8 -g gene_id -p -s 2 \
 -o /project/grte3920/1_linux/2_rnaseq/3_analysis/3_feature_count/cd4_counts.txt \
 /project/grte3920/1_linux/2_rnaseq/3_analysis/2_mapping/sorted_cd4.bam


