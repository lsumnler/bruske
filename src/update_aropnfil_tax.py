import sqlite3

conn = sqlite3.connect('/home/lenyel/bruske/bruske.db')

cursor = conn.cursor()
cursor.execute("""update aropnfil set city_county_tax =
               (select custfile.city_county_tax from custfile where aropnfil.cust_no = custfile.cust_no)""")

cursor.execute("drop table if exists balances")

cursor.execute("""create table balances as
                select apply_to_no, amt1, amt2, amt3, 
                sum(amt1 + amt2) as balance, city_county_tax 
                from aropnfil 
                group by apply_to_no""")

cursor.execute("drop table if exists texaspaid")
 
cursor.execute("""create table texaspaid as
                select * from balances b
                where b.balance = 0 and b.city_county_tax != 0""")

cursor.execute("drop table if exists texasinv")

cursor.execute("""create table texasinv as
               SELECT t.apply_to_no, a.amt1, a.amt2, t.city_county_tax
               FROM texaspaid t 
               join aropnfil a on t.apply_to_no = a.apply_to_no 
               where a.doc_type = 'I' and a.amt2 > 0""")

cursor.execute("drop table if exists texastaxwrk")

cursor.execute("""create table texastaxwrk as
               select * from texasinv i 
               join taxcode t on i.city_county_tax = t.taxno""")

cursor.execute('drop table if exists texastax')

cursor.execute("""create table texastax as
               SELECT (w.amt1), (w.amt2), (w.amt1 * .0625) as stateamt, 
               w.cityname, w.cityno, w.citytax, (w.amt1 * w.citytax) as cityamt, 
               w.countyname, w.countyno, w.countytax, (w.amt1 * w.countytax) as countyamt, 
               w.spdname, w.spdno, w.spdtax, (w.amt1 * w.spdtax) as spdamt, 
               w.transitname, w.transitno, w.transittax, 
               (w.amt1 * w.transittax) as transitamt, 
               w.spd2name, w.spd2no, w.spd2tax, (w.amt1 * w.spd2tax) as spd2amt, 
               w.transit2name, w.transit2no, w.transit2tax, 
               (w.amt1 * transit2tax) as transit2amt 
               FROM texastaxwrk w order by w.cityno""")

cursor.execute('drop table if exists texasdtlrpt')
cursor.execute('drop table if exists texassumrpt')

cursor.execute("""Create table texasdtlrpt (
               name char(30),
               taxno int(9),
               amt1 float,
               taxpct float,
               stateamt float)"""
               )

cursor.execute("""insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
               select "Texas Tax" as name, 0 as taxno, amt1, 0.06250 as taxpct, stateamt
               from texastax""")

#cursor.execute("""create table texasdtlrpt as
               #select "Texas Tax                            " as name, 0 as taxno, t.amt1, 0.06250 as taxpct, stateamt
               #from texastax t""")

cursor.execute("""insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
               select cityname, cityno, amt1, citytax, cityamt
               from texastax""")

cursor.execute("""insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
               select countyname, countyno, amt1, countytax, countyamt
               from texastax""")

cursor.execute("""insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
               select spdname, spdno, amt1, spdtax, spdamt
               from texastax""") 

cursor.execute("""insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
               select transitname, transitno, amt1, transittax, transitamt
               from texastax""")

cursor.execute("""insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
               select spd2name, spd2no, amt1, spd2tax, spd2amt
               from texastax""")

cursor.execute("""insert into texasdtlrpt (name, taxno, amt1, taxpct, stateamt)
               select transit2name, transit2no, amt1, transit2tax, transit2amt
               from texastax""")

cursor.execute("""create table texassumrpt as
               SELECT name, taxno, sum(amt1) as totsale, taxpct, 
               sum(stateamt) as tottaxamt
               FROM texasdtlrpt
               where stateamt != 0
               group by taxno""")

conn.commit()
conn.close()
 
