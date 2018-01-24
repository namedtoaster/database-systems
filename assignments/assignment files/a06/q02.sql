SELECT invoice_number, invoice_total
FROM invoices
WHERE payment_total > (SELECT AVG(payment_total)
                      FROM invoices)
ORDER BY invoice_number