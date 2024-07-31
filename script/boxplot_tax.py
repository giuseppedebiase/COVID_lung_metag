import pandas as pd
import matplotlib.pyplot as plt

tab = pd.read_excel(r'C:\Users\Utente\Desktop\Tab16.xlsx')

taxa = input('Opzioni: funghi, batteri, archea, virus, tutti -')
run = input('Opzioni: per run, overall -')


if taxa == 'tutti' and run == 'overall':
    colonne = ['funghi', 'batteri', 'archea', 'virus']
    tab[colonne].boxplot()
    plt.title(r'Distribuzione della % di read assegnate ad ogni gruppo tassonomico per tutte le Run')
    plt.grid(False)
    plt.ylabel(r'%')
    plt.show()
elif taxa != 'tutti' and run == 'per run':
    r1 = tab[tab['Run'] == 1][taxa]
    print(r1)
    r2 = tab[tab['Run'] == 2][taxa]
    r3 = tab[tab['Run'] == 3][taxa]
    r4 = tab[tab['Run'] == 4][taxa]
    r5 = tab[tab['Run'] == 5][taxa]
    r6 = tab[tab['Run'] == 6][taxa]
    plt.boxplot([r1, r2, r3, r4, r5, r6], labels=['Run1', 'Run2', 'Run3', 'Run4', 'Run5', 'Run6'])
    plt.title(r'Distribuzione della % di read assegnate a' + taxa + ' per Run')
    plt.ylabel(r'%')
    plt.show()