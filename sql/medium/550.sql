-- 550. Game Play Analysis IV
-- https://leetcode.com/problems/game-play-analysis-iv/

-- Schema:
Create table If Not Exists Activity (
    player_id int,
    device_id int,
    event_date date,
    games_played int
);

-- Rows:
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');

-- Ans:
WITH player_id_with_first_day AS (SELECT DISTINCT ON(player_id) * FROM Activity ORDER BY player_id, event_date)
SELECT ROUND(COUNT(logged_back.event_date) / COUNT(first_day.player_id)::DECIMAL, 2) AS fraction
FROM player_id_with_first_day AS first_day LEFT JOIN Activity AS logged_back
ON first_day.player_id = logged_back.player_id AND first_day.event_date + INTERVAL '1 DAY' = logged_back.event_date;
