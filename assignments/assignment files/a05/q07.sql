SELECT vendor_name, COUNT(DISTINCT(account_number)) AS "TOTAL NUMBER OF ACCTS"

FROM vendors v JOIN invoices i 
ON 
v.vendor_id = i.vendor_id JOIN invoice_line_items ili 
ON 
i.invoice_id = ili.invoice_id

GROUP BY vendor_name
ORDER BY COUNT(DISTINCT(account_number)) DESC;