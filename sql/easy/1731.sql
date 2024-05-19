-- 1731. The Number of Employees Which Report to Each Employee
-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/

-- Schema:
Create table If Not Exists Employees(
    employee_id int,
    name varchar(20),
    reports_to int,
    age int
);

-- Rows:
Truncate table Employees;
insert into Employees (employee_id, name, reports_to, age) values ('9', 'Hercy', null, '43');
insert into Employees (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41');
insert into Employees (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36');
insert into Employees (employee_id, name, reports_to, age) values ('2', 'Winston', null, '37');

-- Ans:
WITH managers AS (
    SELECT reports_to AS employee_id,
    COUNT(reports_to) AS reports_count,
    ROUND(AVG(age)) AS average_age
    FROM Employees
    WHERE reports_to IS NOT null
    GROUP BY reports_to
)
SELECT employee_id, name, reports_count, average_age
FROM managers AS m JOIN Employees AS e
USING(employee_id)
ORDER BY employee_id;
