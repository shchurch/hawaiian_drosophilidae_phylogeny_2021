#!/bin/bash
#SBATCH -n 10
#SBATCH -N 1                    
#SBATCH -t 7-00:00              
#SBATCH -p shared,remotedesktop       
#SBATCH --mem=24G              
#SBATCH --mail-type=ALL         
#SBATCH --mail-user=church@g.harvard.edu

source activate agalma_Sep2018

ALIGNMENT=/n/holyscratch01/extavour_lab/shchurch/Hawaiian_time-calibrated_March2021/all_new_trim.nex
CONSTRAINT=/n/holyscratch01/extavour_lab/shchurch/Hawaiian_time-calibrated_March2021/iqtree_89_constraint.tre
PREFIX=all_new_trim

iqtree2 -s $ALIGNMENT --prefix $PREFIX -alrt 1000 -B 1000 -T AUTO -g $CONSTRAINT

