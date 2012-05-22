
import sqlite3
import WangConvert

conn = sqlite3.connect('c:/bruske/data/bruske.db')

cursor = conn.cursor()
cursor.execute("delete from gltrxfil")
cursor.execute("select * from gltrxfil")

#create_sql = """create table gltrxfil (
                #trx_acct_no char(21),
                #trx_date date,
                #trx_time int(6),
                #trx_amt decimal(7,2),
                #trx_srce char(6),
                #trx_ref char(30),
                #trx_consolidation char(1),
                #primary key (trx_acct_no, trx_date, trx_time))"""
                
#cursor.execute(create_sql)

col_names = [cn[0] for cn in cursor.description]

path = 'c:/bruske/data/'

gltrxfil_fd = [
('gl_trx_account_no', 'Xstr', 21, 0),
('gl_trx_date', 'Date', 6, 0),
('gl_trx_time', 'Xint', 6, 0),
('gl_trx_amount', 'Pdec', 7, 2),
('gl_trx_source', 'Xstr', 6, 0),
('gl_trx_reference', 'Xstr', 30, 0),
('gl_trx_consolidation_code', 'Xstr', 1, 0)
]
gltrxfil_len = 77

gltrxfil = WangConvert.WangFile('GLTRXFIL.bin', path, gltrxfil_fd, gltrxfil_len)
for i in gltrxfil.yieldwangrec():
    rec = gltrxfil.wangread(i)
    fields = ', '.join(col_names)
    query = "insert into gltrxfil (%s) values(" % fields
    myvalues = '?,'*(len(gltrxfil.tuple)-1)+"?)"
    thequery = query + myvalues

    cursor.execute(thequery, gltrxfil.tuple)

conn.commit()
conn.close()