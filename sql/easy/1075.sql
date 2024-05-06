-- 1075. Project Employees I
-- https://leetcode.com/problems/project-employees-i/

-- Schema:
Create table If Not Exists Project (
    project_id int,
    employee_id int
);

Create table If Not Exists Employee (
    employee_id int,
    name varchar(10),
    experience_years int
);

-- Rows:
Truncate table Project;
insert into Project (project_id, employee_id) values ('1', '1');
insert into Project (project_id, employee_id) values ('1', '2');
insert into Project (project_id, employee_id) values ('1', '3');
insert into Project (project_id, employee_id) values ('2', '1');
insert into Project (project_id, employee_id) values ('2', '4');
Truncate table Employee;
insert into Employee (employee_id, name, experience_years) values ('1', 'Khaled', '3');
insert into Employee (employee_id, name, experience_years) values ('2', 'Ali', '2');
insert into Employee (employee_id, name, experience_years) values ('3', 'John', '1');
insert into Employee (employee_id, name, experience_years) values ('4', 'Doe', '2');

-- Ans:
SELECT project_id, ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project AS p JOIN Employee AS e ON p.employee_id = e.employee_id
GROUP BY p.project_id;
