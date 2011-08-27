#  This script updates the aropnfil city_county_tax with the city_county_tax from
#  the customer file.

update aropnfil a, custfile c set a.city_county_tax = c.city_county_tax where a.cust_no = c.cust_no;
