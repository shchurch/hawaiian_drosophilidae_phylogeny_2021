#R
library(dplyr)
library(ggplot2)

source("analysis/comparative_analysis/species.R")

ecology_Magnacca_2007_HostPlants <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_ecology_records\ -\ Magnacca_2007_HostPlants.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F)
ecology_OgradyKamPerreira_2003_Mimica <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_ecology_records\ -\ OgradyKamPerreira_2003_Mimica.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F)
ecology_MagnaccaOgrady_2009_Mouthparts <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_ecology_records\ -\ MagnaccaOgrady_2014_Mouthparts.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F)
ecology_Hardy_2001_Haleakala <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_ecology_records\ -\ Hardy_2001_Haleakala.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F)
ecology_MagnaccaOgrady_2008_Nudidrosophila <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_ecology_records\ -\ MagnaccaOgrady_2008_Nudidrosophila.tsv",sep="\t",colClasses = c("character"),header=T,stringsAsFactors=F)

ecology <- ecology_Magnacca_2007_HostPlants

new_ec <- ecology %>% make_scientific_name %>% update_name  
