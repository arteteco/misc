#!/bin/bash

# I am a very simple script. Put me in a folder with a mdb file and I'll extract all the tables in csv format and convert them in dbf format.
# You'll need to install mdb-tools (https://github.com/brianb/mdbtools)


if [ -d "dbase" ]; then
echo "dbase folder exists already. Good.
else
mkdir dbase
echo "dbase folder doesn't exists. Creating it"
fi

filemdb=$(ls *.mdb)


tables=$(mdb-tables $filemdb)

echo "exporting tables in csv"

for t in $tables
do mdb-export $(ls *.mdb) $t > dbase/$t.csv
done

echo "Done, now converting to dbf"

cd dbase

for f in *.csv; do libreoffice --convert-to dbf "$f" --headless; done

if [ -d "csv" ]; then
echo "csv folder already exists. Good"
else
mkdir csv
echo "cleaning up all the csv and putting them in csv folder"
fi

mv *.csv csv/

echo "Done"


