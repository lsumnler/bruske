#!/usr/bin/python

#  This program reads in the binary aropnfil file downloaded from the Wang
#  and converts it to a CSV file (aropnfil.csv).  The subsequent CSV file
#  is then loaded into the MySQL table aropnfil in the texas database using
#  load_aropnfil.sql

import time


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

def yieldRecords( aFile, recSize ):
    recBytes= aFile.read(recSize)
    while recBytes:
        yield recBytes
        recBytes= aFile.read(recSize)

path = '/home/lenyel/bruske/data/'

aropen = open(path + 'AROPNFIL.bin', 'rb')
csvfile = open(path + 'aropnfil.csv', 'w')

aropnfil = [
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

for aropnrec in yieldRecords(aropen, aropnfil_len):
    start = 0
    reclist = []
    for name, type, size, dec in aropnfil:
        if type != 'Drop':
            if type == 'Xstr':
                recfield = aropnrec[start:start + size]
                recfield = recfield.replace('"', "'")
                if recfield.find(','):
                    recfield = '"' + recfield + '"'
            elif type == 'Xint':
                recfield = str(aropnrec[start:start + size])
            elif type == 'Date':
                try:
                    recfield = time.strftime('%Y-%m-%d', time.strptime(
                    aropnrec[start:start + size],'%y%m%d'))
                except ValueError:
                    recfield = '1972-01-01'
            elif type == 'Pdec':
                recfield = Pdec(aropnrec[start:start + size], size, dec).strvalue
            reclist.append(recfield)
        start += size

        
    recstr = ','.join(map(str,reclist))
    csvfile.write(recstr + ',0\n')

aropen.close()
csvfile.close()
            
