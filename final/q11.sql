select min(mem_balance), max(mem_balance), round(avg(mem_balance), 3)
from membership
where exists (
select mem_num from rental
where membership.mem_num = rental.mem_num)
order by mem_num