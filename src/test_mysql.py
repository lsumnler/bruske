#!/usr/bin/python

import MySQLdb

#class rec_as_attr(dict):
#    def __getattr__(self, name):
#        return self[name]

class rec_as_attr(object):
    def __init__(self, adict):
        self.__dict__.update(adict)

conn = MySQLdb.connect(host = "localhost",

                       user = "root",
                       passwd = "cesare%05",
                       db = "texas_tax")

cursor = conn.cursor()

cursor.execute("Select * from custfile where state = 'AZ'")

col_names = [cn[0] for cn in cursor.description]
print col_names

for i in range(3):
    row = cursor.fetchone()
    if row == None:
        break
    rec = dict(zip(col_names, row))
    aro = rec_as_attr(rec)
    print aro.cust_no, aro.state
print "Number of rows returned: %d" % cursor.rowcount

cursor.close()
conn.close()
