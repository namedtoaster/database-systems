SELECT invoice_number, invoice_date, invoice_date + 30, payment_date, (payment_date - invoice_date) as "days_to_pay",
to_char(invoice_date, 'mm') as "INV Date Month", to_char(invoice_date, 'YYYY') as "INV Date Year",
to_char(last_day(invoice_date), 'DD')
FROM invoices
WHERE 'MAY' = to_char(invoice_date, 'MON');