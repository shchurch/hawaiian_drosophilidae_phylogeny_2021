## THIS FILE DESCRIBES THE COMMANDS TO RUN
## THE TRIMAL ANALYSIS OF EVOLUTIONARY RATE

#!/bin/bash
#SBATCH -n 1                  
#SBATCH -N 1                    
#SBATCH -t 7-00:00              
#SBATCH -p unrestricted,shared       
#SBATCH --mem=8G
#SBATCH --mail-type=ALL         
#SBATCH --mail-user=church@g.harvard.edu

cd /n/holyscratch01/extavour_lab/shchurch/assembly_phylogeny_expression_Hawaiian_Drosophila_June2021
source activate agalma_Sep2018

cd agalma/scratch/parts_59/parts

mkdir -p trimal_scores


echo "OG Conservation_Score Evolutionary_Rate" > avg_trimal_scores # Evo rate = 1-(conservation score)

for i in *fas; do
OG=$(echo $i | cut -d . -f 1) # Name of OG
~/trimal -in $i -sst > ${OG}.sst
avg=$(tail -n +4 ${OG}.sst | cut -f1,8 | awk '{print $1,$2,$1*$2}' | 
awk '{sum+=$3;sum2+=$1} END {print sum/sum2,1-(sum/sum2)}') # {printf "Average =",sum/sum2}
echo $i $avg >> avg_trimal_scores
mv ${OG}.sst trimal_scores/
done
# This gets the columns Number of Residues and Similarity Score of .sst file
# Sums each of them and divides similarity score by number of residues in that alignment
# Such that output is average similarity/conservation score

column -t avg_trimal_scores > tempscore && mv tempscore avg_trimal_scores # Tabulate
sort -k3n avg_trimal_scores -o avg_trimal_scores # Order by Evo Rate

mv avg_trimal_scores ../
rm ConservScore.*
