#  This script takes a CSV file (aropnfil.csv) and loades the
#  aropnfil table in the texas database.
#  The CSV file is created in a python program load_aropnfil.py

delete from aropnfil;

load data local infile '/home/lenyel/bruske/data/aropnfil.csv'
into table aropnfil
columns terminated by ','
enclosed by '"'
lines terminated by '\n';