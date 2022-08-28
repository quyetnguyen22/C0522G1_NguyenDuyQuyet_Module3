drop database if exists user_manager;
use user_manager;

create table users(
id int(3) not null auto_increment,
`name` varchar(120) not null,
email varchar(220) not null,
country varchar(120),
primary key(id)
);

insert into users(`name`, email, country)
values (
('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia')
);