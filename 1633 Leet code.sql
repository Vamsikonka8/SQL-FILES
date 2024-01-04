use sample_db;


create table users(
 user_id int,
 user_name varchar(20));
 insert into users values(
 6       ,"Alice"     ),
(2       ," Bob   "    ),
( 7       ,"Alex "     );


create table register(
contest_id int,
 user_id int);
 
 insert into register values(
 215        , 6       ),
(209        ,2       ),
( 208        ,2       ),
(210        , 6       ),
( 208        , 6       ),
( 209        , 7       ),
( 209        , 6       ),
( 215        , 7       ),
( 208        , 7       ),
( 210        , 2       ),
( 207        , 2       ),
( 210        , 7       );

select * from users;
select * from register;
-- solution
SELECT r.contest_id ,round(count( r.contest_id) / 3 * 100 , 2)as percentage 
from users as s
left join register as r
on s.user_id = r.user_id
GROUP BY r.contest_id
order by percentage desc , contest_id ;



select contest_id , round(count(user_id) / (select count(user_id) from users) * 100 , 2) as percentage
from register 
group by contest_id
order by percentage desc , contest_id
