select m.mem_num, mem_lname, mem_fname, 
(select sum(detail_fee)
from detailrental in_dr
group by dr.rent_num) as "Rental Fee Revenue"
from membership m join rental r on
m.mem_num = r.mem_num join
detailrental dr on
r.rent_num = dr.rent_num
