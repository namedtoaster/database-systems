
SELECT invoice_number AS "Number", invoice_total AS "Total", (payment_total + credit_total) AS "Credits",
(invoice_total - (payment_total + credit_total)) AS "Balance Due"
FROM invoices;

SELECT invoice_number AS "Number", invoice_total AS "Total", (payment_total + credit_total) AS "Credits",
(invoice_total - (payment_total + credit_total)) AS "Balance Due"
FROM invoices
WHERE (invoice_total - (payment_total + credit_total)) >= 500;

SELECT invoice_number AS "Number", invoice_total AS "Total", (payment_total + credit_total) AS "Credits",
(invoice_total - (payment_total + credit_total)) AS "Balance Due"
FROM invoices
WHERE (invoice_total - (payment_total + credit_total)) >= 500
ORDER BY (invoice_total - (payment_total + credit_total)) DESC;

SELECT invoice_number AS "Number", invoice_total AS "Total", (payment_total + credit_total) AS "Credits",
(invoice_total - (payment_total + credit_total)) AS "Balance Due"
FROM invoices
WHERE (invoice_total - (payment_total + credit_total)) >= 500
AND ROWNUM >= 10
ORDER BY (invoice_total - (payment_total + credit_total)) DESC;