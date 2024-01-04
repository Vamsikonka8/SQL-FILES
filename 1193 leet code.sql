
use sample_db;

-- 1193. Monthly Transactions I
-- Transactions table:
-- Table: Transactions

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | country       | varchar |
-- | state         | enum    |
-- | amount        | int     |
-- | trans_date    | date    |
-- +---------------+---------+
-- id is the primary key of this table.
-- The table has information about incoming transactions.
-- The state column is an enum of type ["approved", "declined"].
--  

-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

-- Return the result table in any order.

-- The query result format is in the following example.
DROP TABLE Transactions ;
 create table Transactions (
 id  int ,
 country  varchar (20) ,
 state    varchar (20),
 amount int ,
 trans_date date );
 
 insert into Transactions values (
 
121  ,"US"     ,"approved", 1000 ,  "2018-12-18"),
( 122  ,"US"   ,"declined" , 2000   ,"2018-12-19"),
( 123  ,"US"    ,"approved" , 2000   ,"2019-01-01"),
(124  ,"DE"     ,"approved",2000  , "2019-01-07");

select * from Transactions;

with cte as (
select month(trans_date)as bb
from Transactions
)
select  SUM(amount) as vv
From cte 
group by  ;


 

-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

-- Return the result table in any order.

-- The query result format is in the following example.


SELECT * FROM Transactions;
-- solution

SELECT   month , country , count(country) as trans_count,
SUM(CASE WHEN T.state = "approved" THEN 1 ELSE 0 END) as approved_count ,sum(amount) as trans_total_amount,
sum(CASE WHEN T.state = "approved" THEN T.amount ELSE 0 END)  approved_total_amount
FROM (SELECT date_format(trans_date , "%Y-%m") as month , country , amount , state FROM Transactions ) as T
Group by country , month ;

