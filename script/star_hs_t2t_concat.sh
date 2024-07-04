#!/bin/bash

for run in $(ls /home/aazzolini/gdebiase/hs_T2Tv3); do
    mkdir /home/aazzolini/gdebiase/hs_T2Tv3/${run}_STAR_mapping_result 
    for seq in $(ls /home/aazzolini/gdebiase/hs_T2Tv3/${run} | grep concat | cut -d . -f 1); do
        conda run -n al STAR \
        --runThreadN 20 \
        --genomeDir /home/aazzolini/gdebiase/hs_T2T/hs_T2T_genomeindex \
        --readFilesCommand zcat \
        --readFilesIn /home/aazzolini/gdebiase/hs_T2Tv3/${run}/${seq}.fastq.gz \
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
        --outFileNamePrefix /home/aazzolini/gdebiase/hs_T2Tv3/${run}_STAR_mapping_result/${seq}
    done
done
