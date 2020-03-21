#!/usr/bin/env Rscript

# This scripts runs from the linux command line. It takes a single argument, which is the nucleotide GenBank code, and outputs title, caption, article reference and more. 
# It's damn easy to tweak

library("rentrez")

args = commandArgs(trailingOnly=TRUE)

r<-entrez_summary(db="nuccore", id=args)

p<-entrez_search(db="pubmed", term=r$title)

cat('Title:', r$title, "\n", 'Organism: ', r$organism, "\n", 'Caption:',r$caption, "\n", 'Tech: ', r$tech, "\n", 'Article: ', p$title, "\n")
