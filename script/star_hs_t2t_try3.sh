#!/bin/bash

for run in $(ls /home/aazzolini/gdebiase/fastp); do 
    for seq in $(ls /home/aazzolini/gdebiase/fastp/${run} | grep _R1_ | cut -d R -f 1 | uniq); do
        conda run -n al STAR \
        --runThreadN 8 \
        --genomeDir /home/aazzolini/gdebiase/hs_T2T/hs_T2T_genomeindex \
        --readFilesCommand zcat \
        --readFilesIn /home/aazzolini/gdebiase/fastp/${run}/${seq}R1_trimmed.fastq.gz /home/aazzolini/gdebiase/fastp/${run}/${seq}R2_trimmed.fastq.gz \
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
        --outFileNamePrefix /home/aazzolini/gdebiase/hs_T2Tv2/${run}_STAR_mapping_result/${seq}
    done
done
