-- 570. Managers with at Least 5 Direct Reports
-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/

-- Schema:
Create table If Not Exists Employee (
    id int,
    name varchar(255),
    department varchar(255),
    managerId int
);

-- Rows:
Truncate table Employee;
insert into Employee (id, name, department, managerId) values ('101', 'John', 'A', null);
insert into Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101');
insert into Employee (id, name, department, managerId) values ('103', 'James', 'A', '101');
insert into Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101');
insert into Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101');
insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101');

-- Ans:
SELECT m.name
FROM employee as e
JOIN employee as m on e.managerId = m.id
GROUP BY e.managerId, m.name
HAVING Count(e.id) >= 5;

-- Other ans:
SELECT name FROM Employee WHERE id IN (
    SELECT DISTINCT managerId FROM Employee
    GROUP BY managerId
    HAVING managerId IS NOT NULL and COUNT(managerId) >= 5
);
