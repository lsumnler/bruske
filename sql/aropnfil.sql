drop table if exists aropnfil;

create table aropnfil ( 
cust_no char(6),
doc_date date,
doc_no int(6),
doc_type char(1),
apply_to_no int(6),
doc_due_date date,
amt1 decimal(6, 2),
amt2 decimal(5, 2),
ref char(30),
slsmn1 char(3),
slsmn2 char(3),
slsmn3 char(3),
amt3 decimal(5, 2),
city_county_tax int(7),
primary key (cust_no, doc_date, doc_no, doc_type, apply_to_no)
);

create index apply_to on aropnfil (apply_to_no, cust_no);

create index texas_tax on aropnfil (city_county_tax);
