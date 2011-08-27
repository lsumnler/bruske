drop table if exists balances;

create table balances
select a.apply_to_no, a.amt1, a.amt2, a.amt3, 
sum(a.amt1 + a.amt2) as balance, a.city_county_tax 
from aropnfil a
group by a.apply_to_no;

drop table if exists texaspaid;

create table texaspaid
select * from balances b
where b.balance = 0 and b.city_county_tax != 0;

drop table if exists texasinv;

create table texasinv 
SELECT t.apply_to_no, a.amt1, a.amt2, t.city_county_tax FROM texaspaid t 
join aropnfil a on t.apply_to_no = a.apply_to_no 
where a.doc_type = 'I' and a.amt2 > 0;

drop table if exists texastaxwrk;

create table texastaxwrk select * from texasinv i join taxcode t on i.city_county_tax = t.taxno;

drop table if exists texastax;

create table texastax
SELECT (w.amt1), (w.amt2), (w.amt1 * .0625) as stateamt, 
w.cityname, w.cityno, w.citytax, (w.amt1 * w.citytax) as cityamt, 
w.countyname, w.countyno, w.countytax, (w.amt1 * w.countytax) as countyamt, 
w.spdname, w.spdno, w.spdtax, (w.amt1 * w.spdtax) as spdamt, 
w.transitname, w.transitno, w.transittax, (w.amt1 * w.transittax) as transitamt, 
w.spd2name, w.spd2no, w.spd2tax, (w.amt1 * w.spd2tax) as spd2amt, 
w.transit2name, w.transit2no, w.transit2tax, (w.amt1 * transit2tax) as transit2amt 
FROM texastaxwrk w order by w.cityno;

drop table if exists texasdtlrpt;
drop table if exists texassumrpt;

create table texasdtlrpt
select "Texas Tax                     " as name, 0 as taxno, t.amt1, 0.06250 as taxpct, t.stateamt
from texastax t;

insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
select cityname, cityno, amt1, citytax, cityamt
from texastax; 

insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
select countyname, countyno, amt1, countytax, countyamt
from texastax; 

insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
select spdname, spdno, amt1, spdtax, spdamt
from texastax; 

insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
select transitname, transitno, amt1, transittax, transitamt
from texastax; 

insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
select spd2name, spd2no, amt1, spd2tax, spd2amt
from texastax; 

insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
select transit2name, transit2no, amt1, transit2tax, transit2amt
from texastax; 

create table texassumrpt
SELECT t.name, t.taxno, sum(t.amt1) as totsale, t.taxpct, sum(t.stateamt) as tottaxamt
FROM texasdtlrpt t 
where t.stateamt != 0
group by t.taxno;

SELECT *
FROM texassumrpt
INTO OUTFILE '/tmp/texassumrpt.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"';
