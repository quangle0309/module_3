create database student_management;

use student_management;

create table student (
id int,
name varchar(200),
age int,
country varchar(50)
);

create table class (
id int,
name varchar(200)
);

create table teacher (
id int,
name varchar(200),
age int,
country varchar(50)
);

insert into class(id, name) values(1, "C0324H1"),(2, "C0324H1");

select * from class;
