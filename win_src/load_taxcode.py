#!/usr/bin/python

#  This program takes a CSV file whose first record is the field names of the
#  columns and strips off the column name record and appends a key field
#  as the first field of each record.
#  The output file is then used in an sql script (load_taxdode.sql) to load the
#  taxcode table in the texas database.

import csv

path = "/home/lenyel/bruske/data/"
csv_input = open(path + "cityrate.fnm", "rb")
csv_output = open(path + "cityrate.csv", "wb")

keycnt = 0

column_names = csv_input.readline()

for rec in csv_input:
    keycnt += 1
    rec_wkey = str(keycnt) + ',' + rec
    csv_output.write(rec_wkey)

csv_input.close()
csv_output.close()