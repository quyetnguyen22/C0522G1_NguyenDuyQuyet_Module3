drop database if exists furama_management;
create database furama_management;
use furama_management;
-- Họ tên Employee, Ngày sinh, Số CMND, Số ĐT, Email, Trình độ, Vị trí, Lương.

-- POSITION
create table e_position(
e_position_code int auto_increment primary key,
e_position_name varchar(45) null);

-- EDUCATION LEVEL
create table e_edu_level(
e_edu_level_code int auto_increment primary key,
e_edu_level_name varchar(45) null
);

-- DEPARTMENT
create table e_department(
e_department_code int auto_increment primary key,
e_department_name varchar(45) null
);

-- EMPLOYEE
create table employee (
id int auto_increment primary key,
is_deleted bit default(0),
e_name varchar(60) not null,
e_birthday date,
e_id_number int not null,
e_phone varchar(10),
e_email varchar(60) not null,
e_address varchar(60) null,
e_salary double,
e_position_code int not null,
e_edu_level_code int not null,
e_department_code int not null,
foreign key(e_position_code) references e_position(e_position_code),
foreign key(e_edu_level_code) references e_edu_level(e_edu_level_code),
foreign key(e_department_code) references e_department(e_department_code)
);

-- CUSTOMER LEVEL
create table customer_rank(
rank_id int auto_increment primary key,
rank_name varchar(50));

-- CUSTOMER
create table customer(
is_deleted bit default 0,
id int auto_increment primary key,
c_name varchar(45) not null,
c_birthday date not null,
c_gender varchar(20) not null,
c_id_num varchar(45) not null,
c_phone varchar(10) not null,
c_email varchar(45) null,
c_address varchar(45) null,
rank_id int null,
foreign key(rank_id) references customer_rank(rank_id));

-- RENTING TYPE
create table renting_type(
id_renting int auto_increment primary key,
renting_name varchar(45) null
);

-- SERVICE TYPE
create table service_type(
id_service_type int auto_increment primary key,
service_type_name varchar(45) null
);

-- SERVICER
create table service(
id int auto_increment primary key,
service_name varchar(45) not null,
area int null,
price double not null,
capacity int null,
standard varchar(45) null,
util varchar(45) null,
pool_area double null,
floor int null,
free_service text null,
id_renting int,
id_service_type int,
is_deleted bit default(0),
foreign key(id_renting) references renting_type(id_renting),
foreign key(id_service_type) references service_type(id_service_type));

insert into e_position(e_position_name)
values
('Quản lý'), 
('Nhân viên');

insert into e_edu_level(e_edu_level_name)
values
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học');

insert into e_department(e_department_name) 
values
('Sale-Marketing'), 
('Hành chính'),
('Phục vụ'),
('Quản lý');

insert into employee(e_name,e_birthday,e_id_number,e_salary,e_phone,e_email,e_address,e_position_code,e_edu_level_code,e_department_code) 
values
('Nguyễn Văn An','1970-11-07','456231786','10000000','0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1),
('Lê Văn Bình','1997-04-09','755434343','14000000','0934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1, 2, 2),
('Hồ Thị Yến','1995-12-12','654231234','7000000','0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),
('Võ Công Toản','1980-04-04','999231723','17000000','0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),
('Nguyễn Bỉnh Phát','1999-12-09','123231365','6000000','0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
('Khúc Nguyễn An Nghi','2000-11-08','454363232','7000000','0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
('Nguyễn Hữu Hà','1993-01-01','964542311','8000000','0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
('Nguyễn Hà Đông','1989-09-03','534323231','9000000','0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
('Tòng Hoang','1982-09-03','234414123','6000000','0245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),
('Nguyễn Công Đạo','1994-01-08','256781231','8000000','0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);

insert into customer_rank(rank_name)
values
('Diamond'),
('Platinum'),
('Gold'),
('Silver'),
('Member');

insert into customer(c_name,c_birthday,c_gender,c_id_num,c_phone,c_email,c_address,rank_id)
values
('Nguyễn Thị Hào','1970-11-07',0,643431213,'0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',5),
('Phạm Xuân Diệu','1992-08-08',1,865342123,'0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị',3),
('Trương Đình Nghệ','1990-02-27',1,488645199,'0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1),
('Dương Văn Quan','1981-07-08',1,543432111,'0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng',1),
('Hoàng Trần Nhi Nhi','1995-12-09',0,795453345,'0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',4),
('Tôn Nữ Mộc Châu','2005-12-06',0,732434215,'0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',4),
('Nguyễn Mỹ Kim','1984-04-08',0,856453123,'0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',1),
('Nguyễn Thị Hào','1999-04-08',0,965656433,'0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',3),
('Trần Đại Danh','1994-07-01',1,432341235,'0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',1),
('Nguyễn Tâm Đắc','1989-07-01',1,344343432,'0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng',2);

insert into renting_type(renting_name)
values
('year'),
('month'),
('day'),
('hour');

insert into service_type(service_type_name) 
values
('Villa'),
('House'),
('Room');

insert into service(service_name,area,price,capacity,standard,util,
pool_area,floor,free_service,id_renting,id_service_type)
values
('Villa Beach Front',25000,1000000,10,'vip','Có hồ bơi',500,4,null,3,1),
('House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',null,3,null,2,2),
('Room Twin 01',5000,1000000,2,'normal','Có tivi',null,null,'1,Xe máy,1,Xe đạp',4,3),
('Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi',300,3,null,3,1),
('House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',null,2,null,3,2),
('Room Twin 02',3000,900000,2,'normal','Có tivi',null,null,'1 Xe máy',4,3);
