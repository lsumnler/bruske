#  This script takes a CSV file (custfile.csv) and loades the
#  custfile table in the texas database.
#  The CSV file is created in a python program load_custfile.py

delete from custfile;

load data local infile '/home/lenyel/bruske/data/custfile.csv'
into table custfile
columns terminated by ','
enclosed by '"'
lines terminated by '\n';