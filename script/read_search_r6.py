import gzip
from Bio import SeqIO
'''
names.txt è un file che contiene per ogni riga la parte del nome comune
tra read concatenata e read forward/reverse
es. nome read concatenata: Lib_10_S9__concatUnmapped.out.mate1.gz
nome read forward: Lib_10_S9_R1_trimmed.fastq.gz
in name sarà presente Lib_10_S9
per generare i nomi presenti in names.txt si può utilizzare il comando
ls | grep .gz | cut -d '_' -f 1,2,3 | uniq (FORSE NON PER TUTTE LE RUN, ATTENTO)
all'interno di ogni singola run presente all'interno della cartella "fastp"
'''
names = open('/home/aazzolini/gdebiase/script/names6.txt')
for line in names:
    #esempio di nome contenuto in names: DV_IZSPB_205_S21
    name = line.rstrip('\n')
    #path read concatenate
    path_concat = '/home/aazzolini/gdebiase/hs_T2Tv3/fastq_6_concat_STAR_mapping_result/' + name + '__concatUnmapped.out.mate1.gz'
    #path read forward
    path_read_F = '/home/aazzolini/gdebiase/fastp/fastq_6/' + name + '_R1_trimmed.fastq.gz'
    #path read reverse
    path_read_R = '/home/aazzolini/gdebiase/fastp/fastq_6/' + name + '_R2_trimmed.fastq.gz'
    #dizionario con le sequenze forward output
    outputF = {}
    #dizionario con le sequenze reverse output
    outputR = {}

    with gzip.open(path_concat, 'rt') as handle:
        concat_dict = SeqIO.to_dict(SeqIO.parse(handle, "fastq"))

    with gzip.open(path_read_F, 'rt') as handle:
        readF_dict = SeqIO.to_dict(SeqIO.parse(handle, "fastq"))

    with gzip.open(path_read_R, 'rt') as handle:
        readR_dict = SeqIO.to_dict(SeqIO.parse(handle, "fastq"))

    for id1 in concat_dict.keys():
        if id1 in readF_dict:
            outputF[id1] = readF_dict[id1]
        if id1 in readR_dict:
            outputR[id1] = readR_dict[id1]

    with open('/home/aazzolini/gdebiase/sarscov2v2/fastq_6_paired/' + name + '_R1_rs.fastq', "w") as output_handle:
        SeqIO.write(outputF.values(), output_handle, "fastq")

    with open('/home/aazzolini/gdebiase/sarscov2v2/fastq_6_paired/' + name + '_R2_rs.fastq', "w") as output_handle:
        SeqIO.write(outputR.values(), output_handle, "fastq")

names.close()