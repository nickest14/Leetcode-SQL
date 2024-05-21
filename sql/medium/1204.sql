-- 1204. Last Person to Fit in the Bus
-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/

-- Schema:
Create table If Not Exists Queue (
    person_id int,
    person_name varchar(30),
    weight int,
    turn int
);

-- Rows:
Truncate table Queue;
insert into Queue (person_id, person_name, weight, turn) values ('5', 'Alice', '250', '1');
insert into Queue (person_id, person_name, weight, turn) values ('4', 'Bob', '175', '5');
insert into Queue (person_id, person_name, weight, turn) values ('3', 'Alex', '350', '2');
insert into Queue (person_id, person_name, weight, turn) values ('6', 'John Cena', '400', '3');
insert into Queue (person_id, person_name, weight, turn) values ('1', 'Winston', '500', '6');
insert into Queue (person_id, person_name, weight, turn) values ('2', 'Marie', '200', '4');

-- Ans:
WITH person_name_with_total_weight AS (
    SELECT person_name, SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue ORDER BY turn DESC
)
SELECT person_name
FROM person_name_with_total_weight
WHERE total_weight <= 1000
LIMIT 1;
