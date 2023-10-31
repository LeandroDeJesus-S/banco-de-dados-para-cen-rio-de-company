use company;
show tables;

	-- Fname Minit Lname Ssn Bdate Address Gender Salary Super_ssn Dept_num
insert into employee values (
	'Jhon', 'B', 'Smith', '123456789', '1965-01-09', 
    '731-Fondren-Houston-TX', 'M', 30000, null, 5
);

-- fname minit lname ssn Bdate address sex salary super_ssn Dno
insert into employee values ('João', 'M', 'Watson', '333445555', '1995-01-09', '731-Fondren-Houston-TX', 'M', 30000, '123456789', 5),
							('Camila', 'F', 'Santos', '333446666', '1986-03-19', '731-Fondren-Houston-TX', 'M', 28000, '123456789', 5),
							('Carlos', 'M', 'Martines', '333447777', '1999-09-30', '731-Fondren-Houston-TX', 'M', 20000, '123456789', 5),
							('Sergio', 'M', 'wolfram', '333448888', '1979-12-14', '731-Fondren-Houston-TX', 'M', 10000, '123456789', 5),
							('Maria', 'F', 'Spring', '333449999', '1988-05-21', '731-Fondren-Houston-TX', 'M', 25000, '123456789', 5),
							('Cristina', 'F', 'Maia', '333440000', '1995-01-02', '731-Fondren-Houston-TX', 'M', 18000, '123456789', 5);

							-- Essn 	Dname	sex  Bdate	Relationship
insert into dependent values ('333445555', 'Layla', 'F', '2002-05-06', 'Daughter'),
							 ('333445555', 'Mario', 'M', '2005-08-23', 'Son'),
                             ('333449999', 'Mateus', 'M', '2008-07-21', 'Son'),
                             ('333448888', 'Karen', 'F', '2014-02-16', 'Daughter'),
                             ('333448888', 'Paloma', 'F', '2015-04-03', 'Daughter'),
                             ('333448888', 'Ronald', 'M', '2005-11-28', 'Son');
						-- Dname 	  Dnum    Essn 	  Mgr_start_date  Dpt_create_date
insert into departament values ('Research', 5, 123456789, '2002-05-22', '1988-05-22'),
							   ('Administration', 4, null, null, '1988-05-22'),
                               ('Headquarters', 1, null, null, '1988-05-22');

insert into dept_locations values (5, 'New York'),
								  (4, 'Houston'),
								  (1, 'Stafford');
                                  
-- Pname Pnum Plocation Dnum
insert into project values ('ProjecttX', 1, 'Houston', 5),
						   ('ProjectY', 2, 'Sugarland', 5),
                           ('ProjectZ', 3, 'New York', 5);

-- Essn Pno hours
insert into works_on values ('333446666', 1, 3.5),
							('333447777', 2, 3.8),
							('333448888', 3, 5.3);
                            
-- 
                            
select * from employee;
select * from dependent;
select * from departament;
select * from project;

-- recuperando informações de multiplas tables
select Fname, Lname from employee e, departament d where (e.Ssn = d.Mgr_ssn);

-- recuperando info dos dependentes dos employees
select Fname, Dependent_name, Relationship from employee, dependent where Ssn = Essn;

-- address de um employee expecifico pelo nome
select Bdate, Address from employee
	where Fname = "Sergio" 
	and Minit = "M" 
	and Lname = "Wolfram";

-- recuperando departamento especifico
select * from departament where Dname = 'Research';

-- recuperando pessoas que trabalham no depeartamento "Research"
select Dno, Fname, Minit, Lname, Address from employee, departament
	where Dname = 'Research' and Dno = Dnumber;

-- recuperando info das pessoas trabalhando em um determinado projeto
select Pname, Essn, Fname, Hours from project, works_on, employee
where Essn = Ssn and Pnumber = Pno;
