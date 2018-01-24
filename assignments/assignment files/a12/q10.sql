alter table
customer
add
(
CUST_DOB DATE,
CUST_AGE NUMBER
)

update customer
set cust_dob = '15-Mar-1979'
where cust_num = 1000

update customer
set cust_dob = '22-Dec-1988'
where cust_num = 1001

update customer
set cust_age = round((sysdate - cust_dob) / 365)