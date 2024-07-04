#!/bin/bash

for run in $(ls /home/aazzolini/gdebiase/fastp); do
mkdir /home/aazzolini/gdebiase/hs_T2Tv3/${run}_concat
    for seq in $(ls /home/aazzolini/gdebiase/fastp/${run} | grep _R1_ | cut -d R -f 1 | uniq); do
        conda run -n qc seqkit concat /home/aazzolini/gdebiase/fastp/${run}/${seq}R1_trimmed.fastq.gz \
        /home/aazzolini/gdebiase/fastp/${run}/${seq}R2_trimmed.fastq.gz \
        -o /home/aazzolini/gdebiase/hs_T2Tv3/${run}_concat/${seq}_concat.fastq.gz
    done
done