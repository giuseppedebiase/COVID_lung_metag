#!/bin/bash

n=1
for run in $(ls /home/aazzolini/gdebiase/sarscov2v3); do
    mkdir /home/aazzolini/gdebiase/taxclass/fastq_${n}_kraken2_result
    for seq in $(ls /home/aazzolini/gdebiase/sarscov2v3/${run} | grep _Unmapped | cut -d U -f 1 | uniq); do
        conda run -n tc kraken2 \
        --threads 8 \
        --use-names \
        --db /home/aazzolini/gdebiase/taxclass/dbPlusPF \
        --paired /home/aazzolini/gdebiase/sarscov2v3/${run}/${seq}Unmapped.out.mate1 /home/aazzolini/gdebiase/sarscov2v3/${run}/${seq}Unmapped.out.mate2 \
        --output /home/aazzolini/gdebiase/taxclass/fastq_${n}_kraken2_result/${seq}output \
        --report /home/aazzolini/gdebiase/taxclass/fastq_${n}_kraken2_result/${seq}report \
        --use-mpa-style
    done
    ((n+=1))
done
