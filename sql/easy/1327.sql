-- 1327. List the Products Ordered in a Period
-- https://leetcode.com/problems/list-the-products-ordered-in-a-period/

-- Schema:
Create table If Not Exists Products (
    product_id int,
    product_name varchar(40),
    product_category varchar(40)
);

Create table If Not Exists Orders (
    product_id int,
    order_date date,
    unit int
);

-- Rows:
Truncate table Products;
insert into Products (product_id, product_name, product_category) values ('1', 'Leetcode Solutions', 'Book');
insert into Products (product_id, product_name, product_category) values ('2', 'Jewels of Stringology', 'Book');
insert into Products (product_id, product_name, product_category) values ('3', 'HP', 'Laptop');
insert into Products (product_id, product_name, product_category) values ('4', 'Lenovo', 'Laptop');
insert into Products (product_id, product_name, product_category) values ('5', 'Leetcode Kit', 'T-shirt');
Truncate table Orders;
insert into Orders (product_id, order_date, unit) values ('1', '2020-02-05', '60');
insert into Orders (product_id, order_date, unit) values ('1', '2020-02-10', '70');
insert into Orders (product_id, order_date, unit) values ('2', '2020-01-18', '30');
insert into Orders (product_id, order_date, unit) values ('2', '2020-02-11', '80');
insert into Orders (product_id, order_date, unit) values ('3', '2020-02-17', '2');
insert into Orders (product_id, order_date, unit) values ('3', '2020-02-24', '3');
insert into Orders (product_id, order_date, unit) values ('4', '2020-03-01', '20');
insert into Orders (product_id, order_date, unit) values ('4', '2020-03-04', '30');
insert into Orders (product_id, order_date, unit) values ('4', '2020-03-04', '60');
insert into Orders (product_id, order_date, unit) values ('5', '2020-02-25', '50');
insert into Orders (product_id, order_date, unit) values ('5', '2020-02-27', '50');
insert into Orders (product_id, order_date, unit) values ('5', '2020-03-01', '50');

-- Ans:
SELECT p.product_name, SUM(ord.unit) AS unit
FROM Orders AS ord INNER JOIN Products AS p ON ord.product_id = p.product_id
WHERE ord.order_date >= '2020-02-01' AND ord.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(ord.unit) >= 100;

-- Another solution
WITH cte AS (
    SELECT ord.product_id, ord.unit, p.product_name
    FROM Orders AS ord INNER JOIN Products AS p ON ord.product_id = p.product_id
    WHERE ord.order_date BETWEEN '2020-02-01' AND '2020-02-29'
)
SELECT product_name, SUM(unit) AS unit
FROM cte
GROUP BY product_name
HAVING SUM(unit) >= 100;