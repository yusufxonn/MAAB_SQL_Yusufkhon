SELECT ProductName AS Name
FROM Products;

SELECT *
FROM Customers AS Client

select ProductName from  Products
 union 
select ProductName from Products_Discounted

select ProductName from Products
intersect 
select ProductName from Products_Discounted

SELECT DISTINCT CustomerName, Country
FROM Customers

SELECT ProductName,
       Price,
       CASE
           WHEN Price > 1000 THEN 'High'
           ELSE 'Low'
       END AS PriceCategory
FROM Products

SELECT ProductName,
       StockQuantity,
       IIF(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted

SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted

SELECT ProductName
FROM Products
EXCEPT
SELECT ProductName
FROM Products_Discounted

SELECT ProductName,
       Price,
       IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products

SELECT *
FROM Employees
WHERE Age < 25 OR Salary > 60000

UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department = 'HR' OR EmployeeID = 5


SELECT SaleID,
       CustomerID,
       SaleAmount,
       CASE
           WHEN SaleAmount > 500 THEN 'Top Tier'
           WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
           ELSE 'Low Tier'
       END AS SaleCategory
FROM Sales

SELECT CustomerID
FROM Orders
EXCEPT
SELECT CustomerID
FROM Sales

SELECT CustomerID,
       Quantity,
       CASE
           WHEN Quantity = 1 THEN '3%'
           WHEN Quantity BETWEEN 2 AND 3 THEN '5%'
           ELSE '7%'
       END AS DiscountPercentage
FROM Orders
