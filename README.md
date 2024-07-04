## Controllo qualità

## Trimming
Trimming con FastP  
[Script per il trimming](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/fastp_trimming.sh) 

I file relativi al controllo qualità si trovano nelle seguenti cartelle:  
FastQC: /home/aazzolini/gdebiase/fastp/trimmed_qc  
MultiQC: /home/aazzolini/gdebiase/fastp/multiqc_trimmed  
Nella cartella del MultiQC è presente anche il file "multiqc_report.html" contentente il risultato del MultiQC per tutte e 6 le run.

## Inidicizzazione del genoma umano con STAR
Assembly del genoma umano (CHM13 V2.0) e annotazioni scaricate da [qui](https://hgdownload.soe.ucsc.edu/goldenPath/hs1/bigZips/)  
[Script per l'indicizzazione](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_index.sh)

## Allineamento delle read sul genoma umano con STAR
Qui abbiamo fatto vari tentativi di allineamento:  
[Tentativo 1](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_try1.sh)  
[Tentativo 2](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_try2.sh)  
[Tentativo 3](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_try3.sh)

Per quanto riguarda l'ultimo tentativo abbiamo concatenato tutte le read PE con seqkit con il seguente script:  
[Script per la concatenazione](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/concat_trimmed_reads.sh)  
[Tentativo 4 (read concatenate)](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_concat.sh)

## Indicizzazione del genoma di Sars-CoV-2 con STAR
Assembly del genoma di Sars-CoV-2 (ASM985889v3) e annotazioni scaricate da [qui](https://covid-19.ensembl.org/Sars_cov_2/Info/Index)
## Allineamento delle read sul genoma di Sars-CoV-2 con STAR
