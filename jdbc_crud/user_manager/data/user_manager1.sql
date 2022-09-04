drop database if exists user_manager;
create database user_manager;
use user_manager;

create table users(
id int(3) auto_increment,
is_deleted bit default(0),
`name` varchar(120) not null,
email varchar(220) not null,
country varchar(120),
primary key(id)
);

insert into users(`name`,email,country)
values 
('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia'),
('may','may@che.uk','Kia'),
('biet','may@che.uk','tau'),
('co','coe@che.uk','enia');


delimiter //
create procedure show_all_user()
begin
select *
from users 
where is_deleted = 0;
end //
delimiter ;

delimiter //
create procedure update_user(in i_id int, n_name varchar(60), e_email varchar(60), c_country varchar(60))
begin
update users 
set `name`=n_name, email = e_email, country = c_country
where id = i_id;
end //
delimiter ;

delimiter //
create procedure delete_user(in i_id int)
begin
update users
set is_deleted = 1
where id = i_id;
end //
delimiter ;

SELECT * FROM users
where is_deleted = 0
order by name;