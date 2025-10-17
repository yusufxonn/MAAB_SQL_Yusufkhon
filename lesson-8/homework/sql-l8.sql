select Category, Count(*) as TotalProducts 
from Products
group by Category

select AVG(price) as AvgPrice
from Products
where category = 'Electronics'

select * from Customers
where city like 'L%'

select * from Products
where ProductName like '%er'


select * from Customers
where Country like '%a'

select max(Price) from Products

select ProductName, 
					StockQuantity,
								case
									when StockQuantity < 30 then 'Low Stock'
									else 'Sufficient'
									end as StockStatus
									from Products

select Country, count(*) as TotalCustomers from Customers
group by Country

select  min (Quantity) as Min_Quantity, max(Quantity) as max_quantity from Orders

select * from Invoices

select distinct CustomerID from Orders
where year(OrderDate) = 2023 and MONTH(OrderDate) = 1
and CustomerID not in (
select distinct CustomerID from Invoices
where year(InvoiceDate) = 2023 and MONTH(InvoiceDate) = 1
)

SELECT ProductName,
       CASE
           WHEN Price < 100 THEN 'Low'
           WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
           ELSE 'High'
       END AS PriceGroup
FROM Products;


SELECT district_name,
       SUM(CASE WHEN year = '2012' THEN population END) AS [2012],
       SUM(CASE WHEN year = '2013' THEN population END) AS [2013]
INTO Population_Each_Year
FROM city_population
GROUP BY district_name;

SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;


SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';


SELECT year,
       SUM(CASE WHEN district_name = 'Bektemir' THEN population END) AS Bektemir,
       SUM(CASE WHEN district_name = 'Chilonzor' THEN population END) AS Chilonzor,
       SUM(CASE WHEN district_name = 'Yakkasaroy' THEN population END) AS Yakkasaroy
INTO Population_Each_City
FROM city_population
GROUP BY year;


SELECT TOP 3 CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

SELECT district_name AS District_Name, '2012' AS Year, [2012] AS Population
FROM Population_Each_Year
UNION ALL
SELECT district_name, '2013', [2013]
FROM Population_Each_Year;

SELECT p.ProductName, COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TimesSold DESC;

SELECT 'Bektemir' AS District_Name, year, Bektemir AS Population
FROM Population_Each_City
UNION ALL
SELECT 'Chilonzor', year, Chilonzor
FROM Population_Each_City
UNION ALL
SELECT 'Yakkasaroy', year, Yakkasaroy
FROM Population_Each_City;




