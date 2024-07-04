#!/bin/bash

for seq in $(ls /home/aazzolini/rawdata); do 
    seqkit stats -j 8 /home/aazzolini/rawdata/${seq}/*R1*.fastq.gz -o /home/aazzolini/gdebiase/seqkit_out/${seq}_stats.tsv -T
done 