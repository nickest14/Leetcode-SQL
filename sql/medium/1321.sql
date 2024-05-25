-- 1321. Restaurant Growth
-- https://leetcode.com/problems/restaurant-growth/

-- Schema:
Create table If Not Exists Customer (
    customer_id int,
    name varchar(20),
    visited_on date,
    amount int
);

-- Rows:
Truncate table Customer;
insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', '2019-01-01', '100');
insert into Customer (customer_id, name, visited_on, amount) values ('2', 'Daniel', '2019-01-02', '110');
insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', '2019-01-03', '120');
insert into Customer (customer_id, name, visited_on, amount) values ('4', 'Khaled', '2019-01-04', '130');
insert into Customer (customer_id, name, visited_on, amount) values ('5', 'Winston', '2019-01-05', '110');
insert into Customer (customer_id, name, visited_on, amount) values ('6', 'Elvis', '2019-01-06', '140');
insert into Customer (customer_id, name, visited_on, amount) values ('7', 'Anna', '2019-01-07', '150');
insert into Customer (customer_id, name, visited_on, amount) values ('8', 'Maria', '2019-01-08', '80');
insert into Customer (customer_id, name, visited_on, amount) values ('9', 'Jaze', '2019-01-09', '110');
insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', '2019-01-10', '130');
insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', '2019-01-10', '150');

-- Ans:
WITH daily_amount AS (
    SELECT visited_on, sum(amount) AS amount
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on
),
cte AS (
    SELECT
        visited_on,
        amount,
        SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_sum,
        COUNT(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_count
    FROM daily_amount
)
SELECT
    visited_on,
    rolling_sum AS amount,
    ROUND(rolling_sum::NUMERIC / rolling_count, 2) AS average_amount
FROM cte
WHERE rolling_count = 7
ORDER BY visited_on;
