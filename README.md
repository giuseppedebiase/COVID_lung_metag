## Trimming
Trimming con FastP  
[Script per il trimming](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/fastp_trimming.sh)

## Inidicizzazione del genoma umano con STAR
Assembly del genoma umano (e annotazioni) scaricato da [qui](https://hgdownload.soe.ucsc.edu/goldenPath/hs1/bigZips/)  
[Script per l'indicizzazione](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_index.sh)

## Allineamento delle read sul genoma umano con STAR
Qui abbiamo fatto vari tentativi di allineamento:
[Tentativo 1](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_try1.sh)
[Tentativo 2](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_try2.sh)
[Tentativo 3](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_try3.sh)

Per quanto riguarda l'ultimo tentativo abbiamo concatenato tutte le read PE con seqkit con il seguente script:
[Script per la concatenazione](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/concat_trimmed_reads.sh)
[Tentativo 4 (read concatenate)](https://github.com/giuseppedebiase/COVID_lung_metag/blob/main/script/star_hs_t2t_concat.sh)

## Indicizzazione del genoma si Sars-CoV-2 con STAR

## Allineamento delle read sul genoma di Sars-CoV-2 con STAR
