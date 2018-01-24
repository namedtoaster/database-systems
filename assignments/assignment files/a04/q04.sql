SELECT vendor_name, invoice_date, invoice_number, invoice_sequence, line_item_amt
FROM vendors ven INNER JOIN invoices inv
  ON ven.vendor_id = inv.vendor_id JOIN invoice_line_items li
  ON inv.invoice_id = li.invoice_id
ORDER BY ven.vendor_name, inv.invoice_date, inv.invoice_number, li.invoice_sequence;