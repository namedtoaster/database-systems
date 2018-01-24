select sum(invoice_total)
from (select vendor_id, max(invoice_total) as invoice_total
from invoices
where payment_total < invoice_total
group by vendor_id)