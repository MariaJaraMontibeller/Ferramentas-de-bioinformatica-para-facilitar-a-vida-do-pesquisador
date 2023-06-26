# https://www.ufrgs.br/user/bioinformatica/

################### FAÇA SUA ANÁLISE FILOGENÉTICA ####################

#INSTALAÇÃO DO PACOTE DECIPHER (este pacote estaremos usando hoje, mas diversos estão disponíveis)
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("DECIPHER")

install.packages("Biostrings")
library(BiocManager)
library(Biostrings)
library(DECIPHER)
library(RSQLite)
library(parallel)
library(stats)
#INSIRA O ARQUIVO DE SEQUÊNCIAS QUE SERÁ USADO PARA AS ANÁLISES FILOGENÉTICAS (indicando a localização no seu computador)
fas <- "C:/Users/mjara/Downloads/sequencias_filogenia.txt"


#LEIA AS SEQUÊNCIAS 
dna <- readDNAStringSet(fas)
dna

#EXECUTE O ALINHAMENTO DAS SEQUÊNCIAS 
alinhamento <- AlignSeqs(dna)

#VISUALIZE O ALINHAMENTO DAS SEQUÊNCIAS 
BrowseSeqs(alinhamento, highlight=0)

#EXECUTE A ANÁLISE FILOGENÉTICA (inclui método de substituição nucleotídeo e método de inferência)
d <- DistanceMatrix(alinhamento, correction="Jukes-Cantor", verbose=FALSE)
c <- TreeLine(d, method="ML", cutoff=.03, showPlot=TRUE, myXStringSet=alinhamento, verbose=FALSE)

