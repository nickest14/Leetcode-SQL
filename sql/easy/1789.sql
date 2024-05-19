-- 1789. Primary Department for Each Employee
-- https://leetcode.com/problems/primary-department-for-each-employee/

-- Schema:
Create table If Not Exists Employee (
    employee_id int,
    department_id int,
    primary_flag CHAR(1) CHECK (primary_flag IN ('Y', 'N'))
);

-- Rows:
Truncate table Employee;
insert into Employee (employee_id, department_id, primary_flag) values ('1', '1', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('2', '1', 'Y');
insert into Employee (employee_id, department_id, primary_flag) values ('2', '2', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('3', '3', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '2', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '3', 'Y');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '4', 'N');

-- Ans:
WITH employee_id_with_number_of_department AS (
    SELECT employee_id, COUNT(department_id) AS number_of_department
    FROM Employee
    GROUP BY employee_id
)
SELECT e1.employee_id, department_id
FROM Employee AS e1
INNER JOIN employee_id_with_number_of_department AS e2
ON e1.employee_id = e2.employee_id
    AND (number_of_department = 1 OR primary_flag = 'Y');
