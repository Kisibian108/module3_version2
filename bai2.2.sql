create table customer(
cID int primary key auto_increment,
cName varchar(45),
cAge varchar(45)
);

create table `order`(
oID int primary key auto_increment,
oDate date,
oTotalPrice int,
customer_id int ,
foreign key (customer_id) references customer(cID)
);


create table product(
pID int primary key auto_increment,
pName varchar(30),
pPrice int 
);

create table order_detail(
odQty int,
orderID int ,
productID int,
foreign key (orderID) references `order`(oID),
foreign key (productID) references product(pID)
);