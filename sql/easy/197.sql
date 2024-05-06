-- 197. Rising Temperature
-- https://leetcode.com/problems/rising-temperature/

-- Schema:
Create table If Not Exists Weather (
    id int, recordDate date, temperature int
);

-- Rows:
Truncate table Weather;
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10');
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25');
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20');
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30');

-- Ans:
SELECT w1.id AS id FROM Weather AS w1 JOIN Weather AS w2 ON w1.recordDate = w2.recordDate + interval '1 day'
WHERE w1.temperature > w2.temperature;