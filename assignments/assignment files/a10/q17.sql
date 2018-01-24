create view REP_1 as
select proj_name, proj_value, proj_balance, employee.emp_lname, emp_fname, emp_initial, employee.job_code, job.job_description, job.job_chg_hour
from project p, employee e, job j
where e.emp_num = p.emp_num
and j.job_code = e.job_code