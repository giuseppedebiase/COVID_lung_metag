#!/bin/bash

conda run -n al STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir /home/aazzolini/gdebiase/hs_T2T/hs_T2T_genomeindex \
--genomeFastaFiles /home/aazzolini/gdebiase/hs_T2T/hs1.fa \
--sjdbGTFfile /home/aazzolini/gdebiase/hs_T2T/hs1.ncbiRefSeq.gtf \
--sjdbOverhang 65
