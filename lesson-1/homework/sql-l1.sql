--Easy
/* 

Question 1
data = ma'lumot
database =  ma'lumotlar bazasi
relational database = tablelar ulangan bo'lsa ular relational database deyiladi\
table = jadval ma'lumotlarni foydalanuvchi uchun qulay formatda ko'rsatilishi

Question 2

DQL = Data Query Language -> Purpose: Used to query (retrieve) data from a database.
DML=  Data Manipulation Language -> Purpose: Used to manipulate (insert, update, delete) data stored in tables.
DDL = Data Defition Language -> Purpose: Defines the structure of database objects like tables, views, indexes, etc.
DCL = Data Control Language -> Purpose: Controls access to data (permissions, security).
TCL = Transaction Control Language -> Purpose: Manages transactions in a database (group of DML statements).

Question 3

There are two possible modes: Windows Authentication mode and mixed mode.
Windows Authentication mode enables Windows Authentication and disables 
SQL Server Authentication. Mixed mode enables both Windows Authentication and 
SQL Server Authentication
*/

--Medium

--Question 1
drop database SchoolDB
Create database SchoolDB
go
--Question 2
create table students (ID int Primary Key, [full name] varchar(50), major varchar(100), Address varchar(100))
 

 /*
 Question3

 SQL Server Management Studio (SSMS) and SQL Server Database (SQL DB) 
 serve distinct purposes within the SQL Server ecosystem, 
 though they are closely related.

SQL Server Database (SQL DB): SQL Server is a relational database management system 
(RDBMS) developed by Microsoft. It is responsible for storing, retrieving, 
and managing data using SQL (Structured Query Language). 
SQL Server provides the core database engine that handles 
tasks such as data storage, querying, transaction management, 
and indexing. It is accessed programmatically or 
via command-line tools and supports integration with various development environments.

SQL Server Management Studio (SSMS): SSMS is a graphical user interface (GUI)
tool designed to manage and administer SQL Server instances. 
It provides a user-friendly environment for tasks such as database creation, 
querying, performance monitoring, and user management. 
SSMS includes features like a visual query editor with syntax highlighting, 
IntelliSense, and tools for scripting and debugging.
 */


 -- Hard

 /*
 Question1
DQL – Data query Language = select
DDL – Data definition Language = create, alter, drop, truncate
DML – Data Manipulation Language = inset, update, delete
DCL – Data Control Language = Grant, Revoke
TCL – Transaction Control Language = commit, rollback, savepoint
 */

--Question2

 insert into students values (1, 'Islom Qodirov', 'Computer Science', 'Bosh street 123'),
(2, 'Diyorbek Tursunov', 'Business Managment', 'Chinor street 4'),
(3, 'Mukhammadali Yusupov', 'Engineering', 'Pine street 789'),
(4, 'Aziza Rahmonova', 'Science', 'Uzbekiston street 101');

select * from students

-- Question3
/*
database restored succesfully 
*/
