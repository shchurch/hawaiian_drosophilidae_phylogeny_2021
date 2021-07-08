### This code was started by SHC in Jan 2021
### This gives the commands used to build the R environment from which
###    all analyses were performed
 
# build an R environment with base R
conda create -n r-phylo-4.0.3 -c conda-forge -c bioconda r-base=4.0.3 gdal libgdal r-rgdal r-gdalutils r-sf udunits2 r-devtools r-magick r-tidyverse r-ggplot2 bioconductor-ggtree
# activate the environment
conda activate r-phylo-4.0.3

# install R packages
R
install.packages("ape")
install.packages("nlme")
install.packages("phytools")
devtools::install_github("uyedaj/bayou")
install.packages("surface")

install.packages("kableExtra")
install.packages("ggplotify")
install.packages("ggnewscale")
install.packages("gridExtra")
install.packages("Rphylopars")
install.packages("viridis")
install.packages("ggimage")
devtools::install_github("thibautjombart/treespace")

install.packages("rmarkdown")
install.packages("bookdown")

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("ggtree")

# install.pacakges("seqinr")
# install.packages("rentrez")



