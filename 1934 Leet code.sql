
USE sample_db;

SELECT * FROM sign_1;

SELECT * FROM confiramation;

WITH CTE AS (
SELECT s.user_id, count(action) as cnt

FROM sign_1 as s

LEFT join Confiramation as c 

on s.user_id = c.user_id 

group by s.user_id


)

SELECT user_id , avg(count(*) / cnt)

FROM CTE 

GROUP BY user_id;

# Write your MySQL query statement below


select s.user_id, avg(if(c.action="confirmed",1,0)) as confiramation_rate
from Sign_1 as s 
left join Confiramation as c on s.user_id= c.user_id 
group by s.user_id

