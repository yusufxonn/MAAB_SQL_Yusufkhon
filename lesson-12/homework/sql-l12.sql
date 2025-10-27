select 
    p.firstName,
    p.lastName,
    a.city,
    a.state
from Person p
left join Address a
on p.personId = a.personId;


select e.name as Employee from Employee e
join Employee m
on e.managerId = m.id
where e.salary > m.salary

SELECT 
    email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id > p2.id;

SELECT DISTINCT g.ParentName
FROM girls g
WHERE g.ParentName NOT IN (SELECT ParentName FROM boys);

SELECT 
    custid,
    SUM(salesamt) AS TotalSalesAbove50,
    MIN(weight) AS LeastWeight
FROM Sales.Orders
WHERE weight > 50
GROUP BY custid;

SELECT 
    c1.Item AS [Item Cart 1],
    c2.Item AS [Item Cart 2]
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2
ON c1.Item = c2.Item
ORDER BY 
    CASE WHEN c1.Item IS NULL THEN 1 ELSE 0 END,
    COALESCE(c1.Item, c2.Item);

SELECT 
    name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;


select s.student_id, s.student_name, sub.subject_name, count(e.subject_name) as attenteds from Students s
cross join Subjects sub
left join Examinations e
on s.student_id = e.student_id and sub.subject_name = e.subject_name
group by s.student_id, s.student_name, sub.subject_name
order by s.student_id, sub.subject_name







