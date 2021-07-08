#R

# This script was written by SHC in 2019
# This script downloads sequence files from NCBI using accession numbers
# The accession numbers were accessed from the database files from the Hawaiian Drosophila digitization project

library(dplyr)
library(ggplot2)
library(rentrez)
library(seqinr)

source("species.R")

genetic_Katoh_2016_OriginsScaptomyza <- read.delim(file="HI_Dros_genetic_studies\ -\ Katoh_2016_OriginsScaptomyza.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F,na.strings=c("","NA"))
genetic_MagnaccaPrice_2015_RapidAdaptive <- read.delim(file="HI_Dros_genetic_studies\ -\ MagnaccaPrice_2015_RapidAdaptive.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F,na.strings=c("","NA"))
genetic_Lapoint_2014_PhylogeneticsAntopocerus <- read.delim(file="HI_Dros_genetic_studies\ -\ Lapoint_2014_PhylogeneticsAntopocerus.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F,na.strings=c("","NA"))
genetic_Ogrady_2011_PhylogeneticMitochondrial <- read.delim(file="HI_Dros_genetic_studies\ -\ Ogrady_2011_PhylogeneticMitochondrial.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F,na.strings=c("","NA"))
genetic_Lapoint_2010_PhylogeneticsSpoonTarsus <- read.delim(file="HI_Dros_genetic_studies\ -\ Lapoint_2010_PhylogeneticsSpoonTarsus.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F,na.strings=c("","NA"))
genetic_Bonacum_2005_PhylogenyPlanitibia <- read.delim(file="HI_Dros_genetic_studies\ -\ Bonacum_2005_PhylogenyPlanitibia.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F,na.strings=c("","NA"))
genetic_Ogrady_2004_PhylogeneticHaleakala <- read.delim(file="HI_Dros_genetic_studies\ -\ Ogrady_2004_PhylogeneticHaleakala.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F,na.strings=c("","NA"))
genetic_Lapoint_2013_DiversificationScaptomyza <- read.delim(file="HI_Dros_genetic_studies\ -\ Lapoint_2013_DiversificationScaptomyza.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F,na.strings=c("","NA"))
genetic_BakerDesalle_1997_CharacterPhylogeny <- read.delim(file="HI_Dros_genetic_studies\ -\ BakerDesalle_1997_CharacterPhylogeny.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F,na.strings=c("","NA"))

genetic <- bind_rows(genetic_Katoh_2016_OriginsScaptomyza,
	genetic_MagnaccaPrice_2015_RapidAdaptive,
	genetic_Lapoint_2014_PhylogeneticsAntopocerus,
	genetic_Ogrady_2011_PhylogeneticMitochondrial,
	genetic_Lapoint_2010_PhylogeneticsSpoonTarsus,
	genetic_Bonacum_2005_PhylogenyPlanitibia,
	genetic_Ogrady_2004_PhylogeneticHaleakala,
	genetic_Lapoint_2013_DiversificationScaptomyza,
	genetic_BakerDesalle_1997_CharacterPhylogeny)

new_gn <- genetic %>% make_scientific_name %>% update_name

search_ncbi <- function(gene_name) {
	published_ids <- genes_of_interest %>% filter(gene == gene_name) %>% pull(id)
	entrez_searches <- lapply(published_ids,entrez_search,db="nucleotide")
	return(entrez_searches)
}

ncbi_summary <- function(gene_name) {
	published_ids <- genes_of_interest %>% filter(gene == gene_name) %>% pull(id)
	entrez_summaries <- lapply(published_ids,entrez_summary,db="nucleotide")
	return(entrez_summaries)
}

write_accession_list <- function(es,name) {
	accession_numbers <- unlist(lapply(es,function(x) {x$id}))
	write.table(file = paste(name,"_accession.txt",sep=""),unique(accession_numbers),row.names=F,col.names=F,quote=F)
}

gene_names <-c("AChE","Adh","COI","COII","COIII","Dip3","Ef1g","GLS","Ge.1","Gpdh","GstD1","ITS1","Marf","Marf2","ND1","ND2","ND4","Osi9","PRY","Pgi","Rad23","Smox","X16S","X28S","Yp1","Yp2","Yp2_rep","bin","boss","cadR","fz4","hb1","hb2","kl.2","l.2.not","nad1","ntid","pds5","rpt","sina","snf","wee","wg1","wg2")

genes_of_interest <- new_gn %>% 
	select(name,gene_names) %>% 
	tidyr::gather("gene","id",-name) %>% 
	filter(!is.na(id)) %>% 
	# removes genome scale assemblies from the database as well as outgroup sequences
	filter(!id == "FLYBASE") %>% 
	filter(!name %in% c("Drosophila_grimshawi","Drosophila_mojavensis","Drosophila_melanogaster","Drosophila_virilis","Drosophila_hydei","Drosophila_mulleri")) %>% 
	distinct(name,gene,id)

# This section was run once, and has since been commented out for time

#ncbi_results <- lapply(gene_names,search_ncbi)
#lapply(seq(1:length(gene_names)) function(x) {write_accession_list(ncbi_results[[x]],gene_names[[x]])})

#ncbi_summaries <- lapply(gene_names,ncbi_summary)
#save.image(file = "genetic_workspace.Rdata")

#g <- "Yp2_rep"
#ncbi_results[[which(gene_names == g)]] <- search_ncbi(g)
#write_accession_list(ncbi_results[[which(gene_names == g)]] g)

# This section reads in aligned sequences, chooses the longest sequence per species
#    and exports alignment files with all taxa included

get_aln_fasta <- function(gene_name) {
	filename <- paste("aligned_sequences/",gene_name,"_aln.fa",sep="")
	fas <- read.fasta(filename)
	return(fas)
}

gene_file_names <-c("AChE","Adh","COI","COII","COIII","Dip3","Ef1g","GLS","Ge1","Gpdh","GstD1","ITS1","Marf","Marf2","ND1","ND2","ND4","Osi9","PRY","Pgi","Rad23","Smox","16S","28S","Yp1","Yp2","Yp2_rep","bin","boss","cadR","fz4","hb1","hb2","kl2","l2not","nad1","ntid","pds5","rpt","sina","snf","wee","wg1","wg2")

fasta_list <- lapply(gene_file_names,get_aln_fasta)

# count number of gaps per sequence

get_fasta_gaplen <- function(fas){
	fas_lens <- tibble(gaplen = unlist(lapply(fas,function(x) {length(which(x == "-"))})),name = names(fas), index = 1:length(fas))
	return(fas_lens)
}

fasta_gaplens <- lapply(fasta_list,get_fasta_gaplen)

# choose the sequence with the minimum number of gaps

get_longest_fasta <- function(fas,fas_gaplen,name) {
	new_fas_ind <- fas_gaplen %>% group_by(name) %>% slice(which.min(gaplen)) %>% pull(index)
	new_fas <- fas[new_fas_ind]
	return(new_fas)
}

new_fasta_list <- lapply(seq(1:length(fasta_list)),function(x){get_longest_fasta(fasta_list[[x]],fasta_gaplens[[x]],gene_file_names[[x]])})

# get list of remaining taxa per gene

all_taxa_names <- unique(unlist(lapply(fasta_list,names)))

# builds an alignment file with all species names included, even if empty for that gene

make_gappy_seq <- function(name,aln_len,class){
	gappy_seq <- rep("-",aln_len)
	attr(gappy_seq,"name") <- name
	attr(gappy_seq,"annot") <- paste(">",name,sep="")
	attr(gappy_seq,"class") <- class
	return(gappy_seq)
}

make_gappy_fasta <- function(fas){
	aln_len <- length(fas[[1]])
	fas_class <- attr(fas[[1]],"class")
	taxa_missing <- all_taxa_names[which(!all_taxa_names %in% names(fas))]
	missing_seqs <- lapply(taxa_missing,make_gappy_seq,aln_len=aln_len,class=fas_class)
	names(missing_seqs) <- taxa_missing
	gappy_fas <- c(fas,missing_seqs)
	return(gappy_fas)
}

gappy_fasta_list <- lapply(new_fasta_list,make_gappy_fasta)

lapply(seq(1:length(new_fasta_list)),function(x){write.fasta(new_fasta_list[[x]],names(new_fasta_list[[x]]),file=paste("new",gene_file_names[[x]],"aln.fa",sep="_"))})

lapply(seq(1:length(gappy_fasta_list)),function(x){write.fasta(gappy_fasta_list[[x]],names(gappy_fasta_list[[x]]),file=paste("gappy",gene_file_names[[x]],"aln.fa",sep="_"))})

#### OUTSIDE OF R
#		GENE="wg2"
#		#mv ../sequence\ \(4\).fasta $GENE.fa
#		mafft --auto $GENE.fa > $GENE"_aln.fa"
#		#mafft --adjustdirectionaccurately $GENE.fa > $GENE"_aln.fa" ### ONLY FOR 16S_modified
#		open -a "SEAVIEW" $GENE"_aln.fa"
#		
#		mv $GENE"_aln.fa" aligned_genes/
#		cd aligned_genes/
#		
#		sed -i '' "s/voucher.*//g" *_aln.fa
#		sed -i '' "s/san.*//g" *_aln.fa
#		sed -i '' "s/RPT4.*//g" *_aln.fa
#		sed -i '' "s/seven.*//g" *_aln.fa
#		sed -i '' "s/lethal.*//g" *_aln.fa
#		sed -i '' "s/l(2)not.*//g" *_aln.fa
#		sed -i '' "s/hunchback.*//g" *_aln.fa
#		sed -i '' "s/rudimentary.*//g" *_aln.fa
#		sed -i '' "s/yolk.*//g" *_aln.fa
#		sed -i '' "s/NADH.*//g" *_aln.fa
#		sed -i '' "s/mitochondrial.*//g" *_aln.fa
#		sed -i '' "s/16S.*//g" *_aln.fa
#		sed -i '' "s/GstD1.*//g" *_aln.fa
#		sed -i '' "s/internal.*//g" *_aln.fa
#		sed -i '' "s/Gpdh.*//g" *_aln.fa
#		sed -i '' "s/glycerol.*//g" *_aln.fa
#		sed -i '' "s/glass.*//g" *_aln.fa
#		sed -i '' "s/cytochrome.*//g" *_aln.fa
#		sed -i '' "s/gene.*//g" *_aln.fa
#		sed -i '' "s/acetyl.*//g" *_aln.fa
#		sed -i '' "s/alcohol.*//g" *_aln.fa
#		sed -i '' "s/Adh.*//g" *_aln.fa
#		sed -i '' "s/wingless.*//g" *_aln.fa
#		sed -i '' "s/marf.*//g" *_aln.fa
#		sed -i '' "s/r gene.*//g" *_aln.fa
#		

#		sed -i '' "s/^>[a-zA-Z0-9_]*\.[a-zA-Z0-9]*\ //g" *_aln.fa
		
#		sed -i '' "s/[\.\(\)\'\"\ ]/_/g" *_aln.fa

#		sed -i '' "s/^Drosophila/>Drosophila/g" *_aln.fa
#		sed -i '' "s/^Scaptomyza/>Scaptomyza/g" *_aln.fa
#		sed -i '' "s/_$//g" *_aln.fa
#		sed -i '' "s/_$//g" *_aln.fa
#		sed -i '' "s/_$//g" *_aln.fa
#		sed -i '' "s/__/_/g" *_aln.fa
#		sed -i '' "s/__/_/g" *_aln.fa
#		sed -i '' "s/__/_/g" *_aln.fa
		
#		# r program to pick longest
#		cd ..
#		mv "new_"$GENE"_aln.fa" new_aligned_genes/
#		cd new_aligned_genes/

#		phyutility -concat -in new_AChE_aln.fa new_Adh_aln.fa new_COI_aln.fa new_COII_aln.fa new_COIII_aln.fa new_Dip3_aln.fa new_Ef1g_aln.fa new_GLS_aln.fa new_Ge1_aln.fa new_Gpdh_aln.fa new_GstD1_aln.fa new_ITS1_aln.fa new_Marf_aln.fa new_Marf2_aln.fa new_ND1_aln.fa new_ND2_aln.fa new_ND4_aln.fa new_Osi9_aln.fa new_PRY_aln.fa new_Pgi_aln.fa new_Rad23_aln.fa new_Smox_aln.fa new_16S_aln.fa new_28S_aln.fa new_Yp1_aln.fa new_Yp2_aln.fa new_Yp2_rep_aln.fa new_bin_aln.fa new_boss_aln.fa new_cadR_aln.fa new_fz4_aln.fa new_hb1_aln.fa new_hb2_aln.fa new_kl2_aln.fa new_l2not_aln.fa new_nad1_aln.fa new_ntid_aln.fa new_pds5_aln.fa new_rpt_aln.fa new_sina_aln.fa new_snf_aln.fa new_wee_aln.fa new_wg1_aln.fa new_wg2_aln.fa -out HI_Dros_new_full.nex
		
