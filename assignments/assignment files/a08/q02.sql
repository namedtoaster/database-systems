SELECT to_char(invoice_date, 'DD-MON-YYYY HH24:MI:SS'), to_char(invoice_date, 'DD-MON-YYYY HH24:MI:SS PM'), cast(invoice_date AS varchar2(10))
FROM invoices;