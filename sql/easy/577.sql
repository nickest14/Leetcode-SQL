-- 577. Employee Bonus
-- https://leetcode.com/problems/employee-bonus/

-- Schema:
Create table If Not Exists Employee (
    empId int,
    name varchar(255),
    supervisor int, salary int
);

Create table If Not Exists Bonus (
    empId int,
    bonus int
);

-- Rows:
Truncate table Employee;
insert into Employee (empId, name, supervisor, salary) values ('3', 'Brad', null, '4000');
insert into Employee (empId, name, supervisor, salary) values ('1', 'John', '3', '1000');
insert into Employee (empId, name, supervisor, salary) values ('2', 'Dan', '3', '2000');
insert into Employee (empId, name, supervisor, salary) values ('4', 'Thomas', '3', '4000');
Truncate table Bonus;
insert into Bonus (empId, bonus) values ('2', '500');
insert into Bonus (empId, bonus) values ('4', '2000');
insert into Bonus (empId, bonus) values ('2', '100');

-- Ans:
-- * empId is the column of unique values for this table.
SELECT e.name, b.bonus FROM Employee AS e LEFT JOIN Bonus AS b
ON e.empId = b.empID
WHERE b.bonus < 1000 OR b.bonus IS NULL;

-- -- If empId is not unique values in bonus table.
-- SELECT e.name, Sum(b.bonus) AS bonus FROM Employee AS e LEFT JOIN Bonus AS b
-- ON e.empId = b.empID
-- GROUP BY e.name HAVING COALESCE(Sum(b.bonus), 0) < 1000;
