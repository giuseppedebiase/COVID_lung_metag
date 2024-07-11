## Controllo qualità
I file relativi al controllo qualità delle read in rawdata si trovano nelle seguenti cartelle:  
FastQC: `/home/aazzolini/gdebiase/QC_rawdata/fastqc_output_x` (con x da 1 a 6)  
MultiQC: `/home/aazzolini/gdebiase/QC_rawdata/multiqc`  
Nella cartella del MultiQC è presente anche il file `multiqc_report.html` contentente il risultato del MultiQC per tutte e 6 le run.

## Trimming
Trimming con FastP  
[Script per il trimming](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/fastp_trimming.sh) 

I file relativi al controllo qualità delle read trimmed si trovano nelle seguenti cartelle:  
FastQC: `/home/aazzolini/gdebiase/fastp/trimmed_qc`  
MultiQC: `/home/aazzolini/gdebiase/fastp/multiqc_trimmed`  
Nella cartella del MultiQC è presente anche il file `multiqc_report.html` contentente il risultato del MultiQC per tutte e 6 le run.

## Indicizzazione del genoma umano con STAR
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
[Script per l'indicizzazione](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_sc2_index.sh)  

## Allineamento delle read sul genoma di Sars-CoV-2 con STAR
Qui abbiamo fatto vari tentativi per l'allineamento:  
[Tentativo 1](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_sc2_mapping.sh) (utilizzando read concatenate che non mappano sul genoma umano)  

Per il secondo tentativo abbiamo deciso di mappare le read paired end, filtrate dall'allineamento sul genoma umano, sul genoma di Sars-CoV-2.  
Per generare dei fastq contenenti le read sopracitate ho creato i seguenti 6 script (uno per ciascuna run). Ogni script utilizza un file di testo chiamato name[numerorun] per iterare i campioni:  
Run 1: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search.py)  [names](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names.txt)  
Run 2: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search_r2.py)  [names2](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names2.txt)  
Run 3: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search_r3.py)  [names3](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names3.txt)  
Run 4: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search_r4.py)  [names4](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names4.txt)  
Run 5: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search_r5.py)  [names5](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names5.txt)  
Run 6: [Script](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/read_search_r6.py)  [names6](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/names6.txt)  
[Tentativo 2](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_sc2_mappingv2.sh)  

Per il Tentativo 3 abbiamo utilizzato le read PE unmapped risultanti dall'allineamento del 3° tentativo di allineamento sul genoma umano.  
[Tentativo 3](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_sc2_mappingv3.sh)
