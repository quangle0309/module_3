SELECT * FROM quan_ly_ban_hang.customer;

insert into customer(c_name, c_age)
values 
("Minh Quan", 10),
("Ngoc Oanh", 20),
("Hong Ha", 50);

insert into `order`(o_date, c_id)
values 
("2006-3-21", 1),
("2006-3-23", 2),
("2006-3-16", 1);

insert into product(p_name, p_price)
values
("may Giat", 3),
("Tu Lanh", 5),
("Dieu Hoa", 7),
("Quat", 1),
("Bep Dien", 2);

insert into order_detail (od_quantity, o_id, p_id)
values
(3,1,1),
(7,1,3),
(2,1,4),
(1,2,1),
(8,3,1),
(4,2,5),
(3,2,3);

-- hiển thị thông tin o_id, o_date --
select o_id, o_date
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách --
select customer.c_name, customer.c_age, `order`.o_date, product.p_name as "Tên sản phẩm mua"
from customer
join `order` 
on `order`.c_id = customer.c_id
join order_detail 
on order_detail.o_id = `order`.o_id
join product
on product.p_id = order_detail.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào --
select customer.c_name, customer.c_age, `order`.o_date
from customer
left join `order` 
on `order`.c_id = customer.c_id
where `order`.o_date is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn --
select 
customer.c_name,
`order`.c_id as "Mã hóa đơn", 
 `order`.o_date, 
 (product.p_price * order_detail.od_quantity) as total_price
from customer
join `order` 
on `order`.c_id = customer.c_id
join order_detail 
on order_detail.o_id = `order`.o_id
join product
on product.p_id = order_detail.p_id
order by customer.c_id asc;