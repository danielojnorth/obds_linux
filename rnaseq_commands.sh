##Copy of commands used to perform fastqc and multiqc analysis
## WD: /project/grte3920/1_linux/2_rnaseq

fastqc -o 3_analysis/1_fastqc  1_fastq/cd4_rep1_read1.fastq.gz 1_fastq/cd4_rep1_read2.fastq.gz

multiqc -o 3_analysis/reports 3_analysis/1_fastqc

## Example of how to access help function for fastqc and multiqc

$fastqc -h
$multiqc -h


