create database demo;
use demo;
create table product(
Id int primary key,
productCode int,
productName varchar(45),
productPrice double,
productAmount int,
productDescription varchar(45),
productStatus bit
);


insert into product
values(1,12,'Iphone',1000,50,'From Apple', 1),
(2,42,'Macbook',1500,40,'Made by Apple', 0);

insert into product
value(3,23,'SamSung',1200,30,'Made by Samsung', 1);

select * from product where productName = 'SamSung';
create unique index key_product on product(productCode);
create  index key_product2 on product(productName, productPrice );

explain select * from product where productName = 'SamSung';

create view product_view as
select * from product;

select * from product_view;

update product_view 
set productAmount = 100 where 
productName = 'Iphone';

drop view product_view;

delimiter //
create procedure search_product( in name_search varchar(45) )
begin
    select * from product where productName = name_search ;
end; 
// delimiter ;
call search_product('Samsung');
call search_product('Iphone');
call search_product('Macbook');

delimiter //
create procedure lay_tat_ca_thong_tin1()
begin
select * from product;
end;
// delimiter ;
call lay_tat_ca_thong_tin1;

select * from product;

delimiter //
create procedure them_thong_tin3(ID int, in productCode int, in productName varchar(100), in productPrice int, in productAmount int,
in productDescription varchar(100), in productStatus bit)
begin
insert into product values ( ID, productCode, productName, productPrice, productAmount, productDescription, productStatus);
end // 
call them_thong_tin3( 4, 'SamsungGalaxy', 1000, 9, 'From Samsung', 0);


delimiter //
create procedure sua_san_pham1(in id_sua int, in product_name_update varchar(100))
begin
set sql_safe_updates = 0;
update product set product_name= product_name_update;
set sql_safe_updates = 1;
end //
DELIMITER //
CREATE PROCEDURE update_product(ID int, in productCode int, in productName varchar(100), in productPrice int, in productAmount int,
in productDescription varchar(100), in productStatus bit)
BEGIN
set sql_safe_updates = 0;
update product
set productCode        = p_code,
        productPrice   = p_price,
        productName    = p_name,
        productAmount  = p_amount,
        productDescription = p_description,
        productStatus      = status
where ID = p_id;
set sql_safe_updates = 1;
END//

delimiter //
create procedure xoa_san_pham1(in id_delete int)
begin
set sql_safe_updates = 0;
delete from product where ID = id_delete;
set sql_safe_updates = 1;
end //
delimiter ;
call xoa_san_pham1(1);
call lay_tat_ca_thong_tin1;

select * from product;