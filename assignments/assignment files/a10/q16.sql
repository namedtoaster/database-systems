select proj_name, proj_value, proj_balance, employee.emp_lname, emp_fname, emp_initial, employee.job_code, job.jobdescription, job.job_chg_hour
from project p, employee e, job
where e.emp_num = p.emp_num
and job.job_code = e.job_code