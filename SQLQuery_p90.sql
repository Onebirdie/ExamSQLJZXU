create table client(
	client_id char(10) not null primary key,
	client_name nchar(4) not null,
	mobile char(11) not null unique,
	home_address nvarchar(30) not null,
	email varchar(30) check(email like '%@%.%')
)

create table goods(
	goods_id char(10) not null primary key,
	goods_barcode varchar(20) not null,
	goods_name nvarchar(30) not null,
	production_place nvarchar(30) not null
)

create table purchase(
	purchase_id char(10),
	goods_id char(10) not null foreign key(goods_id) references goods(goods_id),
	purchase_price decimal(6,2) not null,
	purchase_num int not null,
	purchase_money decimal(8,2) not null,
	purchase_date datetime not null default getdate()
)

create table sale(
	sale_id char(10) not null primary key,
	goods_id char(10) not null foreign key(goods_id) references goods(goods_id),
	client_id char(10) not null foreign key(goods_id) references client(client_id),
	sale_price decimal(6,2) not null check(sale_price >= 0),
	sale_num int not null check(sale_num >=0),
	sale_money decimal(8,2),
	sale_date datetime default getdate()
)

create table stock(
	goods_id char(10) not null primary key,
	stock_num int not null check(stock_num>=0)
)

--2
alter table client
add age int

alter table client
drop age

alter table client
add constraint pk_cusno
primary key(client)
go

alter table client
add constraint ix_mobile
unique(mobile)
go

alter table client
add constraint ck_email
check(email like '%@%.%')
go

--3 
insert into purchase values('', '', 0, 0, 0, '2021-01-01')
insert into purchase values('', '', 0, 0, 0, '2021-01-01')

--4
update purchase
set purchase_date='2021-01-01'
where goods_id='0622000001'

update purchase
set purchase_price=purchase_price*(1.1), purchase_money=purchase_money*(1.1)

--5
delete from purchase
where purchase_date='2021-01-01'

delete from purchase
truncate table purchase

