-- 1341. Movie Rating
-- https://leetcode.com/problems/movie-rating/

-- Schema:
Create table If Not Exists Movies (
    movie_id int,
    title varchar(30)
);
Create table If Not Exists Users (
    user_id int,
    name varchar(30)
);
Create table If Not Exists MovieRating (
    movie_id int,
    user_id int,
    rating int, created_at date
);

-- Rows:
Truncate table Movies;
insert into Movies (movie_id, title) values ('1', 'Avengers');
insert into Movies (movie_id, title) values ('2', 'Frozen 2');
insert into Movies (movie_id, title) values ('3', 'Joker');
Truncate table Users;
insert into Users (user_id, name) values ('1', 'Daniel');
insert into Users (user_id, name) values ('2', 'Monica');
insert into Users (user_id, name) values ('3', 'Maria');
insert into Users (user_id, name) values ('4', 'James');
Truncate table MovieRating;
insert into MovieRating (movie_id, user_id, rating, created_at) values ('1', '1', '3', '2020-01-12');
insert into MovieRating (movie_id, user_id, rating, created_at) values ('1', '2', '4', '2020-02-11');
insert into MovieRating (movie_id, user_id, rating, created_at) values ('1', '3', '2', '2020-02-12');
insert into MovieRating (movie_id, user_id, rating, created_at) values ('1', '4', '1', '2020-01-01');
insert into MovieRating (movie_id, user_id, rating, created_at) values ('2', '1', '5', '2020-02-17');
insert into MovieRating (movie_id, user_id, rating, created_at) values ('2', '2', '2', '2020-02-01');
insert into MovieRating (movie_id, user_id, rating, created_at) values ('2', '3', '2', '2020-03-01');
insert into MovieRating (movie_id, user_id, rating, created_at) values ('3', '1', '3', '2020-02-22');
insert into MovieRating (movie_id, user_id, rating, created_at) values ('3', '2', '4', '2020-02-25');

-- Ans:
WITH highers_rater AS (
    SELECT u.name, COUNT(m.movie_id)
    FROM Users AS u
    LEFT JOIN MovieRating AS mr ON u.user_id = mr.user_id
    LEFT JOIN Movies AS m ON mr.movie_id = m.movie_id
    GROUP BY 1
    ORDER BY 2 DESC, 1 ASC
    LIMIT 1
),
highest_rated AS
(
    SELECT m.title, SUM(mr.rating)::NUMERIC / COUNT(mr.rating) AS avg_rating
    FROM Movies AS m
    LEFT JOIN MovieRating AS mr ON m.movie_id = mr.movie_id
    WHERE mr.created_at >= '2020-02-01' AND mr.created_at < '2020-03-01'
    GROUP BY 1
    ORDER BY 2 DESC, 1 ASC
    LIMIT 1
)
SELECT name AS results FROM highers_rater
UNION ALL
SELECT title AS results FROM highest_rated;