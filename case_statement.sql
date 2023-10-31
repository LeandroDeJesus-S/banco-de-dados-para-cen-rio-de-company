-- case statement
use company;

select * from employee;

-- acrecentando 10% para o sexo H e 5% para o F
update employee set Salary =
	case 
		when Sex = 'M' then Salary * 1.10
		when Sex = 'F' then Salary * 1.05
	else
		Salary
    end;


select sum(case when Sex = 'M' then Salary end) as total_salary_men, 
	   sum(case when Sex = 'F' then Salary end) as total_women_salary
from employee;
