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

## Specify the number of CPU cores that your job can use. I am choosing 8 core.
#SBATCH --ntasks=8

## Specify the maximum amount of time that your job will need to run.
## specified as DAYS-HOURS:MINUTES:SECONDS. This example is one hour.
#SBATCH --time=0-01:00:00

## Provide file name (files will be saved in directory where job was ran) or path
## to capture the terminal output and save any error messages. This is very useful
## if you have problems and need to ask for help.
#SBATCH --output=%j_%x.out
#SBATCH --error=%j_%x.err

## ################### CODE TO RUN ##########################
# NOTE: WRITTEN WITH RELATIVE PATH ASSUMING WD: /project/grte3920/1_linux/2_rnaseq/3_analysis/2_mapping

## First line - converts to bam and pipes output into next line and sets 8 cores
## Second line - sorts output and sets 8 cores
samtools view -b -@ 8 cd4.sam | \
samtools sort -@ 8 > sorted_cd4.bam

