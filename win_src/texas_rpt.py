import sqlite3
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from reportlab.lib.units import inch, cm

class create_attr_from_dict(object):
    def __init__(self,dict_rec):
        for k, v in dict_rec.items():
            setattr(self, k, v)

conn = sqlite3.connect('c:/bruske/data/bruske.db')

cursor = conn.cursor()
cursor.execute('select * from texassumrpt')
data = cursor.fetchall()
col_names = [desc[0] for desc in cursor.description]

def tax_detail(tt,rec,line_cnt):
    tt.drawString(18, 570-(24*line_cnt), tsr.name)
    tt.drawString(198, 570-(24*line_cnt), str(tsr.taxno))
    tt.drawRightString(390, 570-(24*line_cnt), str(int(tsr.totsale)))
    tt.drawString(432, 570-(24*line_cnt), str(tsr.taxpct))
    taxamt = round(int(tsr.totsale) * float(tsr.taxpct),2)
    tt.drawRightString(585, 570-(24*line_cnt), str(taxamt))

def tax_page_total(tt,page_total):
    tt.drawRightString(475, 46, str(page_total))
           
tt = canvas.Canvas("Texas_Tax_Rpt.pdf", pagesize=letter)
width, height = letter


line_cnt = 0
page_total_amt = 0.0

for rec in data:
    dict_rec = dict(zip(col_names, rec))
    tsr = create_attr_from_dict(dict_rec)
    if tsr.name.rstrip() <> "Texas Tax":
        if line_cnt > 20:
            tax_page_total(tt,page_total_amt)
            page_total_amt = 0.0
            line_cnt = 0
            tt.showPage()
            tax_detail(tt,tsr,line_cnt)
            line_cnt += 1
            page_total_amt += round(int(tsr.totsale) * float(tsr.taxpct), 2)
        else:
            tax_detail(tt,tsr,line_cnt)
            line_cnt += 1
            page_total_amt += round(int(tsr.totsale) * float(tsr.taxpct), 2)
    else:
        tax_detail(tt,tsr,line_cnt)
        tt.showPage()

if line_cnt < 21:
    tax_page_total(tt,page_total_amt)
    tt.showPage()

tt.save()
