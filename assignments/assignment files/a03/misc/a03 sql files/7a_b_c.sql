SELECT invoice_due_date AS "Due Date", invoice_total AS "Invoice Total", (.10 * invoice_total) AS "10%"
(invoice_total * .1 + invoice_total) AS "Plus 10%"
FROM invoices;

SELECT invoice_due_date AS "Due Date", invoice_total AS "Invoice Total", (.10 * invoice_total) AS "10%",
(invoice_total * .1 + invoice_total) AS "Plus 10%"
FROM invoices
WHERE invoice_total >= 500 AND invoice_total <= 1000;

SELECT invoice_due_date AS "Due Date", invoice_total AS "Invoice Total", (.10 * invoice_total) AS "10%",
(invoice_total * .1 + invoice_total) AS "Plus 10%"
FROM invoices;
WHERE invoice_total >= 500 AND invoice_total <= 1000
ORDER BY invoice_due_date DESC;