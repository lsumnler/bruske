#!/usr/bin/python

#  This program takes a cobol fd copybook and converts it to python list of
#  fieldnames, type, length, and decimal precision

import sys

f_path = '/home/lenyel/bruske/fd/'
f_name = sys.argv[1]

fd = open(f_path + f_name, 'r')

def fmtline(fieldline):
    size = ''
    type = ''
    dec = ''
    codeline = []
    if fieldline.count('COMP.') > 0:
        left = fieldline[3].find('(') + 1
        right = fieldline[3].find(')')
        num = fieldline[3][left:right].lstrip()
        if fieldline[3].count('V'):
            left = fieldline[3].find('V') + 1
            dec = int(len(fieldline[3][left:]))
            size = ((int(num) + int(dec)) / 2) + 1
        else:
            size = (int(num) / 2) + 1
            dec = 0
        type = 'Pdec'
    elif fieldline[3][0] in ('X', '9'):
        dec = 0
        left = fieldline[3].find('(') + 1
        right = fieldline[3].find(')')
        size = int(fieldline[3][left:right].lstrip('0'))
        if fieldline[3][0] == 'X':
            type = 'Xstr'
        else:
            type = 'Xint'
    else:
        dec = 0
        left = fieldline[3].find('(') + 1
        right = fieldline[3].find(')')
        size = int(fieldline[3][left:right].lstrip('0'))
        if fieldline[3][0] == 'X':
            type = 'Xint'
    codeline.append(fieldline[1].replace('-', '_').replace('.', '').lower())
    codeline.append(type)
    codeline.append(size)
    codeline.append(dec)
    return codeline

wrkfd = []
rec_len = 0

for line in fd:
    if line[6] == '*':      # drop comment lines
        continue
    newline = line.split()
    if len(newline) == 1:   # drop blank line
        continue
    newline = newline[1:]
    if 'FILENAME' in newline:
        filename = newline[-1].replace('"','').lower()
        filename = filename.replace('.','')
        output = open('/home/lenyel/bruske/fd/'+filename+'.fd', 'w')
        code = filename + ' = [\n'
        output.write(code)
    elif newline[0].isdigit() and 'PIC' in newline:
        wrkfd.append(fmtline(newline))
        rec_len += wrkfd[-1][-2]

fd.close()

fmtfd = []

for wrkline in wrkfd[:-1]:
    fmtline = str(tuple(wrkline)) + ',\n'
    output.write(fmtline)

fmtline = tuple(wrkfd[-1])
fmtline = str(fmtline) + '\n'
output.write(fmtline)

lastline = ']\n'
output.write(lastline)

lenrec = filename + '_len = ' + str(rec_len)
output.write(lenrec)

output.close()
