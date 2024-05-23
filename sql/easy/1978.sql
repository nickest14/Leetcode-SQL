-- 1978. Employees Whose Manager Left the Company
-- https://leetcode.com/problems/employees-whose-manager-left-the-company/

-- Schema:
Create table If Not Exists Employees (
    employee_id int,
    name varchar(20),
    manager_id int,
    salary int
);

-- Rows:
Truncate table Employees;
insert into Employees (employee_id, name, manager_id, salary) values ('3', 'Mila', '9', '60301');
insert into Employees (employee_id, name, manager_id, salary) values ('12', 'Antonella', null, '31000');
insert into Employees (employee_id, name, manager_id, salary) values ('13', 'Emery', null, '67084');
insert into Employees (employee_id, name, manager_id, salary) values ('1', 'Kalel', '11', '21241');
insert into Employees (employee_id, name, manager_id, salary) values ('9', 'Mikaela', null, '50937');
insert into Employees (employee_id, name, manager_id, salary) values ('11', 'Joziah', '6', '28485');

-- Ans:
SELECT employee_id FROM Employees
WHERE salary < 30000 AND manager_id not in (SELECT employee_id FROM Employees)
ORDER BY employee_id;