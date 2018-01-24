SELECT vendor_name, COUNT(invoice_id) AS "NUMBER INVOICES", SUM(invoice_total) AS "INVOICE TOTAL"
FROM vendors ven JOIN invoices inv
ON ven.vendor_id = inv.vendor_id
GROUP BY vendor_name
ORDER BY COUNT(invoice_id) DESC;