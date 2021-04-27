# misc
Just a place to put some little useful scripts

More details in the files, but in general:

* **mdbToDbf.sh** takes all the tables in a mdb MSAccess file and creates csv for each of them.
* **GBQuickSearch.R** is a command line utility. Takes as input a genebank code, and gives as output name of the paper, organism and more infos
* **GBQuickSearchFunc.R** is the same but wraps it up in a function to use it in R shell, so that all the data is gathered when called with `gbq("GBCODE")
* **changeTrackers.py** is a command line script that takes as input the torrent file and a textfile with the tracker list
* **speechToText.py** takes as input a wav audio file and returns the transcribed text on screen. It's very raw but it's commented. It **requires** `pyAudio` and `SpeechRecognition` as libraries, system packages may depend on the OS. Check [This tutorial](https://towardsdatascience.com/easy-speech-to-text-with-python-3df0d973b426) for some more infos