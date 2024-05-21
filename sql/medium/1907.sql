-- 1907. Count Salary Categories
-- https://leetcode.com/problems/count-salary-categories/

-- Schema:
Create table If Not Exists Accounts (
    account_id int,
    income int
);

-- Rows:
Truncate table Accounts;
insert into Accounts (account_id, income) values ('3', '108939');
insert into Accounts (account_id, income) values ('2', '12747');
insert into Accounts (account_id, income) values ('8', '87709');
insert into Accounts (account_id, income) values ('6', '91796');
insert into Accounts (account_id, income) values ('9', '30000');

-- Ans:
WITH cte AS (
    SELECT *
    FROM (/problems/count-salary-categories/
        values('Low Salary', 0, 19999), ('Average Salary', 20000, 50000), ('High Salary', 50001, 100000000)
    )
    AS r (name, min_value, max_value)
)
SELECT name AS category, COUNT(accounts.account_id) AS accounts_count
FROM cte LEFT JOIN accounts
ON accounts.income >= cte.min_value AND accounts.income <= cte.max_value
GROUP BY name;

-- Another solution
SELECT
    unnest(array['Low Salary', 'Average Salary', 'High Salary']) AS "category",
    unnest(array[
        SUM (CASE WHEN income < 20000 THEN 1 ELSE 0 END),
        SUM (CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END),
        SUM (CASE WHEN income > 50000 THEN 1 ELSE 0 END)
    ]) AS "accounts_count"
FROM Accounts;

-- Another solution
SELECT 'Low Salary' as category, COUNT(account_id) as accounts_count
FROM Accounts
WHERE income < 20000
    UNION
SELECT 'Average Salary' as category, COUNT(account_id) as accounts_count
FROM Accounts
WHERE income BETWEEN 20000 AND 50000
    UNION
SELECT 'High Salary' as category, COUNT(account_id) as accounts_count
FROM Accounts
WHERE income > 50000;