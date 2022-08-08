drop database if exists student_management;
create database student_managementstudent;
create table student (
id int not null,
name varchar(45) null,
age int null,
country varchar(45) null,
primary key(id));