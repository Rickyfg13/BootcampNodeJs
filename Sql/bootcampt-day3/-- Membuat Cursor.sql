-- Membuat Cursor
begin ;
declare
my_cursor cursor for select*from employees;

fetch next from my_cursor
fetch prior from my_cursor
fetch last from my_cursor

fetch 10 from my_cursor

-- end the cursor
commit


-- CONTOH KASUS
-- menampilkan data employees berdasarkan masa kerja ,nama dan salary menggunakan cursor
-- 1. Membuat function get_profile
create or replace function get_profile(p_year integer)
returns text as $$

-- 2.declarasikan function
declare 
	profile text default'';
	rec_emp record;
	cur_emps cursor (p_year integer )
		for select concat(first_name,'',last_name) as fullname,salary
		from employees
		where extract(year from age(now(),hire_date)) <= p_year;

begin
	open cur_emps(p_year);
	loop
		fetch cur_emps into rec_emp;
		exit when not found;

		profile:=profile || ',' || rec_emp.fullname ||':'||rec_emp.salary;
	end loop;

	close cur_emps;
	return profile;

end;$$
language plpgsql

    -- berdasarkan masa kerja, jika 15 = 15 tahun
	select get_profile(15)


-- create prosedure dengan contoh kasus update bonus dari anggota
-- 1. Membuat prosedure
create or replace procedure bonus(
	sender int,
	amount dec
	)
language plpgsql 
as $$
-- 2. memulai function
begin
	update employees
		set salary = salary + amount
		where employee_id = sender;
		commit;
end;$$
-- 3. Print Output
call bonus (166,2000)
-- 4. Check data employee_id 166 telah terupdate pada kolom paling bawah
select * from employees



-- QUIZ 2
-- NUMBER 1
select name_type.name
from pe.p person_type
join pe.bec busines on busines.businessentityid = person_type.businessentityid
join pe.ct name_type on busines.contacttypeid = name_type.contacttypeid
group by name_type.name

-- ver II
select c.name,a.persontype,count(a.id)
from pe.p a
join pe.bec b on b.businessentityid = a.businessentityid
join pe.ct c on b.contacttypeid = c.contacttypeid
group by c.name,a.persontype

-- ver III -------
select persontype,
	case 
		WHEN persontype= 'IN' THEN 'Individual Customer'
		WHEN persontype= 'EM' THEN 'Employee'
		WHEN persontype='SP' THEN 'Sales Person'
		WHEN persontype= 'SC' THEN 'Sales Contact'
		WHEN persontype ='VC' THEN 'Vendor Contcat'
		WHEN persontype='GC' THEN 'General Contact'
	end as nama,
	count(persontype) as total_person
from pe.p
group by persontype

-- NUMBER 2
select  b.businessentityid,b.lastname as Fullname,e.emailaddress,o.phonenumber,concat(addressline1,addressline2,' - ',city)
from pe.p b 
join pe.e e on b.businessentityid = e.businessentityid
join pe.pp o on e.businessentityid = o.businessentityid
where 

select concat(addressline1,addressline2,' - ',city)
from pe.a 
where addressline1 = like"1234 Seaside Way"

-- ver II 
select b.businessentityid,b.lastname as Fullname, l.emailaddress, q.phonenumber, 
concat(h.addressline1,', ',h.city,', ',i."name",', ',j."name"),u."name"
from person.person b
join person.businessentity e on e.businessentityid = b.businessentityid
join person.businessentityaddress f ON f.businessentityid = e.businessentityid
join person.address h on h.addressid = f.addressid
join person.stateprovince i on i.stateprovinceid = h.stateprovinceid
join person.countryregion j on j.countryregioncode = i.countryregioncode
join person.emailaddress l on l.businessentityid = b.businessentityid
join person.personphone q on q.businessentityid = b.businessentityid
join person.addresstype u on u.addresstypeid = f.addresstypeid
where u.addresstypeid = 2

-- ver III ---
select b.businessentityid,b.lastname as Fullname, l.emailaddress, q.phonenumber, 
concat(h.addressline1,', ',h.city,', ',i."name",', ',j."name") address,u."name"
from person.person b
join person.businessentity e on e.businessentityid = b.businessentityid
join person.businessentityaddress f ON f.businessentityid = e.businessentityid
join person.address h on h.addressid = f.addressid
join person.stateprovince i on i.stateprovinceid = h.stateprovinceid
join person.countryregion j on j.countryregioncode = i.countryregioncode
join person.emailaddress l on l.businessentityid = b.businessentityid
join person.personphone q on q.businessentityid = b.businessentityid
join person.addresstype u on u.addresstypeid = f.addresstypeid
where j.countryregioncode= 'US'

--NUMBER 3
select j.countryregioncode, j.name ,
	case 
		WHEN persontype= 'IN' THEN 'Individual Customer'
		WHEN persontype= 'EM' THEN 'Employee'
		WHEN persontype='SP' THEN 'Sales Person'
		WHEN persontype= 'SC' THEN 'Sales Contact'
		WHEN persontype ='VC' THEN 'Vendor Contcat'
		WHEN persontype='GC' THEN 'General Contact'
	end as persontypedesc,
	count(persontype) as total_person
from person.person b
join person.businessentity e on e.businessentityid = b.businessentityid
join person.businessentityaddress f ON f.businessentityid = e.businessentityid
join person.address h on h.addressid = f.addressid
join person.stateprovince i on i.stateprovinceid = h.stateprovinceid
join person.countryregion j on j.countryregioncode = i.countryregioncode
join person.emailaddress l on l.businessentityid = b.businessentityid
join person.personphone q on q.businessentityid = b.businessentityid
join person.addresstype u on u.addresstypeid = f.addresstypeid
group by j.countryregioncode, b.persontype
order by j.countryregioncode asc

-- NUMBER 4
select j.countryregioncode,j.name,
	sum ( case 
            when persontype = 'IN' then 1
            else 0
	      end
        ) as "Individual Customer",
	
    sum(case 
            when persontype = 'EM' then 1
            else 0
        end)as "Employee",
        
    sum(case 
            when persontype = 'SP' then 1
            else 0
        end)as "Sales Person",
    sum(case 
            when persontype = 'SC' then 1
            else 0
        end)as "Sales Contact",
    sum(case 
            when persontype = 'VC' then 1
            else 0
        end)as "Vendor Contcat",
    sum(case 
            when persontype = 'GC' then 1
            else 0
        end)as "General Contact"
	
from person.person b
join person.businessentity e on e.businessentityid = b.businessentityid
join person.businessentityaddress f ON f.businessentityid = e.businessentityid
join person.address h on h.addressid = f.addressid
join person.stateprovince i on i.stateprovinceid = h.stateprovinceid
join person.countryregion j on j.countryregioncode = i.countryregioncode
join person.emailaddress l on l.businessentityid = b.businessentityid
join person.personphone q on q.businessentityid = b.businessentityid
join person.addresstype u on u.addresstypeid = f.addresstypeid
group by j.countryregioncode
order by j.countryregioncode asc

-- NUMBER 5
SELECT b.departmentid, b.name, count(n.businessentityid) as jumlah_employee
from humanresources.department b 
join humanresources.employeedepartmenthistory v on v.departmentid = b.departmentid
join humanresources.employee n on n.businessentityid = v.businessentityid
group by b.departmentid
order by b.departmentid asc

-- NUMBER 6

select b.name,
	sum(case 
		when shiftid = 1 then 1
		else 0
	end)as "Day",
	sum(case 
		when shiftid = 2 then 1
		else 0
	end)as "Evening",
	sum(case 
		when shiftid = 2 then 1
		else 0
	end)as "Night"

from humanresources.department b 
join humanresources.employeedepartmenthistory v on v.departmentid = b.departmentid
join humanresources.employee n on n.businessentityid = v.businessentityid
group by b."name"
order by b."name"

-- NUMBER 7

select h.accountnumber, h.name, 
	sum(case 
		when status = 1 then 1
		else 0
	end)as "Pending",
	sum(case 
		when status = 2 then 1
		else 0
	end)as "Approved",
	sum(case 
		when status = 3 then 1
		else 0
	end)as "Rejected",
	sum(case 
		when status = 4 then 1
		else 0
	end)as Completed
from purchasing.vendor h
join purchasing.purchaseorderheader j on j.vendorid = h.businessentityid
group by h.accountnumber,h.name
order by Completed desc

-- NUMBER 8

select b.customerid, concat(d.firstname,' ',d.lastname) as customer_name,
            sum(case 
				when status = 1 then 1
				else 0
			end)as "inProcess",
			sum(case 
				when status = 2 then 1
				else 0
			end)as "Approved",
			sum(case 
				when status = 3 then 1
				else 0
			end)as "BackOrdered",
			sum(case 
				when status = 4 then 1
				else 0
			end)as "Rejected",
			sum(case 
				when status = 5 then 1
				else 0
			end)as "Shipped",
			sum(case 
				when status = 6 then 1
				else 0
			end)as "Cancelled"
	
	from sales.customer b
	join person.person d on d.businessentityid = b.customerid
	join sales.salesorderheader y on y.customerid = b.customerid
	group by 1,2
	order by 1,2

    -- NUMBER 9


select  b.customerid, concat(d.firstname,' ',d.lastname) as customer_name,
	sum(case
	 when productCategoryid = 1 then 1
	 else 0
	end) as "Accesories",
	sum(case
	 when productCategoryid = 2 then 1
	 else 0
	end) as "Bikes",
	sum(case
	 when productCategoryid = 3 then 1
	 else 0
	end) as "Components",
	sum(case
	 when productCategoryid = 4 then 1
	 else 0
	end) as "Clothing"
	
	
	
    from sales.customer b
	join person.person d on d.businessentityid = b.customerid
	join sales.salesorderheader y on y.customerid = b.customerid
	join sales.salesorderdetail o on o.salesorderid = y.salesorderid
	join production.product l on l.productid = o.productid
	join production.productsubcategory i on i.productsubcategoryid = l.productsubcategoryid
	group by 1,2
	order by 2 asc
	
    -- VER II
    select  b.customerid, concat(d.firstname,' ',d.lastname) as customer_name,
	sum(case
	 when productCategoryid = 1 then 1
	 else 0
	end) as "Accesories",
	sum(case
	 when productCategoryid = 2 then 1
	 else 0
	end) as "Bikes",
	sum(case
	 when productCategoryid = 3 then 1
	 else 0
	end) as "Components",
	sum(case
	 when productCategoryid = 4 then 1
	 else 0
	end) as "Clothing"
	

    from sales.customer b
	join person.person d on d.businessentityid = b.customerid
	join sales.salesorderheader y on y.customerid = b.customerid 
	join sales.salesorderdetail o on o.salesorderid = y.salesorderid
	join sales.specialofferproduct q on q.productid = o.productid
	join production.productproductphoto r on r.productid = q.productid
	join production.product l on l.productid = o.productid
	join production.productsubcategory i on i.productsubcategoryid = l.productsubcategoryid
	group by 1,2
	order by 2
	
    -- NUMBER 10 
    SELECT q.productid, q.name, i.discountpct,
(SELECT EXTRACT(YEAR FROM i.startdate) ) yeardisct,
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 1 then 1
	 else 0
	end) as "January",
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 2 then 1
	 else 0
	end) as "Febuary",
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 3 then 1
	 else 0
	end) as "Maret",
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 4 then 1
	 else 0
	end) as "April",
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 5 then 1
	 else 0
	end) as "Mei",
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 6 then 1
	 else 0
	end) as "Juni",
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 7 then 1
	 else 0
	end) as "Juli",
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 8 then 1
	 else 0
	end) as "Agustus",
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 9 then 1
	 else 0
	end) as "September",
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 10 then 1
	 else 0
	end) as "Oktober",
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 11 then 1
	 else 0
	end) as "November",
	sum(case
	 when (SELECT EXTRACT(Month FROM i.startdate) ) = 12 then 1
	 else 0
	end) as "Desember"
	

from production.product q
join production.productproductphoto pp on pp.productid = q.productid
join sales.specialofferproduct v ON v.productid = pp.productid
join sales.specialoffer i ON i.specialofferid = v.specialofferid
where i.discountpct > 0
group by 1,2,3,4
order by 4 desc


-- yang_bener
CREATE OR REPLACE FUNCTION GetProduct (offsets int, limits int)
RETURNS TABLE (
	ProductID			text,
	Name				text,
	ProductNumber		text,
	SafetyStockLevel	int,
	StandardCost		int,
	ListPrice			int,
	SubCategory			int,
	Category			int,
	DaysToManufacture	int,
	DiscontinuedDate	timestamp
)
AS $$

DECLARE
	cur_id	int;
	offset int;
	limit int;
	my_cursor CURSOR FOR
		SELECT
			p.ProductID,
			p.Name,
			p.ProductNumber,
			p.SafetyStockLevel,
			p.StandardCost,
			p.ListPrice,
			p.ProductSubCategoryID,
			pc.ProductCategoryID,
			p.DaysToManufacture,
			p.DiscontinuedDate
		FROM pr.p p
		JOIN pr.psc psc USING (ProductSubcategoryID)
		JOIN pr.pc pc USING (ProductCategoryID)
		WHERE p.ProductID >= offsets AND p.ProductID <= limits;
		
BEGIN
	OPEN my_cursor;
	LOOP
		FETCH NEXT FROM my_cursor INTO 
			ProductID,
			Name,
			ProductNumber,
			SafetyStockLevel,
			StandardCost,
			ListPrice,
			SubCategory,
			Category,
			DaysToManufacture,
			DiscontinuedDate;
		EXIT WHEN NOT FOUND;
		RETURN NEXT;
	END LOOP;
	CLOSE my_cursor;
END; $$
LANGUAGE plpgsql;

select * from GetProduct(600,800)	

CREATE OR REPLACE FUNCTION GetProduct (nama text)
RETURNS TABLE (
	ProductID			text,
	Name				text,
	ProductNumber		text,
	SafetyStockLevel	int,
	StandardCost		int,
	ListPrice			int,
	SubCategory			int,
	Category			int,
	DaysToManufacture	int,
	DiscontinuedDate	timestamp
)
AS $$

DECLARE
	cur_id	int;
	offset int;
	limit int;
	my_cursor CURSOR FOR
		SELECT
			p.ProductID,
			p.Name,
			p.ProductNumber,
			p.SafetyStockLevel,
			p.StandardCost,
			p.ListPrice,
			p.ProductSubCategoryID,
			pc.ProductCategoryID,
			p.DaysToManufacture,
			p.DiscontinuedDate
		FROM pr.p p
		JOIN pr.psc psc USING (ProductSubcategoryID)
		JOIN pr.pc pc USING (ProductCategoryID)
		WHERE p.name ilike concat(nama, '%');
		
BEGIN
	OPEN my_cursor;
	LOOP
		FETCH NEXT FROM my_cursor INTO 
			ProductID,
			Name,
			ProductNumber,
			SafetyStockLevel,
			StandardCost,
			ListPrice,
			SubCategory,
			Category,
			DaysToManufacture,
			DiscontinuedDate;
		EXIT WHEN NOT FOUND;
		RETURN NEXT;
	END LOOP;
	CLOSE my_cursor;
END; $$
LANGUAGE plpgsql;



-- create column signup using procedure
create procedure signup(
	businessentityid int,
	firstnames varchar(30),
	middlenames varchar(30),
	lastnames varchar (40),
	surfix varchar (10),
	email xml,
	phonenumber varchar(24),
	persontype varchar(20)
	
)

language plpgsql
as $$
begin
-- execute to table person/signup
insert into person.signup
	values (businessentityid,
	firstnames,
	middlenames,
	lastnames,
	surfix,
	email,
	phonenumber,
	persontype);

commit;
end; $$

-- call function in procedure methode
call signup(1,'Pangestu',
			'','Septian','sfxAmbigu',
			'pasya45@gmail.com',
		   '089602648625','Web Developer');

-- create column signin using procedure
create or replace procedure signin(
-- 	businessentityid int,
-- 	email xml,
-- 	passwords varchar
	IN email varchar,
	IN passwords varchar
)

language plpgsql
as $$
begin
-- Perform for person/signin
-- insert into person.signin values(
-- 	businessentityid,
-- 	email,
-- 	passwords);
	
if exists(SELECT 1 FROM person.signin s WHERE s.email = $1 AND s.passwords = $2)
then 
raise notice
'login berhasil';
else 
raise notice 
'gagal ah login';
end if;
commit;
end; $$


-- execute show for person/signin
call signin('pasya45@gmail.com','pgadmin');