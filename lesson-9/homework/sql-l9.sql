select * from Products
cross join Suppliers
where Products.SupplierID = Suppliers.SupplierID

select * from Departments
cross join Employees
where Departments.DepartmentID = Employees.DepartmentID

select * from Products
join Suppliers
on Products.SupplierID = Suppliers.SupplierID

select * from Orders
right join Customers
on Orders.CustomerID = Customers.CustomerID

select * from Courses
join Enrollments
on Courses.CourseID = Enrollments.CourseID
join Students
on Enrollments.StudentID = Students.StudentID

select * from Products
right join Orders
on Products.ProductID = Orders.ProductID

select * from Departments
join Employees
on Departments.DepartmentID = Employees.DepartmentID

select * from Students
join Enrollments
on Students.StudentID = Enrollments.CourseID

select * from Payments
join Orders
on Payments.OrderID = Orders.OrderID

select * from Orders
join Products
on Orders.ProductID = Products.ProductID
where price > 100


select DepartmentName, [Name] from Employees
cross join Departments
where Departments.DepartmentID <> Employees.DepartmentID

select * from Orders
join Products
on Orders.ProductID = Products.ProductID
where Quantity < StockQuantity

select CONCAT_WS(' ', Customers.FirstName, Customers.LastName), Customers.CustomerID from Customers
join Sales
on Customers.CustomerID = Sales.CustomerID
where SaleAmount > 500

select Students.[Name], Courses.CourseName  from Students
join Enrollments
on Students.StudentID = Enrollments.CourseID
join Courses
on Courses.CourseID = Enrollments.CourseID

select * from Products
join Suppliers
on Products.SupplierID = Suppliers.SupplierID
where SupplierName like 'tech%'

select * from Orders
join Payments
on Payments.OrderID = Orders.OrderID
where TotalAmount > Payments.Amount


select Employees.[Name], DepartmentName from Departments
join Employees
on Departments.DepartmentID = Employees.DepartmentID

select * from Products
join Categories
on Products.Category = Categories.CategoryID
where CategoryName = 'Electronics' or CategoryName = 'Furniture'

select * from Sales
join Customers
on Sales.CustomerID = Customers.CustomerID
where Country = 'USA'

select * from Orders
join Customers
on Orders.CustomerID = Customers.CustomerID
where Country = 'Germany' and TotalAmount > 100




select * from Employees
cross join Departments


select * from Employees
select * from Departments


select * from Payments
join Orders
on Payments.OrderID = Orders.OrderID
where Quantity <> Payments.Amount

select * from Students
left join Enrollments
on Students.StudentID = Enrollments.StudentID
where Students.StudentID is null 

select m.ManagerID, m.EmployeeID, m.Salary from Employees m
join Employees e
on m.EmployeeID = e.ManagerID
where m.Salary <= e.Salary

select * from Orders
left join Payments
on Orders.OrderID = Payments.OrderID
where PaymentID is null 

select e1.EmployeeID as Employee1_ID, e1.[Name] as Employee1_Name, e2.EmployeeID as Employee2_ID, e2.[Name] as Employee2_Name from Employees e1
join Employees e2
on e1.EmployeeID <> e2.DepartmentID and e1.EmployeeID < e2.EmployeeID
