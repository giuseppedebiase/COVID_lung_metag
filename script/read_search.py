import gzip
from Bio import SeqIO
'''
names.txt is a file that contains, for each line, the common part of the name between the concatenated read and the forward/reverse read.
ex. concatenated read name: Lib_10_S9__concatUnmapped.out.mate1.gz
forward read name: Lib_10_S9_R1_trimmed.fastq.gz
in names.txt, the entry will be: Lib_10_S9
to generate the names listed in names.txt, I used the following command:
ls | grep .gz | cut -d '_' -f 1,2,3 | uniq
for each of the run folders in the "fastp" folder
'''
names = open('/home/aazzolini/gdebiase/script/names.txt')
for line in names:
    #esempio di nome contenuto in names: Lib_10_S9
    name = line.rstrip('\n')
    #path read concatenate
    path_concat = '/home/aazzolini/gdebiase/hs_T2Tv3/fastq_1_concat_STAR_mapping_result/' + name + '__concatUnmapped.out.mate1.gz'
    #path read forward
    path_read_F = '/home/aazzolini/gdebiase/fastp/fastq_1/' + name + '_R1_trimmed.fastq.gz'
    #path read reverse
    path_read_R = '/home/aazzolini/gdebiase/fastp/fastq_1/' + name + '_R2_trimmed.fastq.gz'
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

    with open('/home/aazzolini/gdebiase/sarscov2v2/fastq_1_paired/' + name + '_R1_rs.fastq', "w") as output_handle:
        SeqIO.write(outputF.values(), output_handle, "fastq")

    with open('/home/aazzolini/gdebiase/sarscov2v2/fastq_1_paired/' + name + '_R2_rs.fastq', "w") as output_handle:
        SeqIO.write(outputR.values(), output_handle, "fastq")

names.close()
