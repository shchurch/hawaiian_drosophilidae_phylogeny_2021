# hawaiian_drosophilidae_phylogeny_2021
Data and code to reproduce the analyses and figures in the manuscript: "Phylotranscriptomics reveals discordance in the phylogeny of Hawaiian _Drosophila_ and _Scaptomyza_ (Diptera: Drosophilidae) (submitted)"

This repository contains the following files:

- `Hawaiian_Drosophila_phylogeny_manuscript.Rmd`

This Rmarkdown file generates the main manuscript file, reading in figures and exporting a pdf.

- `Hawaiian_Drosophila_phylogeny_supplement.Rmd`

This Rmarkdown file generates the supplementary methods, and includes all of the R code used to analyze the data and generate figure panels.

- `figure_panels/`

This directory contains figures used in the manuscript. This is where the output of `Hawaiian_Drosophila_phylogeny_supplement.Rmd` prints panels and where both Rmd files read figure files from.

- `analysis/`

	- `data/`

	This directory includes assembed transcriptomes and agalma reports in the directory `assemblies_and_reports/`. It also includes data on the taxa included in the study, collection sites, genome accession information, sequencing reads information. 

	The directory `DNA_barcoding/` includes newly generated DNA vouchers for male and female specimens, as well as downloaded existing barcode sequences, alignments, and estimated gene trees.


	- `phylotranscriptomics/`

	This directory contains all analyses for estimating the phylogeny using genomic and transcriptomic data. Each subdirectory contains the commands used for individual software packages, as well as results. These include `agalma`, `IQtree` on two supermatrices (full occupancy, dataset 59, and reduced occupancy, dataset 60), `RAxML` (under `speciestree-166/`), `PhyloBayes`, `ASTRAL`, and `SOWHAT`.

	The `concordance_factor/` directory contains a script for building all possibly permutations of a phylogeny (`all_trees.py`) the set of all possible trees, the commands for analyzing discordance across all trees using IQtree, and the results.

	The directory `spruceup` describes commands to clean the supermatric of poorly aligned sequence fragments. The directory `partitions_59` describes commands for the quartet mapping analysis.

	- `time-calibrated_phylogenetics/`

	This directory contains all the accession numbers, downloaded sequences, and alignments for all genes in the expanded phylogenetic analysis. The commands used to download and process these files are in the file `download_and_select_sequences.R`

	The commands used to execute the expanded phylogenetic analysis, and the results, and in the subdirectories `iqtree/` and `beast/`.

	- `comparative_analysis/`

	This directory contains all the results from the comparative analyses of trait evolution. The commands used to execute these analyses are included in the Rmarkdown file for the supplementary methods. The results from these analyses described in this manuscript are included as RData files from the packages `SURFACE` and `phytools`. In the case of the R package `bayou`, results are contained in individual directorys according to the trait being analyzed, e.g. ovariole number, listed as `bayou_ON`.

	The data for these analyses are drawn from previously published descriptions of Hawaiian Drosophilidae. This is part of an ongoing project to digitize and database information on this lineage. Each file in the directory `trait_data/` is a tab-delimited file with digital record of one or more traits from a publication, which are indicated by the identifiers in the titles of the trait files. These traits include morphological measurements, ecological records, genetic accession numbers, as well as tables of species descriptions and taxonomic changes. R commands for interpreting these trait files are included in the scripts `ecology.R`, `measurements.R`, and `species.R`.

### INSTRUCTIONS

```
### set up conda environment

# follow steps in build_conda_environment.sh
# or see package version info in conda_environment_package_info.txt

### build the manuscript files

# knit the file
#    Hawaiian_Drosophila_phylogeny_supplement.Rmd 

# check that Hawaiian_Drosophila_phylogeny_supplement.RData was correctly saved

# then knit the file
#    Hawaiian_Drosophila_phylogeny_manuscript.Rmd 

```

