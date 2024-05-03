-- 1378. Replace Employee ID With The Unique Identifier
-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/

-- Schema:
Create table If Not Exists Employees (
    id int,
    name varchar(20)
);
Create table If Not Exists EmployeeUNI (
    id int,
    unique_id int
);

-- Rows:
Truncate table Employees;
insert into Employees (id, name) values ('1', 'Alice');
insert into Employees (id, name) values ('7', 'Bob');
insert into Employees (id, name) values ('11', 'Meir');
insert into Employees (id, name) values ('90', 'Winston');
insert into Employees (id, name) values ('3', 'Jonathan');

Truncate table EmployeeUNI;
insert into EmployeeUNI (id, unique_id) values ('3', '1');
insert into EmployeeUNI (id, unique_id) values ('11', '2');
insert into EmployeeUNI (id, unique_id) values ('90', '3');

-- Ans:
SELECT eu.unique_id AS unique_id, e.name AS name FROM Employees e LEFT JOIN EmployeeUNI eu ON e.id = eu.id;
