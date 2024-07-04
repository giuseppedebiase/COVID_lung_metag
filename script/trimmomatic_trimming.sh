#!/bin/bash

for run in $(ls /home/aazzolini/rawdata); do
    for seq in ${run}; do
        java -jar trimmomatic-0.40.jar PE \
        /home/aazzolini/rawdata/${run}/${seq} \
        /home/aazzolini/rawdata/${run}/${seq} \
        /home/aazzolini/gdebiase/fastp_${run}/R1_trimmed_${seq} \
        /home/aazzolini/gdebiase/fastp_${run}/R1_trimmed_unpaired_${seq} \
        /home/aazzolini/gdebiase/fastp_${run}/R2_trimmed_${seq} \
        /home/aazzolini/gdebiase/fastp_${run}/R2_trimmed_unpaired_${seq} \
        LEADING:25 \
        TRAILING:25 \
        MINLEN:45

    done
done