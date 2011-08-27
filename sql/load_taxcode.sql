delete from taxcode;

load data local infile '/home/lenyel/bruske/data/cityrate.csv'
into table taxcode
columns terminated by ','
lines terminated by '\n';
