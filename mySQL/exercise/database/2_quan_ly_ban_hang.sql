drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;

-- CUSTOMER
create table customer(
c_id int primary key,
c_name varchar(45),
c_age varchar(45)
);

-- ORDER
create table orders(
o_id int primary key,
c_id int,
o_date datetime,
o_price int,
foreign key(c_id) references customer(c_id)
);

-- PRODUCT
create table product(
p_id int primary key,
p_name varchar(45),
p_price double
);

-- ORDER DETAIL
create table order_detail(
o_id int,
p_id int,
od_qty int,
primary key(o_id, p_id),
foreign key(o_id) references orders(o_id),
foreign key(p_id) references product(p_id)
);

insert into customer values
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

insert into orders values
(1,1,'2006-3-21',null),
(2,2,'2006-3-23',null),
(3,1,'2006-3-16',null);

insert into product values
(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);

insert into order_detail values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select o_id, o_date, o_price
from orders;

select c.c_name, p.p_name, count(p.p_name) as counts
from customer c
join orders o on c.c_id = o.c_id
join order_detail od on o.o_id = od.o_id
join product p on od.p_id = p.p_id
group by c_name, p_name;

select c.c_name
from customer c
where c.c_id not in(
select c.c_id
from customer c
join orders o on c.c_id = o.c_id);

select o.o_id, o.o_date, sum(ifnull(od.od_qty,0) *ifnull(p.p_price,0)) as total_price
from orders o
-- join orders o on c.c_id = o.c_id
join order_detail od on o.o_id = od.o_id
join product p on od.p_id = p.p_id
group by od.o_id;
