create database student_manage;

use student_manage;

create table classes(
id int primary key auto_increment,
name varchar(60) not null,
start_date datetime not null,
status bit
);

create table students (
id int auto_increment primary key,
name varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
class_id int not null,
foreign key (class_id) references classes(id)
);

create table subjects (
id int auto_increment primary key,
name varchar(30) not null,
credit tinyint default 1 check (credit >= 1),
status bit default 1
);

create table marks (
id int auto_increment primary key,
sub_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
exam_time tinyint default 1,
unique (sub_id, student_id),
foreign key (sub_id) references subjects(id),
foreign key (student_id) references students(id)
);

insert into classes (name, start_date, status) 
values 
("A1", "2008-12-20",1),
("A2", "2008-12-22",1),
("A3", current_date(),0);

insert into students (name, address, phone, status, class_id)
values
("hung", "Ha Noi", "0912113113", 1, 1),
("Hoa", "Hai Phong", default, 1, 1),
("Manh", "HCM", "0123123123", 0, 2);

insert into subjects (name, credit, status)
values 
("CF", 5, 1),
("C", 6, 1),
("HDJ", 5, 1),
("RDBMS", 10, 1); 

insert into marks (sub_id, student_id, mark, exam_time) 
values
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);

select * from students;

select * from classes;