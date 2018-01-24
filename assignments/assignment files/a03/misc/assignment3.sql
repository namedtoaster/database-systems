SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors;

SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors
ORDER BY vendor_contact_last_name, vendor_contact_first_name;


SELECT (vendor_contact_last_name || ', ' || vendor_contact_first_name) AS full_name
FROM vendors
WHERE vendor_contact_last_name LIKE 'A%'
OR WHERE vendor_contact_last_name LIKE 'B%'
OR WHERE vendor_contact_last_name LIKE 'C%'
OR WHERE vendor_contact_last_name LIKE 'E%'
ORDER BY full_name;


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


SELECT (invoice_total - (payment_total + credit_total)) AS "Balance Due"
FROM invoices
WHERE (invoice_total - (payment_total + credit_total)) = 0 OR payment_date IS null;


SELECT 51000 AS "Starting Principal", (51000 * 1.1) AS "New Principal", ((51000 * 1.1) * .065) AS "Interest",
((51000 * 1.1) + ((51000 * 1.1) * 0.65)) AS "Principal + Interest"
TO_CHAR(sysdate, 'dd-mon-yyyy hh24:mi:ss') AS "System Date"
FROM dual;
