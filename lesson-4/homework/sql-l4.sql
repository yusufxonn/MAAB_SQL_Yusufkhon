-- 1️ Select the top 5 employees
SELECT TOP 5 * FROM Employees;

-- 2️ Select unique Category values from Products
SELECT DISTINCT Category FROM Products;

-- 3️ Show products with Price > 100
SELECT * FROM Products WHERE Price > 100;

-- 4️ Customers whose FirstName starts with 'A'
SELECT * FROM Customers WHERE FirstName LIKE 'A%';

-- 5️ Order Products by Price ascending
SELECT * FROM Products ORDER BY Price ASC;

-- 6️ Employees with Salary >= 60000 and DepartmentName = 'HR'
SELECT * FROM Employees
WHERE Salary >= 60000 AND DepartmentName = 'HR';
go
-- 7 Replace NULL Emails with 'noemail@example.com'
SELECT EmployeeID, 
       ISNULL(Email, 'noemail@example.com') AS Email
FROM Employees;
go
-- 8️ Products with Price BETWEEN 50 AND 100
SELECT * FROM Products WHERE Price BETWEEN 50 AND 100;
go
-- 9️ DISTINCT on two columns: Category and ProductName
SELECT DISTINCT Category, ProductName FROM Products;
go
-- 10 DISTINCT on two columns, ordered by ProductName DESC
SELECT DISTINCT Category, ProductName 
FROM Products
ORDER BY ProductName DESC;


-- 1️ Top 10 products ordered by Price DESC
SELECT TOP 10 * FROM Products ORDER BY Price DESC;

-- 2 Use COALESCE to return first non-NULL of FirstName or LastName
SELECT EmployeeID, COALESCE(FirstName, LastName) AS Name FROM Employees;

-- 3️ Select distinct Category and Price from Products
SELECT DISTINCT Category, Price FROM Products;

-- 4️ Employees aged between 30–40 OR Department = 'Marketing'
SELECT * FROM Employees 
WHERE (Age BETWEEN 30 AND 40) OR DepartmentName = 'Marketing';

-- 5️ Select rows 11–20 from Employees ordered by Salary DESC
SELECT * FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- 6️ Products with Price <= 1000 and StockQuantity > 50, sort by Stock
SELECT * FROM Products
WHERE Price <= 1000 AND StockQuantity > 50
ORDER BY StockQuantity ASC;

-- 7️ Products with ProductName containing letter 'e'
SELECT * FROM Products WHERE ProductName LIKE '%e%';

-- 8️ Employees working in HR, IT, or Finance
SELECT * FROM Employees
WHERE DepartmentName IN ('HR', 'IT', 'Finance');

-- 9️ Customers ordered by City ASC and PostalCode DESC
SELECT * FROM Customers
ORDER BY City ASC, PostalCode DESC;



-- 1️ Top 10 products ordered by Price DESC
SELECT TOP 10 * FROM Products ORDER BY Price DESC;

-- 2️ Use COALESCE to return first non-NULL of FirstName or LastName
SELECT EmployeeID, COALESCE(FirstName, LastName) AS Name FROM Employees;

-- 3️ Select distinct Category and Price from Products
SELECT DISTINCT Category, Price FROM Products;

-- 4️ Employees aged between 30–40 OR Department = 'Marketing'
SELECT * FROM Employees 
WHERE (Age BETWEEN 30 AND 40) OR DepartmentName = 'Marketing';

-- 5️ Select rows 11–20 from Employees ordered by Salary DESC
SELECT * FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- 6️ Products with Price <= 1000 and StockQuantity > 50, sort by Stock
SELECT * FROM Products
WHERE Price <= 1000 AND StockQuantity > 50
ORDER BY StockQuantity ASC;

-- 7️ Products with ProductName containing letter 'e'
SELECT * FROM Products WHERE ProductName LIKE '%e%';

-- 8 Employees working in HR, IT, or Finance
SELECT * FROM Employees
WHERE DepartmentName IN ('HR', 'IT', 'Finance');

-- 9️ Customers ordered by City ASC and PostalCode DESC
SELECT * FROM Customers
ORDER BY City ASC, PostalCode DESC;
