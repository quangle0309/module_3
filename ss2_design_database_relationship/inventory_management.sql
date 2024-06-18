drop database if exists inventory_management;
create database if not exists inventory_management;
use inventory_management;

create table suppliers (
id int primary key,
name varchar(100),
address varchar(200),
phone_number varchar(11)
);

create table purchase_oders (
id int primary key,
date_oder date,
supplier_id int,
foreign key (supplier_id) references suppliers(id)
);

create table receipt_notes (
id int primary key,
receipt_date date
);

create table issue_notes (
id int primary key,
issue_date date
);

create table materials (
id int primary key,
name varchar(100)
);

create table issue_details (
unit_price decimal,
quantity int,
material_id int,
issue_id int,
primary key(material_id, issue_id),
foreign key (material_id) references materials(id),
foreign key (issue_id) references issue_notes(id)
);

create table receipt_details (
unit_price decimal,
quantity int,
material_id int,
receipt_id int,
primary key(material_id, receipt_id),
foreign key (material_id) references materials(id),
foreign key (receipt_id) references receipt_notes(id)
);

create table oders_teach_materials (
material_id int,
purchase_oder_id int,
primary key (material_id, purchase_oder_id),
foreign key (material_id) references materials(id),
foreign key (purchase_oder_id) references purchase_oders(id)
);

create table phone_numbers (
phone_number varchar(11) primary key,
supplier_id int,
foreign key (supplier_id) references suppliers(id)
);