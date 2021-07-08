#!/bin/bash
#SBATCH -n 24
#SBATCH -N 1                    
#SBATCH -t 7-00:00              
#SBATCH -p shared,remotedesktop
#SBATCH --mem=64G              
#SBATCH --mail-type=ALL         
#SBATCH --mail-user=church@g.harvard.edu

source activate beast
beast -threads 24 -overwrite all_new_full_beast.xml
