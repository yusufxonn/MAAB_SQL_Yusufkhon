/*
BULK INSERT is a Transact-SQL (T-SQL) command used to import large amounts of data from a file (like CSV or TXT) directly into a SQL Server table.
It helps in quickly loading external data into a table — much faster than using multiple INSERT statements.

BULK INSERT Products
FROM 'C:\Data\products.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

.csv — Comma Separated Values
.txt — Plain text (often tab-delimited)
.xml — XML data files
.json — JSON formatted data
(SQL Server also supports Excel .xls/.xlsx via integration services.)
*/

create table Products (ProductID int primary key, ProductName varchar(50), Price decimal (10,2))

insert into Products values 
(1, 'Laptop', 1200.00),
(2, 'Mouse', 25.50),
(3, 'Keyboard', 45.75);

/*
NULL: Means the column can have no value (unknown or missing data).
Example: Price DECIMAL(10,2) NULL

NOT NULL: Means the column must always have a value — it cannot be left empty.
Example: ProductName VARCHAR(50) NOT NULL
*/

alter table Products
add constraint UQ_ProductName unique (ProductName)

select * from Products
where Price > 50

alter table Products
add CategoryID int 

create table Categories (CategoryID int primary key, CategoryName varchar(50) unique)

/*
The IDENTITY property automatically generates unique numeric values for each new record inserted into a table.
To create an auto-incrementing primary key without manually specifying IDs.

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate DATE
);
*/


create table Studentss (ID int, [name] varchar(50), age int)
bulk insert Studentss
from '"C:\Users\Mr Technophile\Desktop\test.txt"'
with (
firstrow = 2,
fieldterminator = ',',
rowterminator = '\n'
)

select * from Studentss

alter table Products
add constraint fk_products foreign key (CategoryID) references Categories(CategoryID)

/*
A PRIMARY KEY uniquely identifies each record in a table.

A table can have only one primary key.
The column with a primary key cannot contain NULL values.
All values in the primary key column must be unique.
It is mainly used to identify each row in the table.

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);


Here, StudentID is the unique identifier for each student.

 UNIQUE KEY


A UNIQUE KEY also ensures that all values in a column are different, but it is not necessarily the main identifier of the table.

A table can have multiple unique keys.
A unique key can contain one NULL value (in most SQL databases).
It is used to maintain data uniqueness in columns other than the primary key.

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE
);

Here, Email must be unique for every employee, but it’s not the main identifier — EmployeeID is.
*/

alter table Products
add check (Price > 0)

alter table Products
add stock int not null default 0

select ProductID, ProductName,  ISNULL(Price, 0) AS Price from Products

insert into Products (ProductID, ProductName) values
(4, 'Case');

/*
FOREIGN KEY constraints in SQL Server serve the purpose of enforcing referential integrity between tables in a relational database. This means they ensure that relationships between data in different tables remain consistent and valid.
Purpose:
Maintain Data Integrity: FOREIGN KEY constraints prevent the creation of "orphaned" records in a child table (the table containing the foreign key) that reference non-existent records in a parent table (the table containing the primary key). For example, an order cannot exist for a customer who does not exist in the customer table.
Enforce Business Rules: They can be used to implement specific business rules by ensuring that data modifications adhere to predefined relationships.
Improve Data Consistency: By linking related data and preventing inconsistencies, FOREIGN KEYs contribute to the overall reliability and accuracy of the database.
Usage:
A FOREIGN KEY constraint is established on a column or set of columns in one table (the child table) that refers to the PRIMARY KEY or UNIQUE KEY in another table (the parent table). 
Syntax for creating a FOREIGN KEY constraint:
Code

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
*/

create table Customers (CustomerID int primary key, CustomerName varchar(50), age int)

insert into Customers values
(1, 'Salim', 25),
(2, 'Anvar', 20),
(3, 'Gani', 19)



ALTER TABLE Customers
ADD CHECK (Age > 18);

create table OrderDetails ( OrderID INT primary key,
    ProductID INT NOT NULL,
    Quantity INT,)

/*
ISNULL Function:
Purpose: Replaces a NULL value in a specific expression with a designated replacement value.
Syntax:
Code

    ISNULL (check_expression, replacement_value)
Arguments: Takes exactly two arguments:
check_expression: The expression to be checked for NULL.
replacement_value: The value to return if check_expression is NULL.
Behavior: If check_expression is NULL, ISNULL returns replacement_value. Otherwise, it returns check_expression.
Specificity: ISNULL is specific to Microsoft SQL Server and not part of the ANSI SQL standard.
COALESCE Function:
Purpose: Returns the first non-NULL expression among a list of arguments.
Syntax:
Code

    COALESCE (expression1, expression2, ..., expressionN)
Arguments: Can take any number of arguments (expressions).
Behavior: Evaluates the arguments in order from left to right and returns the value of the first expression that is not NULL. If all arguments are NULL, it returns NULL.
Standard Compliance: COALESCE is part of the ANSI SQL standard, making it more portable across different SQL database systems.
*/

create table Employees  ( EmpID INT primary key,
    name varchar(50),
    email varchar(50) unique)


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE
);

CREATE TABLE OrderDetails1 (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductName NVARCHAR(100),
    FOREIGN KEY (OrderID) 
        REFERENCES Orders(OrderID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
