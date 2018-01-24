SELECT vendor_name, SUM(payment_total) AS "PAYMENT TOTAL"
FROM vendors ven JOIN invoices inv 
ON ven.vendor_id = inv.vendor_id
GROUP BY vendor_name
ORDER BY SUM(payment_total) DESC
