## THIS FILE DESCRIBES THE COMMANDS TO RUN
## THE QUARTET MAPPING ANALYSIS IN IQTREE2

# CREATE FOLDER OF PARTITIONS (LOCI) SEPARATED INTO FASTA FILES


# USED THE FOLLOWING SCRIPT MODIFIED FROM NATHAN WHELAN 

#########################################################################################################################
#This script was written by Nathan Whelan.  

# THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
# THE CONTRIBUTORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF 
# OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE 
# SOFTWARE.
##########################################################################################################################
##########################################################################################################################
# I created this script because most datasets from phylogenomic studies only have supermatrices and then the start and 
# stop position of genes. In order to partition datasets for model testing or other uses I needed individual gene alignments.
# If this could be useful for you then please feel free to give it a try.
##########################################################################################################################


library(Biostrings)
setwd("~/postDoc/Scripts/test/") ##Change as needed
rm(list = ls())

##The file name should be a supermatrix in phylip format. Must modify variable names as needed
sequenceData<-unmasked(readAAMultipleAlignment("Dataset1_FullData.phy",format="phylip"))

##Gene list should be in PartitionFinder format (i.e. GENE_NAME = startPostition-stopPosition;)
##Semicolon at end of each line in gene list is not necessary
table<-read.table("DataSet1_GeneList_FullData.txt")
list<-data.frame(do.call('rbind', strsplit(as.character(table$V3),split="-",fixed=TRUE)))
list$X2<-gsub(";","",list$X2)

startVar<-as.data.frame(list$X1)
endVar<-as.data.frame(list$X2)
numberRows<-as.integer(nrow(startVar))

#This for loop will go through and split a supermatrix as specified by gene list
#A single alignment in fasta format will be created for each gene/partition
##See bash script in repository for removing taxa that was not sampled for any given gene output by this for loop
for(n in 1:numberRows){
subset <- AAStringSet(sequenceData, start=as.integer(as.vector(startVar[n,1])), end=as.integer(as.vector(endVar[n,1])))
sublen <- length(subset[[1]])
gaplen <- alphabetFrequency(subset)[,"-"]
subgood <- which(gaplen != sublen)
LINE1=toString(n)
NAME=paste(LINE1,".fas",sep="",collapse=NULL)
writeXStringSet(x=subset[subgood], filepath = NAME, format="fasta") #This will give a unique name
print(n)
print(subset)
}

## LMAP ANALYSIS
# FILE SUBMITTED TO SLURM

#!/bin/bash
#SBATCH -n 1                  
#SBATCH -N 1                    
#SBATCH -t 7-00:00              
#SBATCH -p unrestricted,shared       
#SBATCH --mem=48G              
#SBATCH --mail-type=ALL         
#SBATCH --mail-user=church@g.harvard.edu

cd /n/holyscratch01/extavour_lab/shchurch/assembly_phylogeny_expression_Hawaiian_Drosophila_June2021
source activate agalma_Sep2018

cd agalma/scratch/parts_59/
mkdir lmap_results

# MOVE TO FOLDER CONTAINING PARTITIONS (LOCI) IN SEPARATE FASTA FILES

# ANALYZE POSITION OF PNA CLADE
cd parts
for filename in *fas; do
	[ -e "$filename" ] || continue
    iqtree2 -s $filename --prefix lmap_pna_$filename -T 1 -n 0 -lmclust ../lmap_pna.nex -lmap ALL
done

cd ..
mv parts/lmap* lmap_results/

# ANALYZE POSITION OF HALEAKALAE CLADE
cd parts
for filename in *fas; do
	[ -e "$filename" ] || continue
    iqtree2 -s $filename --prefix lmap_hal_$filename -T 1 -n 0 -lmclust ../lmap_hal.nex -lmap ALL
done

cd ..
mv parts/lmap* lmap_results/

# GENERATE SUMMARY FILES

touch lmap_hal_seven_area_results.tsv
for filename in lmap_hal_*iqtree; do
    [ -e "$filename" ] || continue
    echo "$filename" >>lmap_hal_results.tsv
    grep -B4 "Quartet resolution per sequence (phylogenetic information)" $filename | head -1 >>lmap_hal_seven_area_results.tsv
done

sed -i ':a;N;$!ba;s/.fas.iqtree\n//g' lmap_hal_seven_area_results.tsv
sed -i ':a;N;$!ba;s/lmap_hal_//g' lmap_hal_seven_area_results..tsv 

touch lmap_hal_three_area_results..tsv
for filename in lmap_hal_*iqtree; do
    [ -e "$filename" ] || continue
    echo "$filename" >>lmap_hal_results2.tsv
    grep -B3 "Quartet support of areas 1" $filename | head -1 >>lmap_hal_three_area_results.tsv
done

sed -i ':a;N;$!ba;s/.fas.iqtree\n//g' lmap_hal_three_area_results..tsv
sed -i ':a;N;$!ba;s/lmap_hal_//g' lmap_hal_three_area_results..tsv 


touch lmap_pna_seven_area_results.tsv
for filename in lmap_pna_*iqtree; do
    [ -e "$filename" ] || continue
    echo "$filename" >>lmap_pna_results.tsv
    grep -B4 "Quartet resolution per sequence (phylogenetic information)" $filename | head -1 >>lmap_pna_seven_area_results.tsv
done

sed -i ':a;N;$!ba;s/.fas.iqtree\n//g' lmap_pna_seven_area_results.tsv
sed -i ':a;N;$!ba;s/lmap_pna_//g' lmap_pna_seven_area_results.tsv 

touch lmap_pna_three_area_results.tsv
for filename in lmap_pna_*iqtree; do
    [ -e "$filename" ] || continue
    echo "$filename" >>lmap_pna_three_area_results.tsv
    grep -B3 "Quartet support of areas 1" $filename | head -1 >>lmap_pna_three_area_results.tsv
done

sed -i ':a;N;$!ba;s/.fas.iqtree\n//g' lmap_pna_three_area_results.tsv
sed -i ':a;N;$!ba;s/lmap_pna_//g' lmap_pna_three_area_results.tsv 
