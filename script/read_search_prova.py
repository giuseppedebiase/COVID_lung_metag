import gzip
from Bio import SeqIO

path_concat = '/home/aazzolini/gdebiase/hs_T2Tv3/fastq_1_concat_STAR_mapping_result/Lib_10_S9__concatUnmapped.out.mate1.gz'
#path read forward
path_read_F = '/home/aazzolini/gdebiase/fastp/fastq_1/Lib_10_S9_R1_trimmed.fastq.gz'
#path read reverse
path_read_R = '/home/aazzolini/gdebiase/fastp/fastq_1/Lib_10_S9_R2_trimmed.fastq.gz'
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
    for id2 in readF_dict.keys():
        if id1 == id2:
            outputF[id2] = readF_dict[id2]
    for id3 in readR_dict.keys():
        if id1 == id3:
            outputR[id3] = readR_dict[id3]

with open('/home/aazzolini/gdebiase/sarscov2v2/fastq_1_paired/Lib_10_S9_R1_rs.fastq.gz', "w") as output_handle:
    SeqIO.write(outputF.values(), output_handle, "fastq")

with open('/home/aazzolini/gdebiase/sarscov2v2/fastq_1_paired/Lib_10_S9_R2_rs.fastq.gz', "w") as output_handle:
    SeqIO.write(outputR.values(), output_handle, "fastq")