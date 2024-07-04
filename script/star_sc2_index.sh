#!/bin/bash

conda run -n al STAR \
    --runThreadN 8 \
    --runMode genomeGenerate \
    --genomeDir /home/aazzolini/gdebiase/sarscov2/sarscov2_genomeindex \
    --genomeFastaFiles /home/aazzolini/gdebiase/sarscov2/Sars_cov_2.ASM985889v3.dna.toplevel.fa \
    --sjdbGTFfile /home/aazzolini/gdebiase/sarscov2/Sars_cov_2.ASM985889v3.101.gtf \
    --sjdbOverhang 65