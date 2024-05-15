-- 1070. Product Sales Analysis III
-- https://leetcode.com/problems/product-sales-analysis-iii/

-- Schema:
Create table If Not Exists Sales (
    sale_id int,
    product_id int,
    year int,
    quantity int,
    price int
);

Create table If Not Exists Product (
    product_id int,
    product_name varchar(10)
);


-- Rows:
Truncate table Sales;
insert into Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000');
Truncate table Product;
insert into Product (product_id, product_name) values ('100', 'Nokia');
insert into Product (product_id, product_name) values ('200', 'Apple');
insert into Product (product_id, product_name) values ('300', 'Samsung');

-- Ans:
WITH CTE AS (
    SELECT product_id, MIN(year) AS minyear FROM Sales
    GROUP BY product_id
)
SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales AS s JOIN CTE AS cte
ON s.product_id = cte.product_id AND s.year = cte.minyear;

-- Another solution, more faster
select product_id, year as first_year, quantity, price
from sales
where (product_id, year) in (select product_id, min(year) from sales group by product_id);