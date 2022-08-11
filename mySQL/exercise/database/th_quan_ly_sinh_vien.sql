drop database if exists thuc_hanh_quan_ly_sinh_vien;
create database  thuc_hanh_quan_ly_sinh_vien;
use thuc_hanh_quan_ly_sinh_vien;
create table class(
id int auto_increment primary key,
`name` varchar(45),
start_date date,
`status` bit
);
create table student (
id int auto_increment primary key,
`name` varchar(45),
address varchar(45),
phone varchar(45),
`status` bit,
class_id int,
foreign key (class_id) references class(id)
);
create table `subject`(
id int auto_increment primary key,
`name` varchar(45),
credit int,
status bit
);
create table mark(
id_mark int auto_increment primary key,
sub_id int ,
student_id int,
mark int,
exams_times int,
foreign key (sub_id)  references `subject`(id),
foreign key (student_id) references student(id)
);
insert into class
values
(1,'A1','2008-12-20',1),
(2,'A2','2008-12-22',1),
(3,'B3',current_date(),0);
insert into student
values
(1,'Hung','Ha noi','0912113113',1,1),
(2,'Hoa','Hai phong',null,1,1),
(3,'Manh','HCM','0123123123',0,2);
insert into `subject`
values
(1,'CF',5,1),
(2,'C',6,1),
(3,'HDJ',5,1),
(4,'RDBMS',10,1);
insert into mark
values
(1,1,1,8,1),
(2,1,2,10,2),
(3,2,1,12,1);

select * from student;
-- hiển thị tất cả các học viên đang học
select * from student
where `status` = true;
-- hiển thị các môn học có thời gian học bé thua 10
select * from `subject`
where credit <10;
select s.id, s.`name`, c.`name`
from student s join class c
on s.class_id = c.id
where c.`name` ='A1';
select s.id,s.`name`,sub.`name`,m.mark
from student s join mark m on s.id = M.student_id join `subject` sub on m.sub_id=sub.id
where sub.`name` ='CF';

select s.address, count(s.id) as so_luong_sv
from student s
group by s.address;

select s.`name`, sub.`name`, avg(m.mark) as diem_tb
from student s
join mark m on s.id = m.student_id
join `subject` sub on sub.id = m.sub_id
group by m.id_mark;

-- subject co credit max
select sub.`name`, sub.credit
from `subject` sub
where sub.credit = (select max(credit)from `subject`);

-- subject co diem max
select sub.`name`, m.mark 
from mark m
join `subject` sub on sub.id = m.sub_id
where m.mark = (select max(mark) from mark);

-- sinh vien va diem tb
select s.`name`
from student s 
join mark m on m.student_id = s.id
group by s.`name`
order by mark desc;