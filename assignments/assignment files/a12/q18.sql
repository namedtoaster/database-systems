create or replace procedure prc_inv_delete(inum in invoice.inv_num%type)
is
begin

    delete from invoice
    where inv_num = inum;
    
    commit;
    
end;