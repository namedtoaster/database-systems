SELECT vendor_name, vendor_state, vendor_city
FROM vendors v
WHERE NOT EXISTS
(
    SELECT 1
    FROM vendors v2
    WHERE v2.vendor_id <> v.vendor_id
    AND v2.vendor_state = v.vendor_state
    AND v2.vendor_city = v.vendor_city
)