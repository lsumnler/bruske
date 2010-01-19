#!/usr/bin/python

#  This program reads in the binary customer file downloaded from the Wang
#  and converts it to a CSV file (custfile.csv).  The subsequent CSV file
#  is then loaded into the MySQL table custfile in the texas database using
#  load_custfile.sql

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

zcustfi = open(path + 'ZCUSTFI.BIN', 'rb')
csvfile = open(path + 'custfile.csv', 'w')

custfile = [
('cust_no', 'Xstr', 6, 0),
('name', 'Xstr', 30, 0),
('street_1', 'Xstr', 30, 0),
('street_2', 'Xstr', 30, 0),
('city', 'Xstr', 15, 0),
('state', 'Xstr', 2, 0),
('zip_code', 'Xstr', 10, 0),
('country', 'Xstr', 10, 0),
('territory', 'Xstr', 2, 0),
('contact', 'Xstr', 20, 0),
('phone_no', 'Xstr', 12, 0),
('salesman', 'Xstr', 3, 0),
('type', 'Xstr', 5, 0),
('balance_method', 'Xstr', 1, 0),
('statement_frequency', 'Xstr', 1, 0),
('credit_status', 'Xstr', 1, 0),
('credit_limit', 'Pdec', 5, 0),
('credit_rating', 'Xstr', 4, 0),
('order_limit', 'Pdec', 5, 0),
('finance_charge_flag', 'Xstr', 1, 0),
('ship_via_code', 'Xstr', 2, 0),
('dflt_warehouse_locatn', 'Xstr', 2, 0),
('freight_payment_code', 'Xstr', 1, 0),
('partial_shipment_flag', 'Xstr', 1, 0),
('terms_code', 'Xstr', 1, 0),
('discount_percent', 'Pdec', 3, 2),
('tax_code', 'Xstr', 3, 0),
('sales_last_year', 'Pdec', 6, 2),
('sales_period_to_date', 'Pdec', 6, 2),
('sales_year_to_date', 'Pdec', 6, 2),
('cost_period_to_date', 'Pdec', 6, 2),
('cost_year_to_date', 'Pdec', 6, 2),
('comm_period_to_date', 'Pdec', 6, 2),
('comm_year_to_date', 'Pdec', 6, 2),
('balance', 'Pdec', 6, 2),
('highest_balance_due', 'Pdec', 6, 2),
('highest_balance_date', 'Date', 6, 0),
('last_payment_made', 'Pdec', 6, 2),
('last_payment_date', 'Date', 6, 0),
('average_time_to_pay', 'Pdec', 2, 0),
('no_of_invoices_paid', 'Xint', 2, 0),
('comment', 'Xstr', 30, 0),
('vendor_no', 'Xstr', 15, 0),
('cust_last_inv_date', 'Date', 6, 0),
('filler1', 'Drop', 2, 0),
('cust_last_inv_no', 'Xstr', 6, 0),
('fed_tax_no', 'Xstr', 10, 0),
('comment_2', 'Xstr', 30, 0),
('comment_3', 'Xstr', 30, 0),
('fax_no', 'Xstr', 12, 0),
('contract', 'Xstr', 4, 0),
('rdg_invoice', 'Xint', 6, 0),
('blot_it_invoice', 'Xint', 6, 0),
('cust_prev_inv_date', 'Date', 6, 0),
('cust_prev_inv_no', 'Xstr', 6, 0),
('cust_salary_inv', 'Xint', 6, 0),
('skim_it_invoice', 'Xint', 6, 0),
('default_territory', 'Xstr', 3, 0),
('cust_survey', 'Xstr', 1, 0),
('city_county_tax', 'Xint', 7, 0),
('filler2', 'Drop', 3, 0)
]
custfile_len = 477

for custrec in yieldRecords(zcustfi, custfile_len):
    start = 0
    reclist = []
    for name, type, size, dec in custfile:
        if type != 'Drop':
            if type == 'Xstr':
                recfield = custrec[start:start + size]
                recfield = recfield.replace('"', "'")
                if recfield.find(','):
                    recfield = '"' + recfield + '"'
            elif type == 'Xint':
                recfield = str(custrec[start:start + size])
            elif type == 'Date':
                try:
                    recfield = time.strftime('%Y-%m-%d', time.strptime(
                    custrec[start:start + size],'%y%m%d'))
                except ValueError:
                    recfield = '1972-01-01'
            elif type == 'Pdec':
                recfield = Pdec(custrec[start:start + size], size, dec).strvalue
            reclist.append(recfield)
        start += size

        
    recstr = ','.join(map(str,reclist))
    csvfile.write(recstr + '\n')

zcustfi.close()
csvfile.close()
            
            
