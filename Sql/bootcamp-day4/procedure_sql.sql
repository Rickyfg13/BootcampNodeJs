-- Untuk menggunakan INSERT, UPDATE, dan DELETE data pada stored procedure di MySQL, 
-- Anda dapat menggunakan syntax seperti berikut:



-- Contoh penggunaan stored procedure untuk menambahkan data baru ke tabel employees:
CREATE FUNCTION tambah_karyawan(employee_id int,first_name VARCHAR(20), last_name varchar(25),
							   email varchar(25),phone_number varchar(25),
								hire_date date, salary numeric(8,2)
							   )
RETURNS VOID AS $$
BEGIN
  INSERT INTO employees (employee_id,first_name, last_name,email,phone_number,hire_date,salary)
  VALUES (employee_id,first_name, last_name,email,phone_number,hire_date,salary);
END; $$
LANGUAGE plpgsql;

-- CONTOH UPDATE
create or replace procedure bonus(
	sender int,
	nama varchar(25)
	)
language plpgsql 
as $$
-- 2. memulai function
begin
	update employees
		set last_name = nama
		where employee_id = sender;
		commit;
end;$$
-- 3. Print Output
call bonus (101,'daniel')
-- 4. Check data employee_id 166 telah terupdate pada kolom paling bawah
select * from employees
where employee_id = 101


create or replace procedure bonus(
	sender int,
	nama varchar(25)
	)
language plpgsql 
as $$
-- 2. memulai function
begin
	update employees
		set last_name = nama
		where employee_id = sender;
		commit;
end;$$
-- 3. Print Output
call bonus (101,'daniel')
-- 4. Check data employee_id 166 telah terupdate pada kolom paling bawah
select * from employees
where employee_id = 101

-- CONTOH DELETE


