use sample_db ;
-- 1141. User Activity for the Past 30 Days I
-- Easy
-- Topics
-- Companies
-- SQL Schema
-- Pandas Schema
-- Table: Activity

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | session_id    | int     |
-- | activity_date | date    |
-- | activity_type | enum    |
-- +---------------+---------+
-- This table may have duplicate rows.
-- The activity_type column is an ENUM (category) of type ('open_session', 'end_session', 'scroll_down', 'send_message').
-- The table shows the user activities for a social media website. 
-- Note that each session belongs to exactly one user.
--  

-- Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.

-- Return the result table in any order.

-- The result format is in the following example.
create table Activity (
user_id int ,
 session_id int ,
 activity_date date,
 activity_type varchar(20));
 
 insert into Activity values (
 1    ,    1      ,     "2019-07-20" ,     "open_session"  ),
( 1      ,  1      ,     "2019-07-20" ,    "scroll_down"  ),
(1       , 1        ,  "2019-07-20"  , "end_session"   ),
( 2       , 4        ,  "2019-07-20"  ,  "open_session"  ),
( 2       , 4      ,    "2019-07-21"   ,  "send_message"  ),
( 2       , 4       ,   "2019-07-21"    , "end_session"   ),
( 3       , 2          , "2019-07-21" ,   "open_session"  ),
( 3       , 2          , "2019-07-21"  ,  "send_message"  ),
( 3       , 2          , "2019-07-21"    , "end_session"   ),
( 4       , 3          , "2019-06-25"    , "open_session"  ),
( 4       , 3          , "2019-06-25"    , "end_session"   );
-- Write a solution to find the daily active user count for a period of 30 days ending 2019-07-21inclusively. A user was active on someday if they made at least one activity on that day.

-- Return the result table in any order.

-- The result format is in the following example.

-- SOLUTION 

select activity_date , count(distinct session_id) as active_users
from activity
where activity_date > "2019-06-25" and activity_date <= "2019-07-25"
group by  activity_date;


