import argparse
from Bio import SeqIO
import re
import pandas as pd

parser = argparse.ArgumentParser()
parser.add_argument('input', help = 'Path to input fasta file in flybase format')
parser.add_argument('output', help = 'Path to output fasta file')
args = parser.parse_args()

input_file = args.input
output_file = args.output

records = list(SeqIO.parse(input_file, "fasta"))


gene_list = []

for i in range(len(records)):
	g = {}
	g['id'] = records[i].id
	g['length'] = len(records[i].seq)
	descript = records[i].description
	g['parent'] = re.search('.*parent\=([A-z0-9]+)\;.*',descript).group(1)
	gene_list.append(g)

df = pd.DataFrame(gene_list)

longest_genes = df.loc[df.groupby('parent')['length'].idxmax()]

filtered_genes = []

for item in records:
	if item.id in longest_genes.id.values:
		filtered_genes.append(item)

with open(output_file, "w") as output_handle:
    SeqIO.write(filtered_genes, output_handle, "fasta")