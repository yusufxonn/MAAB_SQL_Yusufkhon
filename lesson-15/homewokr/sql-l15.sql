
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);




CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees_dept (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees_dept (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);

SELECT *
FROM employees_dept
WHERE department_id = (
    SELECT id FROM departments WHERE department_name = 'Sales'
);


-- 4. Find Customers with No Orders
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);

SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id FROM orders
);


-- ================================
-- Level 3: Aggregation and Grouping in Subqueries
-- ================================

-- 5. Find Products with Max Price in Each Category
CREATE TABLE products_cat (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products_cat (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);

SELECT *
FROM products_cat p
WHERE price = (
    SELECT MAX(price)
    FROM products_cat
    WHERE category_id = p.category_id
);


-- 6. Find Employees in Department with Highest Average Salary
CREATE TABLE departments_avg (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees_avg (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments_avg(id)
);

INSERT INTO departments_avg (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employees_avg (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);

SELECT *
FROM employees_avg
WHERE department_id = (
    SELECT TOP 1 department_id
    FROM employees_avg
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);




CREATE TABLE employees_corr (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees_corr (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);

SELECT *
FROM employees_corr e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees_corr
    WHERE department_id = e.department_id
);


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);

SELECT s.name, g.course_id, g.grade
FROM grades g
JOIN students s ON g.student_id = s.student_id
WHERE g.grade = (
    SELECT MAX(grade)
    FROM grades
    WHERE course_id = g.course_id
);



CREATE TABLE products_rank (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products_rank (id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);

SELECT *
FROM products_rank p
WHERE 2 = (
    SELECT COUNT(DISTINCT price)
    FROM products_rank
    WHERE category_id = p.category_id AND price > p.price
);


    CREATE TABLE employees_final (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees_final (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);

SELECT *
FROM employees_final e
WHERE salary > (SELECT AVG(salary) FROM employees_final)
  AND salary < (
      SELECT MAX(salary)
      FROM employees_final
      WHERE department_id = e.department_id
  );
