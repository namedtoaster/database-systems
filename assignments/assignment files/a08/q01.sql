SELECT to_char(invoice_total, '9999.99'), to_char(invoice_total, '000099'), SUBSTR('0000000' + CAST(invoice_total as varchar(7)), -7)
FROM invoices;