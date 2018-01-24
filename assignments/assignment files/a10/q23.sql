select assignment.proj_num, sum(assignment.assign_hours) as sumofassignhours, sum(assignment.assign_charge) as sumofassigncharge
from assignment a
group by a.proj_num