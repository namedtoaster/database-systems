SELECT *
FROM vendors v JOIN invoices i
ON v.vendor_id = i.vendor_id
ORDER BY vendor_name;

