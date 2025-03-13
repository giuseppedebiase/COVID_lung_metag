## Quality Control
The files related to the quality control of the reads in raw data are located in the following directories:  
FastQC: `/home/aazzolini/gdebiase/QC_rawdata/fastqc_output_x` (with x from 1 to 6)  
MultiQC: `/home/aazzolini/gdebiase/QC_rawdata/multiqc`  
The MultiQC folder also contains the file `multiqc_report.html`, which includes the MultiQC results for all six runs.

## Trimming
Trimming with FastP  
[Trimming script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/fastp_trimming.sh) 

The files related to the quality control of the trimmed reads are located in the following directories:  
FastQC: `/home/aazzolini/gdebiase/fastp/trimmed_qc`  
MultiQC: `/home/aazzolini/gdebiase/fastp/multiqc_trimmed`  
The MultiQC folder also contains the file `multiqc_report.html`, which includes the MultiQC results for all six runs.

## Human Genome Indexing with STAR
Human genome assembly (CHM13 V2.0) and annotations downloaded from [here](https://hgdownload.soe.ucsc.edu/goldenPath/hs1/bigZips/)  
[Indexing script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_index.sh)  
The files generated from the indexing are located in the following directory:  
`/home/aazzolini/gdebiase/hs_T2T/hs_T2T_genomeindex`

## Read Alignment to the Human Genome with STAR
Several alignment attempts were performed:  
[Attempt 1](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_try1.sh)  
[Attempt 2](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_try2.sh)  
[Attempt 3](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_try3.sh)

For the last attempt, all PE reads were concatenated using seqkit with the following script:  
[Concatenation script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/concat_trimmed_reads.sh)  
[Attempt 4 (concatenated reads)](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_concat.sh)

## SARS-CoV-2 Genome Indexing with STAR
SARS-CoV-2 genome assembly (ASM985889v3) and annotations downloaded from [here](https://covid-19.ensembl.org/Sars_cov_2/Info/Index)  
[Indexing script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_sc2_index.sh)  

## Read Alignment to the SARS-CoV-2 Genome with STAR
Several alignment attempts were performed:  
[Attempt 1](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_sc2_mapping.sh) (using concatenated reads that do not map to the human genome)  

For the second attempt, we decided to map paired-end reads filtered from the human genome alignment to the SARS-CoV-2 genome.  
To generate FASTQ files containing these reads, I created the following six scripts (one for each run). Each script uses a text file named name[numerorun] to iterate over the samples:  
Run 1: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search.py)  [names](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names.txt)  
Run 2: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search_r2.py)  [names2](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names2.txt)  
Run 3: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search_r3.py)  [names3](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names3.txt)  
Run 4: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search_r4.py)  [names4](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names4.txt)  
Run 5: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search_r5.py)  [names5](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names5.txt)  
Run 6: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search_r6.py)  [names6](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names6.txt)  
[Attempt 2](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_sc2_mappingv2.sh)  

For Attempt 3, we used the unmapped PE reads resulting from the third alignment attempt on the human genome.  
[Attempt 3](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_sc2_mappingv3.sh)  

## Taxonomic Classification with Kraken2  
For classification, we used the PlusPF database (6/5/2024) [link](https://benlangmead.github.io/aws-indexes/k2)  
[Taxonomic classification script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/kraken2_classification.sh)
