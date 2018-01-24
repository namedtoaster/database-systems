SELECT vendor_name, invoice_number, invoice_date, (invoice_total - payment_total - credit_total) AS "BALANCE_DUE"
FROM vendors v JOIN invoices i
ON v.vendor_id = i.vendor_id
ORDER BY vendor_name;