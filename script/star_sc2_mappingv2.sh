#!/bin/bash

for run in $(ls /home/aazzolini/gdebiase/sarscov2v2); do
    mkdir /home/aazzolini/gdebiase/sarscov2v2/${run}_STAR_mapping_result 
    for seq in $(ls /home/aazzolini/gdebiase/sarscov2v2/${run} | grep R | cut -d R -f 1 | uniq); do
        conda run -n al STAR \
        --runThreadN 8 \
        --genomeDir /home/aazzolini/gdebiase/sarscov2/sarscov2_genomeindex \
        --readFilesIn /home/aazzolini/gdebiase/sarscov2v2/${run}/${seq}R1_rs.fastq /home/aazzolini/gdebiase/sarscov2v2/${run}/${seq}R2_rs.fastq \
        --outFileNamePrefix /home/aazzolini/gdebiase/sarscov2v2/${run}_STAR_mapping_result/${seq}
    done
done
