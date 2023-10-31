use company;
-- JOIN statement
select * from employee JOIN works_on;

-- JOIN ON -> (INNER JOIN)
select * from  employee INNER JOIN works_on on Essn = Ssn;

# info dos gerentes e seus departamentos
select *  from employee INNER JOIN departament on Ssn = Mgr_ssn;

# nome e endereço dos gerentes do departamento de pesquisa
select Fname, Lname, Address from (employee INNER JOIN departament) where Dname = 'Research';

# nome, data de criação, local do departamento, e numero de dpts agrupados
select Dname, Dpt_create_date, Dlocation, count(*) as n_dpts
	from departament INNER JOIN dept_locations using (Dnumber)  # não precisa por alias
    group by Dname
    order by n_dpts, Dname, Dlocation;
    
desc departament;
-- CROSS JOIN
select * from employee CROSS JOIN dependent;

# JOIN com +3 tabelas

-- employee, works_on, project
select concat(Fname, ' ', Lname) as Employee_name, Ssn, Dno, Pno, Pname, Hours
	from (
		employee e
		INNER JOIN works_on w ON e.Ssn = w.Essn
		INNER JOIN project p ON p.Pnumber = w.Pno
	)
    where w.Hours >= 5
    order by p.Pnumber;

-- departament, dept_locations, employee
select Dnumber, Dname, concat(Fname, ' ', Lname) as Manager_name, Salary, round(Salary * .05) as Bonus
	from departament INNER JOIN dept_locations using (Dnumber)
					 INNER JOIN employee on employee.Ssn = departament.Mgr_ssn
	group by Dnumber having count(*) = 1;

# gerentes que possuem dependentes
select concat(Fname, ' ', Lname) as Manager_name, Ssn, Dno, Dname, Relationship
	from (employee e INNER JOIN departament d on e.Dno = d.Dnumber and e.Ssn = d.Mgr_ssn) 
	INNER JOIN dependent dpd on dpd.Essn = e.Ssn;
