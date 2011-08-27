#!/usr/bin/python

# Date:     October 4, 2009
# Author:   Len Sumnler
# This program take a Wang ASCII binary file and converts the file one
# record at a time converting packed decimal fields to string values
# returning a dictionary of a record.

import time
import MySQLdb

class WangFile(object):

    def __init__(self, filename, path, file_def, rec_len):

        self.wang_filename = filename
        self.path_to_wangfile = path
        self.wang_file_def = file_def
        self.wang_rec_len = rec_len

        self.wangfile_open = open(self.path_to_wangfile + self.wang_filename, 'rb')

    def yieldwangrec(self):
        self.wang_rec = self.wangfile_open.read(self.wang_rec_len)
        while self.wang_rec:
            yield self.wang_rec
            self.wang_rec = self.wangfile_open.read(self.wang_rec_len)
            
    def wangread(self,rec):
        self.position = 0
        field_list = []
        for name, type, size, dec in self.wang_file_def:
            if type == 'Xstr':
                field = rec[self.position:self.position + size]
            elif type == 'Xint':
                field = str(rec[self.position:self.position + size])
            elif type == 'Date':
                try:
                    field = (time.strftime('%Y-%m-%d', time.strptime(
                        rec[self.position:self.position + size], '%y%m%d')))
                except ValueError:
                    field = '1972-01-01'
            elif type == 'Pdec':
                field = Pdec(rec[self.position:self.position + size], size,
                             dec).strvalue
            elif type == 'Drop':
                self.position += size
                continue
            field_list.append(field)
            self.position += size

        self.list = field_list

class Pdec:
    def __init__(self, packed_value, size, dec_places):
        unpacked = ''
     
        precision = (size * 2) - 1
        for byte in packed_value[:-1]:
            upper_bits, lower_bits = divmod(ord(byte), 16)
            unpacked = unpacked + (str(upper_bits))
            unpacked = unpacked + (str(lower_bits))
            
        upper_bits, lower_bits = divmod(ord(packed_value[-1]), 16)
        unpacked = unpacked + (str(upper_bits))

        if lower_bits in (0x0b, 0x0d):
            sign = '-'
        else:
            sign = ''
        if dec_places == 0:
            unpacked = sign + unpacked[0:precision + 1].lstrip('0')
        else:
            unpacked = unpacked[0:precision - dec_places] + '.' \
            + unpacked[precision - dec_places:precision]
            unpacked = sign + unpacked[0:precision + 1].lstrip('0')
        
        if unpacked == '':
            unpacked = 0

        self.strvalue = unpacked

class rec_as_attr(object):
    def __init__(self, adict):
        self.__dict__.update(adict)

if __name__ == '__main__':

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

    aropnfil = WangFile('AROPNFIL.bin', path, aropnfil_fd, aropnfil_len)
    for i in aropnfil.yieldwangrec():
        rec = aropnfil.wangread(i)
        aropnfil.list.extend([' '])
        fields = ', '.join(col_names)
        print fields

        query = "insert into aropnfil (%s) values(" % fields
        myvalues = '%s,'*(len(aropnfil.list)-1)+"%s)"
        thequery = query + myvalues
        print query
        print myvalues
        print thequery
        print tuple(aropnfil.list)

        cursor.execute(thequery, tuple(aropnfil.list))

    conn.commit()
    conn.close()
    




