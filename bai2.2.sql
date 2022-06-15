create database quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer(
cID int primary key auto_increment,
cName varchar(45),
cAge varchar(45)
);

create table `order`(
oID int primary key auto_increment,
customer_id int ,
oDate date,
oTotalPrice int,
foreign key (customer_id) references customer(cID)
);

create table product(
pID int primary key auto_increment,
pName varchar(30),
pPrice int 
);

create table order_detail(
orderID int ,
productID int,
odQty int,
foreign key (orderID) references `order`(oID),
foreign key (productID) references product(pID)
);

insert into customer(cname,cAge)
values('Minh Quan','10'),('Ngoc Oanh', '20'),('Hong Ha', '50');

select * from customer;
select * from `order`;
select * from order_detail;
select * from product;

insert into `order`
values(1,1,'2006-03-21', Null),(2,2,'2006-03-23' ,Null),(3,1,'2006-03-16', Null);

insert into product(pName,pPrice)
values('May giat',3),('Tu lanh', 5),('Dieu hoa',7),('Quat',1),('Bep Dien',2);

insert into order_detail
values(1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

select * from `order`;


select * from customer
left join `order` on customer.cID = `order`.customer_id
where `order`.customer_id is null;
                                                                                                                                                                                          
                                                                                                                                                                                          
select `order`.oID,oDate, sum(pPrice * odQty) as gia_tien from `order` 
 join order_detail on `order`.oID = order_detail.orderID
 join product on order_detail.productID = product.pID
group by order_detail.orderID;











