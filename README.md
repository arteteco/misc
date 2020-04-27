# misc
Just a place to put some little useful scripts

More details in the files, but in general:

* **mdbToDbf.sh** takes all the tables in a mdb MSAccess file and creates csv for each of them.
* **GBQuickSearch.R** is a command line utility. Takes as input a genebank code, and gives as output name of the paper, organism and more infos
* **GBQuickSearchFunc.R** is the same but wraps it up in a function to use it in R shell, so that all the data is gathered when called with `gbq("GBCODE")
