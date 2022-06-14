create database if not exists student_management_c03 ;

use student_management_c03;

CREATE TABLE student (
	id int primary key auto_increment,
    `name` varchar(50),
    birthday date,
    address varchar(50),
    class varchar(50)
) ;

DROP table student;

alter table student 
add class varchar(50);

insert into student 
values (4, 'Chiến', '2000-10-01', 'QB', 'C03'),
(2, 'Chánh', '1984-10-10', 'DN', 'C03');

insert into student (id, `name`, birthday, address) 
values (10, 'THuận', '2000-09-18', 'QN');

delete from student 
where id = 10 ;

select id, `name`, birthday from student
where `name` = 'Chiến' and birthday = '2000-01-01'
;







