SELECT invoice_number, to_char(invoice_total - payment_total, '9,999,999.00') as "balance_due"
FROM invoices;