drop database if exists quan_ly_sinh_vien;
create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

-- CLASS
create table class(
class_id int auto_increment primary key,
class_name varchar(60) not null,
start_date datetime not null,
`status` bit
);

-- STUDENT
create table student(
student_id int auto_increment primary key,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
`status` bit,
class_id int not null,
foreign key(class_id) references class(class_id)
);

-- SUBJECT
create table subjects(
sub_id int auto_increment primary key,
sub_name varchar(30) not null,
credit tinyint not null default 1 check (credit >= 1),
`status` bit default 1
);

-- MARK
create table mark(
mark_id int auto_increment primary key,
sub_id int,
student_id int,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
unique(sub_id, student_id),
foreign key(sub_id) references subjects(sub_id),
foreign key(student_id) references student(student_id)
);

insert into class values 
(1,'A1','2008-12-20',1),
(2,'A2','2008-10-12',1),
(3,'B3',current_date(),1);

insert into student values 
(1,'Hung','Ha noi',0912113113,1,1),
(2,'Hoa','Hai phong',null,1,1),
(3,'Manh','HCM',0123123123,0,2);

insert into subjects values
(1,'CF',5,1),
(2,'C',6,1),
(3,'HDJ',5,1),
(4,'RDBMS',10,1);

insert into mark values
(1,1,1,8,1),
(2,1,2,10,2),
(3,2,1,12,1);

select*from student;

select*from student
where student_name like 'h%';

select*from class
where month(start_date) = 12;
 
select*from subjects
where credit between 3 and 5;

-- update student set student_name = 'Tho' where class_id = 2;
-- update student set class_id = 2 where student_name = 'Hung';

select s.student_name, sub.sub_name, m.mark 
from student s join subjects sub join mark m on sub.sub_id = m.sub_id
order by mark desc, student_name;