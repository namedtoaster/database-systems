SELECT gla.account_number AS "ACCOUNT NUMBER", SUM(line_item_amt) AS "LINE ITEM AMT TOTAL"

FROM invoice_line_items ili JOIN general_ledger_accounts gla ON 
ili.account_number = gla.account_number
GROUP BY ROLLUP (gla.account_number);