SELECT x.account_number, x.account_description
FROM general_ledger_accounts x LEFT OUTER JOIN invoice_line_items y
ON x.account_number = y.account_number;