-- 176. Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/

-- Schema:
Create table If Not Exists Employee (
    id int,
    salary int
);

-- Rows:
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

-- Ans:
WITH ranked_salary AS (
    SELECT *, dense_rank() OVER(ORDER BY salary DESC) AS rank FROM Employee
)
SELECT min(salary) AS SecondHighestSalary FROM ranked_salary WHERE rank = 2;