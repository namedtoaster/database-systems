SELECT vendor_id, SUM(invoice_total) AS "INVOICE_TOTAL"
FROM invoices
GROUP BY vendor_id
ORDER BY vendor_id;