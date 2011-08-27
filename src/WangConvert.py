#!/usr/bin/python
import time

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

        self.tuple = tuple(field_list)

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


