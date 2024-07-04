#!/bin/bash

conda run -n al STAR \
        --runThreadN 8 \
        --genomeDir /home/aazzolini/gdebiase/sarscov2/sarscov2_genomeindex \
        --readFilesCommand zcat \
        --readFilesIn /home/aazzolini/gdebiase/hs_T2Tv2/fastq_1_STAR_mapping_result/Lib_10_S9_Unmapped.out.mate1.gz \
	/home/aazzolini/gdebiase/hs_T2Tv2/fastq_1_STAR_mapping_result/Lib_10_S9_Unmapped.out.mate2.gz \
        --outFileNamePrefix /home/aazzolini/gdebiase/sarscov2/prova/Lib_10_S9_concat_prova_
