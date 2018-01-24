select mem_num, mem_fname, mem_lname, mem_balance
from membership
where exists (
select mem_num from rental
where membership.mem_num = rental.mem_num)
order by mem_num