use sample_db;
create table queries(
 query_name  varchar(20),
 result            varchar(20),
 position  int ,
 rating int);
 drop table queries;
 insert into queries values(
"Dog"       ,  "Golden Retriever"  , 1        , 5      ),
("Dog"      ,  "German Shepherd"    , 2        , 5      ),
("Dog"        ,  " Mule"              , 200      , 1      ),
("Cat"       ,  " Shirazi"           , 5        , 2      ),
("Cat"      ,  " Siamese "          , 3        , 3      ),
("Cat"       ,  " Sphynx "           , 7        , 4      );


select query_name,count(*)  from queries group by query_name


with cte as (
select *
from queries
group by query_name
)
select query_name 
from cte 
group by query_name;


select
query_name,
round(avg(cast(rating as decimal) / position), 2) as quality,
round(sum(case when rating < 3 then 1 else 0 end) * 100 / count(*), 2) as poor_query_percentage
from
queries
group by
query_name;


select query_name , round(avg(cast(rating as decimal )/ position ),2)as quantity ,
round(sum(case when rating < 3 then 1 else 0 end)*100/ count(* ) ,2)as cc
from queries
group by query_name 

