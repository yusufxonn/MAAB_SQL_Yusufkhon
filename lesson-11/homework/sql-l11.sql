-- ============================================
-- DATABASE: OnlineStore
-- Includes: Easy + Medium + Hard SQL tasks
-- ============================================

DROP DATABASE IF EXISTS OnlineStore;
CREATE DATABASE OnlineStore;
USE OnlineStore;

-- ============================================
-- TABLES
-- ============================================

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    SupplierID INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- ============================================
-- SAMPLE DATA
-- ============================================

INSERT INTO Departments VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'IT'),
(4, 'Finance');

INSERT INTO Employees VALUES
(101, 'Alice Johnson', 5500, 1),
(102, 'Bob Smith', 4800, 2),
(103, 'Charlie Lee', 6200, 3),
(104, 'Diana Adams', 4500, 1),
(105, 'Ethan Davis', 7000, 4);

INSERT INTO Customers VALUES
(1, 'John', 'Doe', 'USA'),
(2, 'Emma', 'Brown', 'UK'),
(3, 'Liam', 'Taylor', 'USA'),
(4, 'Olivia', 'Wilson', 'Canada'),
(5, 'Ava', 'Martinez', 'USA');

INSERT INTO Suppliers VALUES
(10, 'Gadget Supplies'),
(11, 'Clothing Mart'),
(12, 'HomeTech');

INSERT INTO Products VALUES
(100, 'Smartphone', 'Electronics', 10, 850),
(101, 'Laptop', 'Electronics', 10, 1200),
(102, 'T-Shirt', 'Clothing', 11, 25),
(103, 'Microwave', 'Home Appliance', 12, 300),
(104, 'Headphones', 'Electronics', 10, 150),
(105, 'Jacket', 'Clothing', 11, 90),
(106, 'Desk Lamp', 'Home Appliance', 12, 60);

INSERT INTO Orders VALUES
(1001, 1, 100, '2023-05-10', 1, 850.00),
(1002, 2, 101, '2022-07-21', 1, 1200.00),
(1003, 3, 102, '2023-01-15', 3, 75.00),
(1004, 4, 104, '2023-09-03', 2, 300.00),
(1005, 1, 103, '2022-03-18', 1, 300.00),
(1006, 5, 105, '2023-04-10', 2, 180.00),
(1007, 3, 106, '2023-10-05', 1, 60.00);

-- ============================================
-- EASY TASKS
-- ============================================

-- 1. Orders after 2022
SELECT 'EASY 1 - Orders after 2022' AS Task;
SELECT o.OrderID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) > 2022;

-- 2. Employees in Sales or Marketing
SELECT 'EASY 2 - Employees in Sales or Marketing' AS Task;
SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing');

-- 3. Highest salary in each department
SELECT 'EASY 3 - Highest salary in each department' AS Task;
SELECT d.DepartmentName, MAX(e.Salary) AS MaxSalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 4. USA customers with 2023 orders
SELECT 'EASY 4 - USA customers with 2023 orders' AS Task;
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderID, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' AND YEAR(o.OrderDate) = 2023;

-- 5. Total orders per customer
SELECT 'EASY 5 - Total orders per customer' AS Task;
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;

-- ============================================
-- MEDIUM TASKS
-- ============================================

-- 6. Orders greater than 500
SELECT 'MEDIUM 1 - Orders > 500' AS Task;
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.TotalAmount AS OrderTotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount > 500;

-- 7. Sales in 2022 or amount > 400
SELECT 'MEDIUM 2 - Sales in 2022 or amount > 400' AS Task;
SELECT p.ProductName, o.OrderDate AS SaleDate, o.TotalAmount AS SaleAmount
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = 2022 OR o.TotalAmount > 400;

-- 8. Total sales per product
SELECT 'MEDIUM 3 - Total sales per product' AS Task;
SELECT p.ProductName, SUM(o.TotalAmount) AS TotalSalesAmount
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName;

-- ============================================
-- HARD TASKS
-- ============================================

-- 9. Products that have never been ordered
SELECT 'HARD 1 - Products never ordered' AS Task;
SELECT p.ProductName
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.ProductID IS NULL;

-- 10. Top 2 highest-selling products by revenue
SELECT 'HARD 2 - Top 2 highest-selling products' AS Task;
SELECT TOP 2 p.ProductName, SUM(o.TotalAmount) AS TotalRevenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;

-- 11. Average order amount per country
SELECT 'HARD 3 - Average order amount per country' AS Task;
SELECT c.Country, AVG(o.TotalAmount) AS AvgOrderAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Country;

-- 12. Employees earning more than average salary
SELECT 'HARD 4 - Employees above average salary' AS Task;
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 13. Customers who ordered from multiple countries’ suppliers
SELECT 'HARD 5 - Customers with multi-country suppliers' AS Task;
SELECT DISTINCT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
JOIN Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY c.FirstName, c.LastName
HAVING COUNT(DISTINCT s.SupplierName) > 1;

-- 14. Top earning department (sum of employee salaries)
SELECT 'HARD 6 - Top earning department' AS Task;
SELECT TOP 1 d.DepartmentName, SUM(e.Salary) AS TotalDeptSalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalDeptSalary DESC;
