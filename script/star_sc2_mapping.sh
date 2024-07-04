#!/bin/bash

for run in $(ls /home/aazzolini/gdebiase/hs_T2Tv3 | grep STAR); do
    mkdir /home/aazzolini/gdebiase/sarscov2/${run} 
    for seq in $(ls /home/aazzolini/gdebiase/hs_T2Tv3/${run} | grep Unmapped | cut -d U -f 1); do
        conda run -n al STAR \
        --runThreadN 8 \
        --genomeDir /home/aazzolini/gdebiase/sarscov2/sarscov2_genomeindex \
        --readFilesCommand zcat \
        --readFilesIn /home/aazzolini/gdebiase/hs_T2Tv3/${run}/${seq}Unmapped.out.mate1.gz \
        --alignEndsType EndToEnd \
        --outSAMattributes Standard \
        --outFilterMismatchNoverReadLmax 0.04 \
        --outReadsUnmapped Fastx \
        --outSAMprimaryFlag AllBestScore \
        --outFilterType BySJout \
        --outSAMtype BAM SortedByCoordinate \
        --chimOutType WithinBAM HardClip \
        --alignSJoverhangMin 6 \
        --alignSJDBoverhangMin 6 \
	--sjdbOverhang 65 \
        --outFileNamePrefix /home/aazzolini/gdebiase/sarscov2/${run}/${seq}
    done
done
