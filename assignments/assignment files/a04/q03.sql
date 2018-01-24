/* Write a SELECT statement that returns three columns

vendor_name
default_account FROM vendors table

account_description AS description FROM General_Ledger_Accounts table*/

SELECT vendor_name, default_account_number AS "default_account", account_description AS "description"
FROM vendors v JOIN General_Ledger_Accounts gla
ON v.default_account_number = gla.account_number
ORDER BY account_description, vendor_name;