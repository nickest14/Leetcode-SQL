-- 1174. Immediate Food Delivery II
-- https://leetcode.com/problems/immediate-food-delivery-ii/

-- Schema:
Create table If Not Exists Delivery (
    delivery_id int,
    customer_id int,
    order_date date,
    customer_pref_delivery_date date
);


-- Rows:
Truncate table Delivery;
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', '2019-08-01', '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '2', '2019-08-02', '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', '2019-08-11', '2019-08-12');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', '2019-08-24', '2019-08-24');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '3', '2019-08-21', '2019-08-22');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', '2019-08-11', '2019-08-13');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('7', '4', '2019-08-09', '2019-08-09');

-- Ans:
WITH rankedOrders AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date ASC) AS order_number
    FROM Delivery
)
SELECT ROUND(
    SUM(
        CASE
            WHEN order_number = 1 AND order_date = customer_pref_delivery_date THEN 1
            ELSE 0
        END
    )::NUMERIC * 100 /
    SUM(
        CASE
            WHEN order_number = 1 THEN 1
            ELSE 0
        END
    ), 2) AS immediate_percentage
FROM rankedOrders;
