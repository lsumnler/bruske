# This program the binary customer file to a MySql file
# The program calls the WangCovert module to convert
#    the ASCII packed decimal fields to decimal

import sqlite3
import WangConvert

conn = sqlite3.connect('c:/bruske/data/bruske.db')

cursor = conn.cursor()
cursor.execute("delete from custfile")
cursor.execute("select * from custfile")

col_names = [cn[0] for cn in cursor.description]

path = 'c:/bruske/data/'

custfile_fd = [
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

custfile = WangConvert.WangFile('ZCUSTFI.BIN', path, custfile_fd, custfile_len)
for i in custfile.yieldwangrec():
    rec = custfile.wangread(i)
    fields = ', '.join(col_names)
    query = "insert into custfile (%s) values(" % fields
    myvalues = '?,'*(len(custfile.tuple)-1)+"?)"
    thequery = query + myvalues
    
    cursor.execute(thequery, custfile.tuple)

conn.commit()
conn.close()
 
