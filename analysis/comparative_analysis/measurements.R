#R
library(dplyr)
library(ggplot2)

source("analysis/comparative_analysis/species.R")
measurements_Starmer_2003_OvarioleNumber <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Starmer_2003_OvarioleNumber.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Starmer_2003_OvarioleNumber")
measurements_Grimshaw_1901_FaunaHawaiiensis <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Grimshaw_1901_FaunaHawaiiensis.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Grimshaw_1901_FaunaHawaiiensis")
measurements_Hardy_1966_Descriptions_VIII <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Hardy_1966_Descriptions_VIII.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Hardy_1966_Descriptions_VIII")
measurements_HardyKaneshiro_1975_MiscStudies <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ HardyKaneshiro_1975_MiscStudies.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="HardyKaneshiro_1975_MiscStudies")
measurements_Ogrady_2001_Rustica <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Ogrady_2001_Rustica.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Ogrady_2001_Rustica")
measurements_Bryan_1934_ReviewDescriptions <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Bryan_1934_ReviewDescriptions.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Bryan_1934_ReviewDescriptions")
measurements_HardyKaneshiro_1969_Descriptions_IV <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ HardyKaneshiro_1969_Descriptions_IV.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="HardyKaneshiro_1969_Descriptions_IV")
measurements_Craddock_2016_GenomeSize <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Craddock_2016_GenomeSize.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Craddock_2016_GenomeSize")
measurements_Kambysellis_1971_Oogenesis <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Kambysellis_1971_Oogenesis.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Kambysellis_1971_Oogenesis")
measurements_Bryan_1938_KeyDescription <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Bryan_1938_KeyDescription.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Bryan_1938_KeyDescription")
measurements_HardyKaneshiro_1968_71_72_NewPW_I_II_III <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ HardyKaneshiro_1968_71_72_NewPW_I_II_III.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="HardyKaneshiro_1968_71_72_NewPW_I_II_III")
measurements_Hackman_1959_Scaptomyza <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Hackman_1959_Scaptomyza.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Hackman_1959_Scaptomyza")
measurements_MagnaccaOgrady_2008_Nudidrosophila <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ MagnaccaOgrady_2008_Nudidrosophila.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="MagnaccaOgrady_2008_Nudidrosophila")
measurements_Hardy_1977_Antopocerus <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Hardy_1977_Antopocerus.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Hardy_1977_Antopocerus")
measurements_Hardy_1979_ModifiedTarsus <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Hardy_1979_ModifiedTarsus.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Hardy_1979_ModifiedTarsus")
measurements_OgradyKamPerreira_2003_Mimica <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ OgradyKamPerreira_2003_Mimica.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="OgradyKamPerreira_2003_Mimica")
measurements_MagnaccaOgrady_2009_Mouthparts <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ MagnaccaOgrady_2009_Mouthparts.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="MagnaccaOgrady_2009_Mouthparts")
measurements_Hardy_2001_Haleakala <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Hardy_2001_Haleakala.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Hardy_2001_Haleakala")
measurements_Hardy_1965_InsectsOfHawaii <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Hardy_1965_InsectsOfHawaii.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Hardy_1965_InsectsOfHawaii")
measurements_miscellaneous_measurements <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ miscellaneous_measurements.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="miscellaneous_measurements")
measurements_Sarikaya_2019_Reproductive <- read.delim(file="analysis/comparative_analysis/trait_data/HI_Dros_measurements\ -\ Sarikaya_2019_Reproductive.tsv",sep="\t",colClasses = c("character"),header=T,na.strings=c("NA",""),stringsAsFactors=F)  %>%  mutate(publication="Sarikaya_2019_Reproductive")

measurements <- bind_rows(measurements_miscellaneous_measurements,
	measurements_Starmer_2003_OvarioleNumber,
	measurements_Grimshaw_1901_FaunaHawaiiensis,
	measurements_Hardy_1966_Descriptions_VIII,
	measurements_HardyKaneshiro_1975_MiscStudies,
	measurements_Ogrady_2001_Rustica,
	measurements_Bryan_1934_ReviewDescriptions,
	measurements_HardyKaneshiro_1969_Descriptions_IV,
	measurements_Craddock_2016_GenomeSize,
	measurements_Kambysellis_1971_Oogenesis,
	measurements_Bryan_1938_KeyDescription,
	measurements_HardyKaneshiro_1968_71_72_NewPW_I_II_III,
	measurements_Hackman_1959_Scaptomyza,
	measurements_MagnaccaOgrady_2008_Nudidrosophila,
	measurements_Hardy_1977_Antopocerus,
	measurements_Hardy_1979_ModifiedTarsus,
	# this paper has measurements that are not consistent with other publications - different method of measuring?
	#measurements_OgradyKamPerreira_2003_Mimica,
	measurements_MagnaccaOgrady_2009_Mouthparts,
	measurements_Hardy_2001_Haleakala,
	measurements_Hardy_1965_InsectsOfHawaii,
	measurements_Sarikaya_2019_Reproductive)

ms <- measurements %>% make_scientific_name %>% update_name 

max_min_pattern <- "^\\ *([0-9]+\\.?[0-9]*)\\ *\\-\\ *([0-9]+\\.?[0-9]*)$"
ave_max_min_pattern <- "^\\ *([0-9]+\\.?[0-9]*)\\ *\\(([0-9]+\\.?[0-9]*)\\ *\\-\\ *([0-9]+\\.?[0-9]*)\\)$"
ave_dev_pattern <- "^([0-9]+\\.?[0-9]*)\\ \\±\\ ([0-9]+\\.?[0-9]*)$"
single_pattern <- "^\\ *([0-9]+\\.?[0-9]*)$\\ *"

extract_trait <- function(trait_df,trait_name){
	new_trait_df <- trait_df %>% dplyr::select(trait) %>% 
	tidyr::extract(trait,c("mintrait","maxtrait"),max_min_pattern,remove=F) %>% 
	tidyr::extract(trait,c("medtrait","lowtrait","hightrait"),ave_max_min_pattern,remove=F) %>% 
	tidyr::extract(trait,c("avetrait","devtrait"),ave_dev_pattern,remove=F) %>% 
	tidyr::extract(trait,c("sngtrait"),single_pattern,remove=F) %>%
	mutate(mintrait = as.numeric(mintrait),
		maxtrait = as.numeric(maxtrait),
		lowtrait = as.numeric(lowtrait),
		medtrait = as.numeric(medtrait),
		hightrait = as.numeric(hightrait),
		avetrait = as.numeric(avetrait),
		devtrait = as.numeric(devtrait),
		sngtrait = as.numeric(sngtrait)) %>% 
	mutate(!!paste("low",trait_name,sep="_") := ifelse(!is.na(devtrait),avetrait - devtrait,
				ifelse(!is.na(lowtrait),lowtrait,
					ifelse(!is.na(mintrait),mintrait,
						sngtrait))),
		!!paste("med",trait_name,sep="_") := ifelse(!is.na(devtrait),avetrait,
				ifelse(!is.na(lowtrait),medtrait,
					ifelse(!is.na(mintrait),mintrait + ((maxtrait - mintrait)/2),
						sngtrait))),
		!!paste("hi",trait_name,sep="_") := ifelse(!is.na(devtrait),avetrait + devtrait,
				ifelse(!is.na(lowtrait),hightrait,
					ifelse(!is.na(mintrait),maxtrait,
						sngtrait)))) %>% 
	dplyr::select(-c(mintrait,mintrait,maxtrait,avetrait,devtrait,sngtrait,medtrait,lowtrait,hightrait,trait))
	return(new_trait_df)
}

trait_list <- c("BL","TL","WL","TL.WL","EL","EW","ON")
new_ms <- lapply(trait_list,function(x){ms %>% mutate(trait = !!sym(x)) %>% extract_trait(.,x)}) %>% bind_cols(ms,.)

