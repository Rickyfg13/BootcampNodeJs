create table orders (

	order_id char(5),
	company_name varchar(40),
	contact_name varchar(20),
	contact_title varchar(30),
	address varchar(60),
	city varchar(15),
	region varchar(15),
	postal_code varchar(10),
	country varchar(15),
	phone varchar(24),
	fax varchar(24),
-- 	postal_code varchar(10),
-- 	country varchar(15),
-- 	home_phone varchar(24),
-- 	extension varchar(4),
-- 	photo int,
-- 	notes text,
-- 	reports_to smallint,
-- 	photo_path varchar(255),
	
 CONSTRAINT customer_id_pk primary key (customer_id)
	
);



