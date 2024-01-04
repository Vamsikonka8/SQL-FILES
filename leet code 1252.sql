# average pages 
use sample_db;


-- Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places.

-- Return the result table in any order.
create  table price (

product_id int,
 start_date date,
 end_date   date,
 price  int);
insert into price values(
1          , "2019-02-17 "," 2019-02-28 ", 5      ),
(1  ,      "2019-03-01 " , "2019-03-22 " ,20     ),
( 2        ,  " 2019-02-01", "2019-02-20",  15     ),
( 2          ," 2019-02-21 " , " 2019-03-31 ", 30     );

create table units(
product_id int,
 purchase_date date ,
 units int);
 insert into units values(
 1          ," 2019-02-25    ",100   ),
( 1          ," 2019-03-01" ,     15    ),
( 2         , " 2019-02-10   " , 200   ),
( 2          , " 2019-03-22  "  , 30    );


select * from price;
select * from units;

select p.product_id, ifnull(round(sum(p.price * u.units)/sum(units),2),0) as avarage
from price as p
left join units as u
on p.product_id = u.product_id and u.purchase_date between p.start_date and p.end_date
group by p.product_id;

select p.product_id ,ifnull(round(sum(p.price * u.units)/sum(units),2),0) as avarage
from price as p
left join units as u
on p.product_id = u.product_id
where u.purchase_date >= p.start_date and u.purchase_date <= p.end_date
group by p.product_id

