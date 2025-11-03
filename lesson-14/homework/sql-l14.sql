CREATE TABLE [dbo].[TestMultipleColumns]
(
[Id] [int] NULL,
[Name] [varchar](20) NULL
)
 
INSERT INTO [TestMultipleColumns] VALUES
(1,    'Pawan,Kumar'),
(2,    'Sandeep,Goyal'),
(3,    'Isha,Mattoo'),
(4,    'Gopal,Ranjan'),
(5,    'Neeraj,Garg'),
(6,    'Deepak,Sharma'),
(7,    ' Mayank,Tripathi')
 
select 
    id,
    left(name, charindex(',', name) - 1) as name,
    substring(name, charindex(',', name) + 1, len(name)) as surname
from testmultiplecolumns;


-- 2️⃣ find stri  ngs that contain the % character (testpercent)
CREATE TABLE TestPercent
(
    Strs VARCHAR(100)
)
 
INSERT INTO TestPercent
SELECT 'Pawan'
UNION ALL
SELECT 'Pawan%'
UNION ALL
SELECT 'Pawan%Kumar'
UNION ALL
SELECT '%'

select *
from testpercent
where strs like '%\%%' escape '\';

-- 3️⃣ split a string based on dot (splitter)
CREATE TABLE Splitter
(
     Id INT
    ,Vals VARCHAR(100)
)
 
INSERT INTO Splitter VALUES
(1,'P.K'),
(2,'a.b'),
(3,'c.d'),
(4,'e.J'),
(5,'t.u.b')
select
    id,
    left(vals, charindex('.', vals) - 1) as part1,
    substring(vals, charindex('.', vals) + 1, len(vals)) as part2
from splitter;


-- 4️⃣ return rows where vals contain more than two dots (testdots)

CREATE TABLE testDots
(
     ID INT
    ,Vals VARCHAR(100)
)
 
INSERT INTO testDots VALUES
(1,'0.0'),
(2,'2.3.1.1'),
(3,'4.1.a.3.9'),
(4,'1.1.'),
(5,'a.b.b.b.b.b..b..b'),
(6,'6.')
select *
from testdots
where len(vals) - len(replace(vals, '.', '')) > 2;


-- 5️⃣ count the spaces present in the string (countspaces)

CREATE TABLE CountSpaces
(
texts VARCHAR(100)
)

 
INSERT INTO CountSpaces VALUES
('P Q R S '),
(' L M N O 0 0     '),
('I  am here only '),
(' Welcome to the new world '),
(' Hello world program'),
(' Are u nuts ')

select
    texts,
    len(texts) - len(replace(texts, ' ', '')) as space_count
from countspaces;

-- 6️⃣ find employees who earn more than their managers (employee)
select e.name as employee, e.salary, m.name as manager, m.salary as manager_salary
from employee e
join employee m on e.managerid = m.id
where e.salary > m.salary;

-- 7️⃣ employees who worked more than 10 but less than 15 years (employees)
select
    employee_id,
    first_name,
    last_name,
    hire_date,
    timestampdiff(year, hire_date, curdate()) as years_of_service
from employees
where timestampdiff(year, hire_date, curdate()) between 10 and 15;

-- 🟡 medium tasks

-- 8️⃣ find all date ids with higher temperature than previous day (weather)
select w1.id, w1.recorddate, w1.temperature
from weather w1
join weather w2
on datediff(w1.recorddate, w2.recorddate) = 1
where w1.temperature > w2.temperature;

-- 9️⃣ report the first login date for each player (activity)
select player_id, min(event_date) as first_login
from activity
group by player_id;

-- 🔟 return the third item from the list (fruits)
select
    trim(substring_index(substring_index(fruit_list, ',', 3), ',', -1)) as third_fruit
from fruits;

-- 11️⃣ determine employment stage (employees)
select
    employee_id,
    first_name,
    last_name,
    hire_date,
    case
        when timestampdiff(year, hire_date, curdate()) < 1 then 'new hire'
        when timestampdiff(year, hire_date, curdate()) between 1 and 5 then 'junior'
        when timestampdiff(year, hire_date, curdate()) between 5 and 10 then 'mid-level'
        when timestampdiff(year, hire_date, curdate()) between 10 and 20 then 'senior'
        else 'veteran'
    end as employment_stage
from employees;

-- 12️⃣ extract the integer at the start of the string (getintegers)
select
    id,
    vals,
    cast(substring_index(vals, ' ', 1) as unsigned) as integer_start
from getintegers
where vals regexp '^[0-9]+';

-- 🔴 difficult tasks

-- 13️⃣ swap first two letters of the comma separated string (multiplevals)
select
    id,
    concat(
        substring_index(substring_index(vals, ',', 1), ',', -1, 2),
        ',',
        substring_index(vals, ',', -1)
    ) as swapped_vals
from multiplevals;

-- 14️⃣ convert each character from a string into a row (example: 'sdgfhsdgfhs@121313131')
with recursive chars as (
    select 1 as n, substring('sdgfhsdgfhs@121313131', 1, 1) as ch
    union all
    select n + 1, substring('sdgfhsdgfhs@121313131', n + 1, 1)
    from chars
    where n < length('sdgfhsdgfhs@121313131')
)
select ch from chars;

-- 15️⃣ device first logged in for each player (activity)
select a.player_id, a.device_id
from activity a
join (
    select player_id, min(event_date) as first_login
    from activity
    group by player_id
) b on a.player_id = b.player_id and a.event_date = b.first_login;

-- 16️⃣ separate integer and character values into two columns (rtcfvty34redt)
select
    regexp_replace('rtcfvty34redt', '[^0-9]', '') as numbers,
    regexp_replace('rtcfvty34redt', '[0-9]', '') as letters;
