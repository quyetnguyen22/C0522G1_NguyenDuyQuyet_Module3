drop database if exists demo;
create database demo;
use demo;

create table products(
id int auto_increment primary key,
product_code varchar(45),
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(60),
product_status varchar(60)
);

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status) values
('Milk-01','TH True Milk',8000,150,'Viet Nam','New'),
('Milk-02','Vina Milk',7000,50,'Viet Nam','New'),
('Beer-01','Heniken',20000,200,'American','Import'),
('Beer-02','Budweiser',22000,210,'Germany','import'),
('Biscuit-01','Candy cake',12000,150,'Viet Nam','New');

-- index
create unique index i_product_code on products(product_status);
explain select*
from products
where product_code = 'Beer-02';

alter table products add index i_produc_name_price(product_name, product_price);

-- view
create view v_code_name_price_status 
as select p.product_code, p.product_name, p.product_price, p.product_status
from products p;

create or replace view v_code_name_price_status as
select p.product_code, p.product_name, p.product_price, p.product_amount
from products p;

set sql_safe_updates = 0;
update v_code_name_price_status
set product_amount = 5
where product_name = 'Vina Milk';
select*
from v_code_name_price_status;
drop view v_code_name_price_status;

-- sp
delimiter //
create procedure sp_infor()
begin
select*
from products;
end //
delimiter ;

delimiter //
create procedure add_infor(in product_code varchar(45) ,product_name varchar(50),product_price double,
product_amount double,product_description varchar(60),product_status varchar(60))
begin
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status) values
('IPhone', 'IP-14', 38000000,70,'Official','New');
end //
delimiter ;

delimiter //
create procedure edit_infor(in e_price int)
begin
update products 
set product_price = 42000000
where product_name = 'IP-14';
end //
delimiter ;

delimiter //
create procedure delete_infor(in del_product_name int)
begin
delete from products 
where product_name = 'Vina Milk';
end //
delimiter ;