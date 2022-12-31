create table regions (
	region_id serial,
	region_name varchar(25),
	CONSTRAINT region_id_pk primary key (region_id)
);

create table countries (
	country_id char(2),
	country_name varchar(45),
	region_id serial,
	CONSTRAINT country_id_pk primary key (country_id)
);

create table jobs (
	job_id varchar(10),
	job_title varchar(35) unique,
	min_salary decimal,
	max_salary decimal,
	CONSTRAINT job_id_pk primary key (job_id)
);

create table employees (
	employee_id serial,
	first_name varchar(20),
	last_name varchar(25),
	email varchar(25),
	phone_number varchar(25),
	hire_date date,
	salary decimal(8, 2),
	commision_pct decimal(2, 2),
	job_id varchar(10),
	manager_id int,
	department_id serial,
	CONSTRAINT employee_id_pk primary key (employee_id)
);

create table job_history (
	employee_id serial,
	start_date date,
	end_date date,
	job_id varchar(10),
	department_id serial,
	CONSTRAINT job_histoy_id primary key (employee_id, start_date)
);

create table departments (
	department_id serial,
	department_name varchar(30),
	manager_id serial,
	location_id serial,
	CONSTRAINT department_id_pk primary key (department_id)
);

create table locations (
	location_id serial,
	street_address varchar(40),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(25),
	country_id char(2),
	CONSTRAINT location_id_pk primary key (location_id)
);

ALTER TABLE
	countries
ADD
	CONSTRAINT fk_region_id FOREIGN KEY (region_id) REFERENCES regions (region_id);

ALTER TABLE
	departments
ADD
	CONSTRAINT fk_location_id FOREIGN KEY (location_id) REFERENCES locations (location_id);

ALTER TABLE
	job_history
ADD
	CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES departments (department_id);

ALTER TABLE
	employees
ADD
	CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES departments (department_id);

ALTER TABLE
	jobs
ALTER COLUMN
	job_title TYPE VARCHAR(35),
	unique
select
	*
from
	regions
alter table
	regions
add
	column regions_x varchar (30)
alter table
	regions rename column regions_x to regions_y
alter table
	regions
alter column
	regions_y type varchar (60)
alter table
	regions drop column regions_y
alter table
	regions
add
	constraint regions_x_pk primary key (regions_x)
alter table
	regions drop constraint region_id_pk drop table regions drop table employees drop table countries drop table regions cascade
insert into
	regions (region_id, region_name)
values
	(1, 'tamtam')
insert into
	regions (region_name)
values
	('duaaa')
select
	*
from
	regions
delete from
	regions
where
	region_id = 1
select
	regions.region_id,
	regions.region_name,
	countries.country_name
from
	regions,
	countries