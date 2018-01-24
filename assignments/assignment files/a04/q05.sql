SELECT x.vendor_id, x.vendor_name, (x.vendor_contact_first_name || ' ' || x.vendor_contact_last_name) AS "contact_name"
FROM vendors x JOIN vendors y
ON x.vendor_id = y.vendor_id
ORDER BY x.vendor_contact_last_name;