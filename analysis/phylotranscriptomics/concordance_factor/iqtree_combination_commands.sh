#!/bin/bash
#SBATCH -n 10
#SBATCH -N 1                    
#SBATCH -t 7-00:00              
#SBATCH -p shared,unrestricted       
#SBATCH --mem=24G              
#SBATCH --mail-type=ALL         
#SBATCH --mail-user=church@g.harvard.edu

cd /n/holyscratch01/extavour_lab/shchurch/assembly_phylogeny_expression_Hawaiian_Drosophila_June2021
source activate agalma_Sep2018

cd agalma/scratch
OUTDIR=iqtree_59
cd $OUTDIR

SUPERMATRIX=/n/holyscratch01/extavour_lab/shchurch/assembly_phylogeny_expression_Hawaiian_Drosophila_June2021/agalma/reports/59.supermatrix.fa

iqtree2 -t tree_combinations/HI_tree_aa --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_aa --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ab --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ab --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ac --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ac --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ad --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ad --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ae --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ae --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_af --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_af --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ag --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ag --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ah --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ah --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ai --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ai --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_aj --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_aj --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ak --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ak --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_al --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_al --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_am --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_am --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_an --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_an --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ao --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ao --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ap --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ap --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_aq --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_aq --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ar --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ar --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_as --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_as --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_at --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_at --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_au --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_au --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_av --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_av --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_aw --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_aw --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ax --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ax --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ay --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ay --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_az --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_az --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ba --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ba --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bb --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bb --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bc --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bc --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bd --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bd --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_be --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_be --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bf --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bf --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bg --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bg --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bh --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bh --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bi --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bi --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bj --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bj --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bk --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bk --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bl --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bl --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bm --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bm --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bn --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bn --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bo --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bo --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bp --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bp --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bq --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bq --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_br --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_br --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bs --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bs --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bt --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bt --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bu --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bu --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bv --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bv --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bw --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bw --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bx --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bx --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_by --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_by --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_bz --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_bz --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ca --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ca --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cb --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cb --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cc --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cc --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cd --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cd --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ce --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ce --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cf --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cf --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cg --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cg --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ch --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ch --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ci --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ci --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cj --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cj --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ck --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ck --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cl --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cl --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cm --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cm --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cn --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cn --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_co --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_co --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cp --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cp --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cq --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cq --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cr --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cr --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cs --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cs --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ct --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ct --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cu --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cu --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cv --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cv --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cw --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cw --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cx --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cx --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cy --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cy --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_cz --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_cz --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_da --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_da --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_db --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_db --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dc --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dc --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dd --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dd --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_de --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_de --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_df --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_df --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dg --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dg --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dh --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dh --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_di --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_di --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dj --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dj --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dk --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dk --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dl --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dl --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dm --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dm --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dn --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dn --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_do --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_do --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dp --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dp --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dq --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dq --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dr --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dr --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ds --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ds --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dt --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dt --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_du --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_du --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dv --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dv --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dw --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dw --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dx --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dx --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dy --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dy --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_dz --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_dz --cf-verbose --df-tree --cf-quartet
iqtree2 -t tree_combinations/HI_tree_ea --gcf June2021_iqtree59_loci.treefile -s $SUPERMATRIX --scf 100 --prefix June2021_iqtree59_ea --cf-verbose --df-tree --cf-quartet


