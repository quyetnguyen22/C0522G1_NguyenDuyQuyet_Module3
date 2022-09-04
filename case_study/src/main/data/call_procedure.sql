use furama_management;
-- CALL POSITION
drop procedure if exists employee_position;
delimiter //
create procedure employee_position()
begin
select *
from e_position;
end //
delimiter ;

-- CALL EDUCATION LEVEL 
drop procedure if exists employee_edu_level;
delimiter //
create procedure employee_edu_level()
begin
select *
from e_edu_level;
end //
delimiter ;

-- CALL DEPARTMENT
drop procedure if exists employee_department;
delimiter //
create procedure employee_department()
begin
select *
from e_department;
end //
delimiter ;

-- CALL ALL EMPLOYEE
drop procedure if exists show_all_employee;
delimiter //
create procedure show_all_employee()
begin
select * 
from employee
where is_deleted = 0;
end //
delimiter ;

-- CALL INSERT EMPLOYEE
drop procedure if exists add_new_employee;
delimiter //
create procedure add_new_employee(in employee_name varchar(60),employee_birthday date,employee_id_number int,employee_salary double,employee_phone varchar(10),employee_email varchar(60),
employee_address varchar(55),employee_position_code int,employee_edu_level_code int,employee_department_code int)
begin
insert into employee(e_name,e_birthday,e_id_number,e_salary,e_phone,e_email,e_address,e_position_code,e_edu_level_code,e_department_code) 
values (employee_name,employee_birthday,employee_id_number,employee_salary,employee_phone,employee_email,employee_address,employee_position_code,employee_edu_level_code,employee_department_code);
end //
delimiter ;

-- CALL DELETE EMPLOYEE
drop procedure if exists delete_employee;
delimiter //
create procedure delete_employee(in id_delete int)
begin
update employee
set is_deleted = 1
where id = id_delete;
end //
delimiter ;

-- EDIT_EMPLOYEE
drop procedure if exists edit_employee;
delimiter //
create procedure edit_employee(in id_edit int,`name` varchar(60), birthday date, idNum int, phone varchar(10), email varchar(60),
salary double, address varchar(60), positionCode int, eduLevelCode int, departmentCode int)
begin
update employee
set 
e_name = `name`,
e_birthday = birthday,
e_id_number = idNum,
e_phone = phone,
e_email = email,
e_address = address,
e_salary = salary,
e_position_code = positionCode,
e_edu_level_code = eduLevelCode,
e_department_code =departmentCode
where id = id_edit;
end //
delimiter ;

-- SEARCH_BY_ID
drop procedure if exists search_employee_by_id;
delimiter //
create procedure search_employee_by_id(in id_search int)
begin
select *
from employee
where id = id_search;
end //
delimiter ;

-- SEARCH EMPLOYEE
drop procedure if exists search_employee;
delimiter //
create procedure search_employee(in employee_name varchar(60), phone_num varchar(10), address varchar(60))
begin
select * 
from employee
where e_name like employee_name and e_phone like phone_num and e_address like address and is_deleted = 0;
end //
delimiter ;


-- CALL CUSTOMER RANK
drop procedure if exists show_all_customer_rank;
delimiter //
create procedure show_all_customer_rank()
begin
select *
from customer_rank;
end //
delimiter ;

-- CALL CUSTOMER
drop procedure if exists show_all_customer;
delimiter //
create procedure show_all_customer() 
begin
select *
from customer;
end //
delimiter ;

-- CALL DELETE CUSTOMER
drop procedure if exists delete_customer;
delimiter //
create procedure delete_customer(in id_delete int)
begin
update customer
set is_deleted = 1
where id = id_delete;
end //
delimiter ;

-- CALL INSERT CUSTOMER
drop procedure if exists add_new_customer;
delimiter //
create procedure add_new_customer(in customer_name varchar(60),customer_birthday date,customer_gender varchar(20),customer_id_number int,customer_phone varchar(10),customer_email varchar(60),
customer_address varchar(55),customer_rank_id int)
begin
insert into customer(c_name,c_birthday,c_gender,c_id_num,c_phone,c_email,c_address,rank_id) 
values (customer_name,customer_birthday,customer_gender,customer_id_number,customer_phone,customer_email,customer_address,customer_rank_id);
end //
delimiter ;

-- EDIT CUSTOMER
drop procedure if exists edit_customer;
delimiter //
create procedure edit_customer(in id_edit int,`name` varchar(45),birthday date,gender varchar(20),
id_num varchar(45),phone varchar(10),email varchar(45),address varchar(45),rank_id int)
begin
update customer
set 
c_name = `name`,
c_birthday = birthday,
c_gender = gender,
c_id_num = id_num,
c_phone = phone,
c_email = email,
c_address = address,
rank_id = rank_id
where id = id_edit;
end //
delimiter ;

-- SEARCH CUSTOMER
drop procedure if exists search_customer;
delimiter //
create procedure search_customer(in id_search int)
begin
select *
from customer
where id = id_search;
end //
delimiter ;

-- ADD NEW SERVICE
drop procedure if exists add_new_service;
delimiter //
create procedure add_new_service( in service_name varchar(45),area int,price double,capacity int,standard varchar(45),util varchar(45),
pool_area double,floor int,free_service text,id_renting int,id_service_type int)
begin
insert into service(service_name,area,price,capacity,standard,util,
pool_area,floor,free_service,id_renting,id_service_type)
values(service_name,area,price,capacity,standard,util,
pool_area,floor,free_service,id_renting,id_service_type);
end //
delimiter ;

-- EDIT SERVICE
drop procedure if exists edit_service;
delimiter //
create procedure edit_service( in service_name varchar(45),area int,price double,capacity int,standard varchar(45),util varchar(45),
pool_area double,floor int,free_service text,id_renting int,id_service_type int, id_edit int)
begin
update service
set 
service_name = service_name,
area = area,
price = price,
capacity = capacity,
standard = standard,
util =  util,
pool_area = pool_area,
floor = floor,
free_service = free_service,
id_renting = id_renting,
id_service_type = id_service_type
where id = id_edit;
end //
delimiter ;

-- DELETE SERVICE
drop procedure if exists delete_service;
delimiter //
create procedure delete_service( in id_delete int)
begin
update service
set 
is_deleted = 1
where id = id_delete;
end //
delimiter ;

-- SEARCH SERVICE BY ID
drop procedure if exists search_by_id;
delimiter //
create procedure search_by_id( in id_search int)
begin
select *
from service
where id = id_search;
end //
delimiter ;