-- NUMBER 1
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
-- NUMBER 3
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