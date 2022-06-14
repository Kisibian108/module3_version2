create database if not exists codegym_management_c03 ;

use codegym_management_c03;

create table class_type (
	id int primary key auto_increment,
    `name` varchar(30)
);
create table class (
	id int primary key auto_increment,
    `name` varchar(30),
    id_class_type int,
    foreign key (id_class_type) references class_type(id)
);

create table `account` (
	 username varchar(20) primary key,
    `password` varchar(30)
);
create table student (
	id int primary key auto_increment,
    `name` varchar(30),
    address varchar(30),
    date_of_birth date,
    username varchar(20),
    id_class int,
    foreign key (id_class) references class (id),
    foreign key (username) references `account`(username)
);



create table instructor (
	id int primary key auto_increment,
    `name` varchar(30),
    address varchar(30),
    salary int
);
create table calendar(
	id_class int ,
    id_instructor int,
    `subject` varchar(30),
    primary key (id_class, id_instructor),
    foreign key (id_class) references class(id),
    foreign key (id_instructor) references instructor(id)
);

insert into class_type (`name`) values ('Fulltime'), ('Partime') ;
insert into class (`name`, id_class_type) values ('C0322G1', 1 );
insert into `account` (username, `password`) values ('chien.tran', '123123');
insert into student (`name`, address, date_of_birth, `username`, id_class)
values ('Chiến', 'QB', '2000-10-10', 'chien.tran', 2);
insert into instructor (`name`, address, salary) 
values ('Chiến', 'QB', 2000);

insert into calendar (id_class, id_instructor, `subject`) 
values (2, 1, 'SQL');




