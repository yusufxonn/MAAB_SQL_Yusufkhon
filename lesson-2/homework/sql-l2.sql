
 --Basic-Level Tasks (10)
/*
Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
Update the Salary of an employee to 7000 where EmpID = 1.
Delete a record from the Employees table where EmpID = 2.
Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
Modify the Name column in the Employees table to VARCHAR(100).
Add a new column Department (VARCHAR(50)) to the Employees table.
Change the data type of the Salary column to FLOAT.
Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
Remove all records from the Employees table without deleting its structure.
*/


create table Employees (ID int Primary Key, Name varchar(50), salary decimal(10,2))
go 
insert into Employees values (1, 'Salim', 20000.20)
go 
insert into Employees values 
(2, 'Ali', 15000.32),
(3, 'Alisher', 6000.85)

select * from Employees

update Employees
set salary = 7000
where Employees.ID = 1

delete Employees
where Employees.ID = 2

/*
The DELETE command is a Data Manipulation Language (DML) operation used to remove specific rows from a table based on a given condition. 
With the help of the “DELETE” command, we can either delete all the rows in one go or delete rows one by one. i.e., 
we can use it as per the requirement or the condition using the Where clause. It is comparatively slower than the TRUNCATE command
to delete all rows 

delete Employees
--to delete all rows one by one 
delete Employees
where Employees.ID = 2

/*
The DROP command is a Data Definition Language (DDL) operation used to completely remove a table, 
its structure, and all its data from the database. Once executed, the table is permanently deleted
and cannot be recovered unless from a backup.
*/
--syntax
--To drop a table:
drop table Employees

/*
The TRUNCATE command is also a Data Definition Language (DDL) operation. It is used to remove all rows from a table efficiently,
without deleting the table’s structure. By using this command the existence of all the rows of the table is lost. 
It is comparatively faster than the delete command as it deletes all the rows fastly. 
*/
--syntax
--To truncate a table:
truncate table Employees
*/

insert into Employees values 
(2, 'Ali', 15000.32)

select * from Employees

alter table Employees
alter column name varchar(100)

alter table Employees
add Department varchar(50)

alter table Employees
alter column salary float

create table Departments (DepartmentID int Primary Key, DepartmentName varchar (50))

drop table Employees

--Intermediate-Level Tasks (6)
/*
Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).
Update the Department of all employees where Salary > 5000 to 'Management'.
Write a query that removes all employees but keeps the table structure intact.
Drop the Department column from the Employees table.
Rename the Employees table to StaffMembers using SQL commands.
Write a query to completely remove the Departments table from the database.
*/

--Intermediate-Level Tasks (6)

--task1

alter table Departments
add dept_name varchar(50)
go 
alter table Departments
add location varchar(50)
go 
alter table Departments
add hire_date date

alter table Departments
add salary decimal (10,2)

select * from Departments

insert into Departments values 
  (1, 'Salim',   'IT',        'Tashkent',  '2023-01-15', 20000.20),
  (2, 'Karim',   'HR',        'Samarkand', '2022-11-20', 18000.50),
  (3, 'Dilshod', 'Finance',   'Bukhara',   '2023-05-10', 22000.00),
  (4, 'Malika',  'Marketing', 'Andijan',   '2021-09-01', 19500.75),
  (5, 'Aziz',    'Sales',     'Namangan',  '2024-03-18', 25000.10);

--task 2

update Departments
set dept_name = 'Management'
where Departments.salary > 5000

--task 3
truncate table Departments

--task4

create table Employees (ID int Primary Key, Name varchar(50), salary decimal(10,2), department varchar (50))
go 
insert into Employees values (1, 'Salim', 20000.20, 'IT')
go 
insert into Employees values 
(2, 'Ali', 15000.32, 'HR'),
(3, 'Alisher', 6000.85, 'Finance')
go
select * from Employees

alter table Employees
drop column department 

--task 5

exec sp_rename 'Employees', 'StaffMembers'

select * from StaffMembers

--task 6

drop table Departments

--Advanced-Level Tasks (9)
/*
Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
Add a CHECK constraint to ensure Price is always greater than 0.
Modify the table to add a StockQuantity column with a DEFAULT value of 50.
Rename Category to ProductCategory
Insert 5 records into the Products table using standard INSERT INTO queries.
Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
Rename the Products table to Inventory.
Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
*/

--task 1

create table Products (ProductID int Primary Key, ProductName varchar(50), Category varchar(50), Price decimal(10,2), created_at date)

--task 2

alter table Products
add constraint Price check (Price > 0)

-- task 3
alter table Products
add StockQuantity varchar(50)

--task 4
exec sp_rename 'Products.Category', 'ProductCategory', 'column' 

select * from Products
--task 5
insert into Products values 
(1, 'Laptop',    'Electronics', 850.00,  '2023-01-10', '15'),
(2, 'Phone',     'Electronics', 500.00,  '2023-02-05', '30'),
(3, 'Chair',     'Furniture',    75.50,  '2023-03-15', '50'),
(4, 'Desk',      'Furniture',   150.00,  '2023-04-20', '20'),
(5, 'Tshirt',   'Clothing',    20.00,   '2023-05-30', '100')

--task 6

select * into Products_Backup from Products 
select * from Products_Backup

--task 7

exec sp_rename 'Products', 'Inventory'

select * from Inventory

--task 8 

alter table Inventory
drop constraint Price

alter table Inventory
alter column Price float

--task 9

alter table Inventory
add ProductCode int Identity (100, 5) 
