#R
library(dplyr)
library(ggplot2)

make_scientific_name <- function(d) {
	nd <- d %>% mutate(name = paste(genus,species,sep="_"))
	return(nd)
}

name_changes <- read.delim("analysis/comparative_analysis/trait_data/name_changes.tsv",header=T,sep="\t",stringsAsFactors=F) %>% 
	mutate(original_name = paste(original_genus,original_species,sep="_"), 
		new_name = paste(new_genus,new_species,sep="_")) 

update_name <- function(d) {
	up_to_date <- d %>% filter(!(name %in% name_changes$original_name))
	to_change <- d %>% filter(name %in% name_changes$original_name) %>% mutate(original_name = name)
	name_change <- name_changes %>% filter(original_name %in% to_change$name) %>% select(original_name,new_genus,new_species,new_name)
	updated <- merge(to_change,name_change,by="original_name") %>% 
		mutate(genus = new_genus,
			species = new_species,
			name = new_name) %>% 
		select(names(to_change))
	return(bind_rows(up_to_date,updated))
}

species_Ogrady_2010_TaxonomicRelationships <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_species\ -\ Ogrady_2010_TaxonomicRelationships.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F)
species_new_since_2010 <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_species\ -\ new_since_2010.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F)
taxonomic_changes_MagnaccaPrice_2015_RapidAdaptive <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_taxonomic_changes - MagnaccaPrice_2015_RapidAdaptive.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F)

species <- bind_rows(species_Ogrady_2010_TaxonomicRelationships,
	species_new_since_2010)
new_sp <- species %>% make_scientific_name %>% update_name %>% left_join(.,taxonomic_changes_MagnaccaPrice_2015_RapidAdaptive %>% 
			make_scientific_name %>% 
			select(new_group,new_subgroup,name),by="name") %>% 
	mutate(group = ifelse(!is.na(new_group),new_group,group),subgroup = ifelse(!is.na(new_subgroup),new_subgroup,subgroup)) %>% 
	group_by(name) %>% slice(1L)


