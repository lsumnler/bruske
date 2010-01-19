
import MySQLdb
import WangConvert

conn = MySQLdb.connect(host = 'localhost',
                       user = 'root',
                       passwd = 'cesare%05',
                       db = 'texas_tax')

cursor = conn.cursor()
cursor.execute("delete from aropnfil")
cursor.execute("select * from aropnfil")

col_names = [cn[0] for cn in cursor.description]

path = '/home/lenyel/bruske/data/'

aropnfil_fd = [
('cust_no', 'Xstr', 6, 0),
('doc_date', 'Date', 6, 0),
('doc_no', 'Xint', 6, 0),
('doc_type', 'Xstr', 1, 0),
('apply_to_no', 'Xint', 6, 0),
('cust_no_alt', 'Drop', 6, 0),
('apply_to_no_alt', 'Drop', 6, 0),
('doc_due_date', 'Date', 6, 0),
('amt1', 'Pdec', 6, 2),
('amt2', 'Pdec', 5, 2),
('ref', 'Xstr', 30, 0),
('slsmn1', 'Xstr', 3, 0),
('slsmn2', 'Xstr', 3, 0),
('slsmn3', 'Xstr', 3, 0),
('amt3', 'Pdec', 5, 2)
]

aropnfil_len = 98

aropnfil = WangConvert.WangFile('AROPNFIL.bin', path, aropnfil_fd, aropnfil_len)
for i in aropnfil.yieldwangrec():
    rec = aropnfil.wangread(i)
    aropnfil.list.extend([' '])
    fields = ', '.join(col_names)
    query = "insert into aropnfil (%s) values(" % fields
    myvalues = '%s,'*(len(aropnfil.list)-1)+"%s)"
    thequery = query + myvalues

    cursor.execute(thequery, tuple(aropnfil.list))

conn.commit()
conn.close()
 
