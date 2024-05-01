-- 1683. Invalid Tweets
-- https://leetcode.com/problems/invalid-tweets/

-- Schema:
Create table If Not Exists Tweets(
    tweet_id int,
    content varchar(50)
);

-- Rows:
Truncate table Tweets;
insert into Tweets (tweet_id, content) values ('1', 'Vote for Biden');
insert into Tweets (tweet_id, content) values ('2', 'Let us make America great again!');

-- Ans:
SELECT tweet_id FROM tweets WHERE length(content) > 15;
