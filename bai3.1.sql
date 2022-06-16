CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE class
(
    class_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME    NOT NULL,
    status    BIT
);
CREATE TABLE student
(
    student_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    status      BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);
CREATE TABLE `subject`
(
    sub_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),
    `status`  BIT                  DEFAULT 1
);

CREATE TABLE mark
(
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT NOT NULL,
    student_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES `subject` (sub_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO `subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
select * from student 
where student_name like 'h%'; 

select * from class 
where start_date BETWEEN '2008-12-01 00:00:00' AND '2008-12-31 23:59:59';

select * from `subject`
where credit >= 3 and credit <=5;

update student 
set class_id = 2
where student_name = 'Hung';

select student_name, mark , sub_name from student 
inner join mark on mark.student_id = student.student_id
inner join `subject` on mark.sub_id = `subject`.sub_id
order by mark desc, student_name;

select address,count(student_id) as 'so luong hoc vien' 
from student
group by address;

select student.student_id,student.student_name,avg(mark) as 'diem trung binh' 
from mark inner join student where 
mark.student_id = student.student_id
group by student.student_id,student.student_name;

select student.student_id,student.student_name,avg(mark) as 'diem trung binh' 
from mark inner join student where 
mark.student_id = student.student_id
group by student.student_id,student.student_name
having avg(mark) > 15;

select student.student_id,student.student_name,avg(mark) as 'diem trung binh' 
from mark inner join student where 
mark.student_id = student.student_id
group by student.student_id,student.student_name
having avg(mark) >= all (select avg(mark) from mark group by mark.student_id);


select * from student;
select * from `subject`;
select * from mark;

select * from `subject`
where credit = (select max(credit) from `subject`);

select * from `subject`
inner join mark on mark.sub_id = `subject`.sub_id
where mark = (select max(mark) from mark); 

select * from student 
left join mark on student.student_id = mark.student_id
order by mark desc;



