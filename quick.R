#!/usr/bin/env Rscript

library("rentrez")

# For testing purposes
#   args<-"DQ061874"

args = commandArgs(trailingOnly=TRUE)

r<-entrez_summary(db="nuccore", id=args)

p<-entrez_link(dbfrom="nuccore", id=args, db="all")

pub<-p$links$nuccore_pubmed

if(is.null(pub)){
  pub= 'No article found'
  
} else {
  
  pub=paste('https://www.ncbi.nlm.nih.gov/pubmed/?term=',pub, sep="")
}

gbl<-paste('https://www.ncbi.nlm.nih.gov/nuccore/', args, sep="")

pubm<-entrez_summary(db="pubmed", id=p$links$nuccore_pubmed)

if(is.null(pubm)){
  pubm= 'No article found'
  
}

auth<-do.call(paste,pubm$authors[1])

cat('Title:', r$title, "\n", 'Organism: ', r$organism, "\n", 'PubMed: ', pubm$title, "\n", 'Authors: ', auth, "\n",pub, "\n", 'GenBank: ', gbl, "\n")
