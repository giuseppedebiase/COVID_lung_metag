import pandas as pd
import matplotlib.pyplot as plt

tab = pd.read_excel(r'C:\Users\Utente\Desktop\Tab16.xlsx')

tab2 = tab[['read']]
tab2.boxplot()
plt.grid(False)
plt.title(r'Distribuzione della % di read assegnate per tutte le Run')
plt.ylabel(r'%')
plt.show()

r1 = tab[tab['Run'] == 1]['read']
r2 = tab[tab['Run'] == 2]['read']
r3 = tab[tab['Run'] == 3]['read']
r4 = tab[tab['Run'] == 4]['read']
r5 = tab[tab['Run'] == 5]['read']
r6 = tab[tab['Run'] == 6]['read']

plt.boxplot([r1, r2, r3, r4, r5, r6], labels = ['Run1', 'Run2', 'Run3', 'Run4', 'Run5', 'Run6'])
plt.title(r'Distribuzione della % di read assegnate per Run')
plt.ylabel(r'%')
plt.show()