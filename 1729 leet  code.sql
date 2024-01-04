
use sample_db;
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | user_id     | int  |
-- | follower_id | int  |
-- +-------------+------+
-- (user_id, follower_id) is the primary key (combination of columns with unique values) for this table.
-- This table contains the IDs of a user and a follower in a social media app where the follower follows the user.
--  

-- Write a solution that will, for each user, return the number of followers.

-- Return the result table ordered by user_id in ascending order.

-- The result format is in the following example.
-- create table Followers (
-- user_id  int ,
-- follower_id   int );

insert into Followers Values (
 0       , 1           ),
( 1       , 0           ),
( 2       , 0           ),
( 2       , 1           );


-- solution 
with cte as (
select *, dense_rank() over (partition by user_id order by  user_id ) as dnk
from Followers
)
select user_id , count(dnk)
from cte 
group by user_id
