#!/bin/bash

for run in $(ls /home/aazzolini/rawdata); do
    for seq in $(ls /home/aazzolini/rawdata/${run} | grep _R1_ | cut -d R -f 1 ); do
        fastp \
        -i /home/aazzolini/rawdata/${run}/${seq}R1_001.fastq.gz \
        -I /home/aazzolini/rawdata/${run}/${seq}R2_001.fastq.gz \
        -o /home/aazzolini/gdebiase/fastp/${run}/${seq}R1_trimmed.fastq.gz \
        -O /home/aazzolini/gdebiase/fastp/${run}/${seq}R2_trimmed.fastq.gz \
        --unpaired1 /home/aazzolini/gdebiase/fastp/${run}/${seq}R1_trimmed_unpaired.gz \
        --unpaired2 /home/aazzolini/gdebiase/fastp/${run}/${seq}R2_trimmed_unpaired.gz \
        -q 25 \
        -u 20 \
        -e 30 \
        -n 1 \
        -l 40 \
        -g \
        -x \
        -f 10 \
        -D \
        -h /home/aazzolini/gdebiase/fastp/${run}/${seq}_report.html
    done
done
