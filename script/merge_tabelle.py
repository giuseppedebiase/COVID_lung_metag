import pandas as pd

seqkit = pd.read_csv("/home/aazzolini/gdebiase/seqkit_out/seqkit_merge.csv", index_col=False)
metadati = pd.read_excel("/home/aazzolini/gdebiase/seqkit_out/42003_2021_2748_MOESM3_ESM.xlsx", sheet_name = "Supplementary Data 8")

seqkit.insert(5, "num_seqs*2", seqkit['num_seqs'] * 2)

file_duplicate = seqkit['file']

seqkit['file'] = seqkit['file'].apply(lambda dir: dir.split('/')[4])
seqkit.insert(2, 'file_name', 0)
seqkit['file_name'] = file_duplicate.apply(lambda file: file.split('/')[5])

seqkit = seqkit.rename(columns={'file' : 'run_dir'})
metadati = metadati.rename(columns={"Total reads" : "num_seqs*2"})

output = pd.merge(seqkit, metadati, on = "num_seqs*2", how = "outer")
output.drop('Unnamed: 0', axis=1, inplace=True)
output.to_csv("/home/aazzolini/gdebiase/seqkit_out/merge_tabelle_outer.csv")

output = pd.merge(seqkit, metadati, on = "num_seqs*2", how = "inner")
output.drop('Unnamed: 0', axis=1, inplace=True)
output.to_csv("/home/aazzolini/gdebiase/seqkit_out/merge_tabelle_inner.csv")

'''
FAI PER INNER E OUTER!!!
'''