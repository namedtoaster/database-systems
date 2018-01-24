create or replace procedure prc_invoice_add(
      inum in invoice.inv_num%type, 
      cnum in invoice.cust_num%type, 
      idate in invoice.inv_date%type, 
      iamount in invoice.inv_amount%type)
is
begin

  insert into invoice
  ("INV_NUM", "CUST_NUM", "INV_DATE", "INV_AMOUNT")
  values (inum, cnum, idate, iamount);
  
  commit;
end;
/