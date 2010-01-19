#  This script takes a CSV file (cityrate.csv) and loades the
#  taxcode table in the texas database.
#  The CSV file is created in a python program load_taxcode.py

delete from taxcode;

load data local infile '/home/lenyel/bruske/data/cityrate.csv'
into table taxcode
columns terminated by ','
lines terminated by '\n';