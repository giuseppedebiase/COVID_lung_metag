#!/bin/bash

conda run -n al STAR \
        --runThreadN 10 \
        --genomeDir /home/aazzolini/gdebiase/hs_T2T/hs_T2T_genomeindex \
        --readFilesCommand zcat \
        --readFilesIn /home/aazzolini/gdebiase/hs_T2T_seqkit_try/Lib_12_S11_trimmed_concat.fastq.gz \
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
        --outFileNamePrefix /home/aazzolini/gdebiase/hs_T2T_seqkit_try/Lib_12_S11_STAR_mapping_results/Lib_12_S11_