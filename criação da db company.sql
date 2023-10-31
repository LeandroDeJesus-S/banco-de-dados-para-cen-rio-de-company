create database first_example;
use first_example;
show databases;
create table if not exists person(
	person_id smallint unsigned,
	fname varchar(20),
    lname varchar(20),
    gender enum('M', 'F'),
    birth_date date,
    street varchar(30),
    city varchar(20),
    state varchar(20),
    country varchar(20),
    postal_code varchar(20),
    constraint pk_person primary key (person_id)
);
desc person;

create table favorite_food (
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint fk_favorite_food_person_id foreign key (person_id)
    references person (person_id)
);
desc favorite_food;

show databases;
select * from information_schema.table_constraints
where constraint_schema = 'first_example';

insert into person values 
('2', 'Marcos', 'Santos', 'M', '2001-12-12', 'rua x', 'cidade y', 'estado z', 'Brasil', '205681-45'),
('3', 'Maya', 'Silva', 'F', '2001-12-12', 'rua x', 'cidade y', 'estado z', 'Brasil', '205681-45');

delete from person where person_id = 1;

insert into favorite_food values (2, 'Churrasco'),
								 (3, 'Doritos');

select * from person;
select * from favorite_food;