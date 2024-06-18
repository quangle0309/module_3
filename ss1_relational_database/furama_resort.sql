create database furama_resort;

use furama_resort;

create table customer_types (
id int auto_increment,
name_customer varchar(45),
primary key(id)
);

create table customers (
id int auto_increment,
id_customer_type int,
full_name varchar(45),
dob date,
citizen_identity varchar(45),
phone_number varchar(45),
email varchar(45),
address varchar(45),
primary key(id),
foreign key(id_customer_type) references customer_types(id)
);

create table rental_types(
id int auto_increment,
name_rental_type varchar(45),
price int,
primary key(id)
);

create table type_of_services (
id int,
name varchar(45),
primary key (id)
);

create table services (
id int,
name varchar(45),
area int,
number_of_floors int,
max_people int,
price decimal,
id_rental_type int,
id_type_of_service int,
status varchar(45),
primary key (id),
foreign key(id_rental_type) references rental_types(id),
foreign key(id_type_of_service) references type_of_services(id)
);

create table locations (
id int,
name varchar(45),
primary key(id)
);

create table levels (
id int,
level varchar(45),
primary key(id)
);

create table departments (
id int,
name varchar(45),
primary key(id)
);

create table employees (
id int,
full_name varchar(45),
id_location int,
id_level int,
id_department int,
dob date,
citizen_identity varchar(45),
salary decimal,
phone_number varchar(45),
email varchar(45),
address varchar(45),
primary key(id),
foreign key (id_location) references locations(id),
foreign key (id_level) references levels(id),
foreign key (id_department) references departments(id)
);

create table contracts (
id int,
id_employee int,
id_customer int,
id_service int,
contract_date date,
contract_end_date date,
deposits decimal,
total decimal,
primary key(id),
foreign key(id_employee) references employees(id),
foreign key(id_customer) references customers(id),
foreign key(id_service) references services(id)
);

create table additional_services (
id int,
name varchar(45),
price decimal,
unit int,
availability_status varchar(45),
primary key(id)
);

create table detailed_contracts (
id int,
id_contract int,
id_additional_service int,
primary key(id),
foreign key(id_contract) references contracts(id),
foreign key(id_additional_service) references additional_services(id)
);