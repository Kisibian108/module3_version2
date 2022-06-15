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
insert into `account` (username, `password`) values ('ha.tran', '123123');

insert into student (`name`, address, date_of_birth, `username`, id_class)
values ('Hà', 'Quảng Trị', '2000-10-10', 'ha.tran', 2);


insert into instructor (`name`, address, salary) 
values ('Chiến', 'QB', 2000);

insert into calendar (id_class, id_instructor, `subject`) 
values (2, 1, 'SQL');

-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào, lớp đó thuộc loại lớp nào.
-- 3. Lấy ra thông tin các học viên đang theo học tại các lớp kể cả các học viên không theo học lớp nào.
-- 4. Lấy thông tin của các học viên tên 'Tien' và 'Toan’.
-- 5. Lấy ra số lượng học viên của từng lớp.
-- 6. Lấy ra danh sách học viên và sắp xếp tên theo alphabet.


-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.

select student.* , class.`name`, class_type.`name` as class_type from student 
inner join class on student.id_class = class.id
inner join class_type on class.id_class_type = class_type.id  ;

-- 3. Lấy ra thông tin các học viên đang theo học tại các lớp kể cả các học viên không theo học lớp nào.
select student.* , class.`name`, class_type.`name` as class_type from student 
left join class on student.id_class = class.id
left join class_type on class.id_class_type = class_type.id  ;

select student.* , class.`name`, class_type.`name` as class_type from student 
left join class on student.id_class = class.id
left join class_type on class.id_class_type = class_type.id  
UNION
select student.* , class.`name`, class_type.`name` as class_type from student 
right join class on student.id_class = class.id
right join class_type on class.id_class_type = class_type.id  ;

-- 4. Lấy thông tin của các học viên tên 'Chiến' và 'Đạt’.
select * from student 
where (`name` = "Chiến" or `name` = "Đạt") and address = "Quảng Trị";

-- 5. Lấy ra số lượng học viên của từng lớp.
select s.* , class.`name`, class_type.`name` as class_type , count( id_class ) as so_luong
from student s
right join class on s.id_class = class.id
right join class_type on class.id_class_type = class_type.id  
GROUP BY id_class
-- having class_type = "Fulltime" and so_luong > 0
;
-- 6. Lấy ra danh sách học viên và sắp xếp tên theo alphabet.
select * from student
order by `address` , date_of_birth desc
;




