SELECT e.Name AS EmployeeName, e.Salary, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 50000;

SELECT c.FirstName, c.LastName, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = 2023;

SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

SELECT s.SupplierName, p.ProductName
FROM Suppliers s
LEFT JOIN Products p ON s.SupplierID = p.SupplierID;

SELECT o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
FROM Orders o
FULL OUTER JOIN Payments p ON o.OrderID = p.OrderID;

SELECT e.Name AS EmployeeName, m.Name AS ManagerName
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID;

SELECT s.Name, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Math 101';

SELECT c.FirstName, c.LastName, o.Quantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.Quantity > 3;

SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources';



SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID = (
    SELECT DepartmentID 
    FROM Employees 
    WHERE Name = 'John Smith'
);

SELECT p.ProductName
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.OrderID IS NULL;

SELECT d.DepartmentName, AVG(e.Salary) AS AvgDeptSalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING AVG(e.Salary) > (SELECT AVG(Salary) FROM Employees);

SELECT m.Name AS ManagerName, e.Name AS EmployeeName, m.Salary AS ManagerSalary, e.Salary AS EmployeeSalary
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE m.Salary <= e.Salary;

SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;

SELECT e1.Name AS Employee1, e2.Name AS Employee2
FROM Employees e1
JOIN Employees e2 ON e1.EmployeeID < e2.EmployeeID
WHERE e1.DepartmentID <> e2.DepartmentID;

SELECT p.ProductName, c.CategoryName
FROM Products p
JOIN Categories c ON p.ProductID = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');

SELECT s.Name, COUNT(e.CourseID) AS CourseCount
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.Name
HAVING COUNT(e.CourseID) > 1;

SELECT DISTINCT c.FirstName + ' ' + c.LastName, o.OrderID, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;


SELECT d.DepartmentName, e.Name AS EmployeeName, e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

SELECT c.FirstName,
       SUM(o.TotalAmount) AS TotalOrdered,
       COALESCE(SUM(p.Amount), 0) AS TotalPaid,
       (SUM(o.TotalAmount) - COALESCE(SUM(p.Amount), 0)) AS Balance
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
GROUP BY c.FirstName;

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);

SELECT c.FirstName, YEAR(o.OrderDate) AS Year, MONTH(o.OrderDate) AS Month, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, YEAR(o.OrderDate), MONTH(o.OrderDate)
HAVING COUNT(o.OrderID) > 1;

SELECT TOP 3 p.ProductName, SUM(o.Quantity) AS TotalSold
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;

SELECT s.Name
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID IS NULL;

SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 5;

SELECT c.FirstName, MIN(o.OrderDate) AS FirstOrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName
HAVING MIN(YEAR(o.OrderDate)) = 2024;

SELECT m.Name AS ManagerName, SUM(e.Salary) AS TotalSalaryUnderManager
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID
GROUP BY m.Name;

SELECT c.CategoryName, SUM(o.Quantity * p.Price) AS TotalSales
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
JOIN Categories c ON p.ProductID = c.CategoryID
GROUP BY c.CategoryName;

SELECT e.Name, e.Salary, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

SELECT c.FirstName, COUNT(DISTINCT cat.CategoryID) AS CategoryCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
JOIN Categories cat ON p.ProductID = cat.CategoryID
GROUP BY c.FirstName
HAVING COUNT(DISTINCT cat.CategoryID) >= 3;

