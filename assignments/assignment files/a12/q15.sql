create or replace procedure prc_cust_add(
      C_NUM in customer.cust_num%type, 
      C_LNAME in customer.cust_lname%type, 
      C_FNAME in customer.cust_fname%type, 
      C_BAL in customer.cust_balance%type, 
      C_DOB in customer.cust_dob%type, 
      C_AGE in customer.cust_age%type)
is
begin

  insert into customer
  ("CUST_NUM", "CUST_LNAME", "CUST_FNAME", "CUST_BALANCE", "CUST_DOB", "CUST_AGE")
  values (C_NUM, C_LNAME, C_FNAME, C_BAL, C_DOB, C_AGE);
  
  commit;
end;
/

/* Tried adding the new record. Doesn't make any sense though. The record that they are asking you to add
doesn't include all of the column values that you need. Because of this, I didn't add any new records*/