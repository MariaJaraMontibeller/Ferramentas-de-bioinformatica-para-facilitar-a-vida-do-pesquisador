# instalação de pacotes

# https://www.bioconductor.org/packages/devel/bioc/vignettes/dada2/inst/doc/dada2-intro.html

library(dada2); packageVersion("dada2")

#http://benjjneb.github.io/dada2/

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("dada2", version = "3.16")

# BiocManager::install("dada2", version = "3.17")

library(dada2); packageVersion("dada2")

fnF1 <- system.file("extdata", "sam1F.fastq.gz", package="dada2")
fnR1 <- system.file("extdata", "sam1R.fastq.gz", package="dada2")
filtF1 <- tempfile(fileext=".fastq.gz")
filtR1 <- tempfile(fileext=".fastq.gz")

plotQualityProfile(fnF1) # Forward
plotQualityProfile(fnR1) # Reverse
filterAndTrim(fwd=fnF1, filt=filtF1, rev=fnR1, filt.rev=filtR1,
              trimLeft=10, truncLen=c(240, 200), 
              maxN=0, maxEE=2,
              compress=TRUE, verbose=TRUE)
## Read in 1500 paired-sequences, output 890 (59.3%) filtered paired-sequences.

