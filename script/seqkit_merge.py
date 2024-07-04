import pandas as pd

#pd.read_csv("path cartella", "\t")
#pd.concat([lista dataframe], axis = 0)
seqkit_merge = list()
for i in range (1,7):
    df = pd.read_csv(f"/home/aazzolini/gdebiase/seqkit_out/fastq_{i}_stats.tsv", "\t")
    seqkit_merge.append(df)
    
seqkit_merge = pd.concat(seqkit_merge, axis = 0)
seqkit_merge.to_csv("/home/aazzolini/gdebiase/seqkit_out/seqkit_merge.csv")

'''
seqkit_merge diventa lista
append sulla lista
concat
'''