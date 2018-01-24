SELECT *
FROM general_ledger_accounts
WHERE NOT EXISTS (SELECT * FROM vendors v where general_ledger_accounts.account_number = v.default_account_number)