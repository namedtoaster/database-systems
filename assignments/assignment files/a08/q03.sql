SELECT vendor_name, UPPER(vendor_name), SUBSTR(vendor_phone, -4), 
substr(vendor_name, instr(vendor_name, ' '), instr(vendor_name, ' ', instr(vendor_name, ' ') + 1) - instr(vendor_name, ' ')) AS "second_word",
REPLACE(REPLACE(REPLACE(REPLACE(vendor_phone, '(', ''), ')', ''), ' ', '.'), '-', '.') as "new_phone"
FROM vendors;