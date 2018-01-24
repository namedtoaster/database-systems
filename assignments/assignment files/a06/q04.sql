SELECT v.vendor_name, i.invoice_id, invoice_sequence, line_item_amt
FROM vendors v JOIN invoices i
  ON v.vendor_id = i.vendor_id
JOIN invoice_line_items ili
  ON i.invoice_id = ili.invoice_id
WHERE invoice_sequence > 1