create database quan_ly_ban_hang ;

use quan_ly_ban_hang;

create table customer(
c_id int primary key auto_increment,
c_name varchar(50),
c_age int(20)
);
create table `order`(
o_id int primary key auto_increment,
o_date datetime ,
o_total_price int ,
c_id int not null,
foreign key (c_id) references customer(c_id)
);
create table product(
p_id int primary key auto_increment,
p_name varchar(50) ,
p_price int
);
create table order_detail(
od_quantity int,
o_id int,
p_id int,
foreign key (o_id) references `order`(o_id),
foreign key (p_id) references product(p_id)
);












