Create Schema users;

CREATE TABLE users.users (

	user_id serial,
	user_full_name varchar(55),
	user_type varchar(15),
	user_company_name varchar(255),
	user_email varchar(255),
	user_phone_number varchar(25) unique,
	user_modified_date date,
	
CONSTRAINT user_id_pk primary key (user_id)
);

CREATE TABLE users.roles (

	role_id serial,
	role_name varchar(35),
    
CONSTRAINT role_id_pk primary key (role_id)
);

CREATE TABLE users.user_roles (

	usro_user_id integer,
	usro_role_id integer,
    
CONSTRAINT usro_user_pk primary key (usro_user_id, usro_role_id),

CONSTRAINT usro_user_fk  FOREIGN key (usro_user_id) REFERENCES users (user_id) on delete cascade on update cascade, 

CONSTRAINT usro_role_fk 
FOREIGN key (usro_role_id) REFERENCES roles (role_id) on delete cascade on update cascade	

);

CREATE TABLE users.user_members (

	usme_user_id integer,
	usme_memb_name varchar(15),
	usme_promote_date date,
	usme_points smallint,
	usme_type varchar(15),


CONSTRAINT 	usme_user_id_pk
 primary key (usme_user_id),
 
CONSTRAINT usme_user_id_fk
FOREIGN key (usme_memb_name) REFERENCES master.members (memb_name) on delete cascade on update cascade
);


CREATE TABLE users.user_profiles (

	uspro_id serial,
	uspro_national_id varchar(20),
	uspro_birt_date date,
	uspro_job_title varchar(50),
	uspro_martial_status char(1),
	uspro_gender char(1),
	uspro_addr_id integer,
	uspro_user_id integer,
	

CONSTRAINT 	usme_user_pk primary key (uspro_id),
 
CONSTRAINT uspro_addr_fk
FOREIGN key (uspro_addr_id) REFERENCES master.address (addr_id) on delete cascade on update cascade,
 
CONSTRAINT uspro_user_fk
FOREIGN key (uspro_user_id) REFERENCES users.users (user_id) on delete cascade on update cascade

);


CREATE TABLE users.user_bonus_points (
    ubpo_id serial,
    ubpo_user_id integer,
    ubpo_total_points smallint,
    ubpo_bonus_type char(1),
    ubpo_created_on date,

    CONSTRAINT ubpo_id_pk  primary key (ubpo_id),
    CONSTRAINT uspa_user_fk 
    FOREIGN key (ubpo_user_id) REFERENCES users.users (user_id)
 );

 CREATE TABLE users.user_password (
    uspa_user_id serial,
    uspa_passwordHash VARCHAR(128),
    uspa_passwordSalt Varchar(10),
    

CONSTRAINT uspa_user_pk primary key (uspa_user_id),
CONSTRAINT uspa_user_fk 
FOREIGN key (uspa_user_id) REFERENCES users.users (user_id)
 );





