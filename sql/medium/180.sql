-- 180. Consecutive Numbers
-- https://leetcode.com/problems/consecutive-numbers/

-- Schema:
Create table If Not Exists Logs (
    id int,
    num int
);

-- Rows:
Truncate table Logs;
insert into Logs (id, num) values ('1', '1');
insert into Logs (id, num) values ('2', '1');
insert into Logs (id, num) values ('3', '1');
insert into Logs (id, num) values ('4', '2');
insert into Logs (id, num) values ('5', '1');
insert into Logs (id, num) values ('6', '2');
insert into Logs (id, num) values ('7', '2');

-- -- Test case:
-- insert into Logs (id, num) values ('1', '1');
-- insert into Logs (id, num) values ('2', '1');
-- insert into Logs (id, num) values ('4', '1');
-- insert into Logs (id, num) values ('5', '1');
-- insert into Logs (id, num) values ('6', '2');
-- insert into Logs (id, num) values ('7', '1');

-- Ans:
WITH cte_logs AS(
    SELECT num,
    LEAD(num, 1) OVER(ORDER BY id) as next1,
    LEAD(num, 2) OVER(ORDER BY id) as next2,
    id,
    LEAD(id, 1) OVER(ORDER BY id) as id1,
    LEAD(id, 2) OVER(ORDER BY id) as id2
    FROM Logs
)
SELECT DISTINCT(num) AS ConsecutiveNums
FROM cte_logs
WHERE num=next1 AND num=next2 AND id=id1-1 AND id=id2-2;
