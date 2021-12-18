## THIS FILE DESCRIBES THE COMMANDS TO RUN
## THE SPRUCEUP COMMANDS TO CLEAN FASTA FILES

cd /n/holyscratch01/extavour_lab/shchurch/assembly_phylogeny_expression_Hawaiian_Drosophila_June2021
source activate agalma_Sep2018

cd agalma/scratch
OUTDIR=spruceup_59
mkdir $OUTDIR
cd $OUTDIR

## spruceup commands
##

python -m spruceup spruceup_59.conf

#!/bin/bash
#SBATCH -n 24                  
#SBATCH -N 1                    
#SBATCH -t 7-00:00              
#SBATCH -p unrestricted,shared       
#SBATCH --mem=48G              
#SBATCH --mail-type=ALL         
#SBATCH --mail-user=church@g.harvard.edu

cd /n/holyscratch01/extavour_lab/shchurch/assembly_phylogeny_expression_Hawaiian_Drosophila_June2021
source activate agalma_Sep2018

cd agalma/scratch
OUTDIR=spruceup_59
cd $OUTDIR

SUPERMATRIX=/n/holyscratch01/extavour_lab/shchurch/assembly_phylogeny_expression_Hawaiian_Drosophila_June2021/agalma/scratch/spruceup_59/0.99_lognorms-cutoff-supermatrix_59_spruceup.fasta
PARTITION_NEX=spruceup59_99.supermatrix.partition.nex

iqtree2 -s $SUPERMATRIX -p $PARTITION_NEX --prefix Nov2021_spruceup59_99_concat -B 1000 -T AUTO
iqtree2 -s $SUPERMATRIX -S $PARTITION_NEX --prefix Nov2021_spruceup59_99_loci -T 1
iqtree2 -t June2021_iqtree59_99_concat.treefile --gcf Nov2021_spruceup59_99_loci.treefile -s $SUPERMATRIX --scf 100 --prefix Nov2021_spruceup59_99_concord -T 10

SUPERMATRIX=/n/holyscratch01/extavour_lab/shchurch/assembly_phylogeny_expression_Hawaiian_Drosophila_June2021/agalma/scratch/spruceup_59/0.97_lognorms-cutoff-supermatrix_59_spruceup.fasta
PARTITION_NEX=spruceup59_97.supermatrix.partition.nex

iqtree2 -s $SUPERMATRIX -p $PARTITION_NEX --prefix Nov2021_spruceup59_97_concat -B 1000 -T AUTO
iqtree2 -s $SUPERMATRIX -S $PARTITION_NEX --prefix Nov2021_spruceup59_97_loci -T 1
iqtree2 -t June2021_iqtree59_97_concat.treefile --gcf Nov2021_spruceup59_97_loci.treefile -s $SUPERMATRIX --scf 100 --prefix Nov2021_spruceup59_97_concord -T 10

SUPERMATRIX=/n/holyscratch01/extavour_lab/shchurch/assembly_phylogeny_expression_Hawaiian_Drosophila_June2021/agalma/scratch/spruceup_59/0.95_lognorms-cutoff-supermatrix_59_spruceup.fasta
PARTITION_NEX=spruceup59_95.supermatrix.partition.nex

iqtree2 -s $SUPERMATRIX -p $PARTITION_NEX --prefix Nov2021_spruceup59_95_concat -B 1000 -T AUTO
iqtree2 -s $SUPERMATRIX -S $PARTITION_NEX --prefix Nov2021_spruceup59_95_loci -T 1
iqtree2 -t June2021_iqtree59_95_concat.treefile --gcf Nov2021_spruceup59_95_loci.treefile -s $SUPERMATRIX --scf 100 --prefix Nov2021_spruceup59_95_concord -T 10

### NOTE: for each need to remove new uninformative sites

grep "parsimony-informative" Nov2021_spruceup59_95_concat.log
grep "variant" Nov2021_spruceup59_95_concat.log

NEW_PART_NEX=spruceup59_95.supermatrix.partition.nex
cp $PARTITION_NEX $NEW_PART_NEX

grep "parsimony-informative" Nov2021_spruceup59_97_concat.log
grep "variant" Nov2021_spruceup59_97_concat.log

NEW_PART_NEX=spruceup59_97.supermatrix.partition.nex
cp $PARTITION_NEX $NEW_PART_NEX

grep "parsimony-informative" Nov2021_spruceup59_97_concat.log
grep "variant" Nov2021_spruceup59_97_concat.log

NEW_PART_NEX=spruceup59_99.supermatrix.partition.nex
cp $PARTITION_NEX $NEW_PART_NEX

## RUN WITH NEW PARTITIONS, AS SHOWN ABOVE