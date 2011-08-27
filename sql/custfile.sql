drop table if exists custfile;

create table custfile (
cust_no char(6) not null,
name char(30) not null,
street_1 char(30),
street_2 char(30),
city char(15),
state char(2),
zip_code char(10),
country char(10),
territory char(2),
contact char(20),
phone_no char(12),
salesman char(3),
type char(5),
balance_method char(1),
statement_frequency char(1),
credit_status char(1),
credit_limit decimal(5, 0),
credit_rating char(4),
order_limit decimal(5, 0),
finance_charge_flag char(1),
ship_via_code char(2),
dflt_warehouse_locatn char(2),
freight_payment_code char(1),
partial_shipment_flag char(1),
terms_code char(1),
discount_percent decimal(3, 2),
tax_code char(3),
sales_last_year decimal(6, 2),
sales_period_to_date decimal(6, 2),
sales_year_to_date decimal(6, 2),
cost_period_to_date decimal(6, 2),
cost_year_to_date decimal(6, 2),
comm_period_to_date decimal(6, 2),
comm_year_to_date decimal(6, 2),
balance decimal(6, 2),
highest_balance_due decimal(6, 2),
highest_balance_date date,
last_payment_made decimal(6, 2),
last_payment_date date,
average_time_to_pay decimal(2, 0),
no_of_invoices_paid int(2),
comment char(30),
vendor_no char(15),
last_inv_date date,
last_inv_no char(6),
fed_tax_no char(10),
comment_2 char(30),
comment_3 char(30),
fax_no char(12),
contract char(4),
rdg_invoice int(6),
blot_it_invoice int(6),
prev_inv_date date,
prev_inv_no char(6),
salary_inv int(6),
skim_it_invoice int(6),
default_territory char(3),
survey char(1),
city_county_tax int(7),
primary key (cust_no)
);

create index cust_name on custfile (name);

create index texas_tax_cd on custfile (city_county_tax);
