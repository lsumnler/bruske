bruske
======

Bruske for Texas tax report

This small system creates a Report of Texas Taxes which report taxes owed to the State of Texas on sales made by the
company in the state of Texas on a monthly basis.  The report was originally created to fillin a standard form dictated 
by the state and is transmited at the end of each month.  The system orginally converted cobol files (Custfile, Aropnfil)
into a MySql data base tables but was switched over to Sqlite3 because there really was no need for network access to the 
datafiles.

date -- contains the cobol binary files which are downloaded from an Old Wang mini-computer which continues to run their
        accounting, order entry, inventory, and sales history.
        
fd -- contains the cobol copy books for the files necessary and corresponding python code labled as .fd which are created
      by a python program convert_fd.py located in the src directory.
      
sql -- contains some old sql used to test out some sql stuff which eventually was incorporated into various python programs

src -- contains all of the python program used to create the the Texas Tax Report.
       
       convert_fd.py - program that reads in a cobol copybook fd and create a python list.
       
       WangConvert.py - is a python module and consist of class objects used for converting binary files into 
                        Sqlite3 tables.
                        
       load_aropnfil_sql.py - converts the ar open file from binary to aropnfil table in Sqlite3
       
       load_custfile_sql.py - converts the customer file binary to custfile table in Sqlite3
       
       update_aropnfil_tax.py - runs several sql command to create a table used to create the report.
       
       texas_rpt.py - create the actual report in pdf formate using reportlab library.
       
The only real interesting part of the code is in the convert_fd.py which unpacks what is essentially a cobol comp-3 field\
or packed decimal field.  I found the code in a perl script and re-wrote it in python - google is your friend.
