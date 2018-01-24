SELECT DISTINCT vendor_name
FROM vendors
WHERE vendor_id IN (SELECT i.vendor_id FROM invoices i)
ORDER BY vendor_name