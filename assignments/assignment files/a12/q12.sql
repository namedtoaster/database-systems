update customer
set cust_age = round((sysdate - cust_dob) / 365)