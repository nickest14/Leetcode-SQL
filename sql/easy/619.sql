-- 619. Biggest Single Number
-- https://leetcode.com/problems/biggest-single-number/

-- Schema:
Create table If Not Exists MyNumbers (
    num int
);

-- Rows:
Truncate table MyNumbers;
insert into MyNumbers (num) values ('8');
insert into MyNumbers (num) values ('8');
insert into MyNumbers (num) values ('3');
insert into MyNumbers (num) values ('3');
insert into MyNumbers (num) values ('1');
insert into MyNumbers (num) values ('4');
insert into MyNumbers (num) values ('5');
insert into MyNumbers (num) values ('6');

-- Ans:
WITH uniqle_cte AS (
    SELECT num FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
)
SELECT MAX(num) AS num
FROM uniqle_cte;

-- Other solution:
SELECT COALESCE(
    (
        SELECT num FROM MyNumbers
        GROUP BY num
        HAVING COUNT(num) = 1
        ORDER BY num DESC
        LIMIT 1
    )
) AS num;
