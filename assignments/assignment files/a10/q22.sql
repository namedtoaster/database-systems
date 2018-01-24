select assignment.emp_num, employee.emp_lname, sum(assignment.assign_hours) as sumofassignhours, sum(assignment.assign_charge) as sumofassigncharge
from employee e, assignment a
where e.emp_num = a.emp_num
group by a.emp_num, e.emp_lname