use sample_db;

create table accounts (
id int ,

username varchar(24),

email varchar(225)
);

insert into accounts values (
1 , "esoaneo" ,  "alefwich0@nytimes.com"),

(2, "jrafter1" , "bmcniff1@census.gov"),

(3, "rcawston" , "fnickoll2@flickr.com");



Create table items (

id int ,

type varchar(255),

name varchar(255),

weight smallint );

insert into items values(

1, "sheld" , "sheid of Asteracae"  , 3 ),
(2 , "Sword" , "Sword of Cyperaceae" , 3),
(3 , "shield" , "Sheild of Apiaceae" , 3),
(4 , "Sword" , "Sword of Onagracaece" , 3),
(5 , "Sword" , "Sword of Campanulaceae" , 3);



create table acounts_items (

account_id int ,

item_id int );


insert into acounts_items values (

1 , 2 ),
(1, 3) ,
(1 , 3),
(1 , 4),
(1, 4),
(1, 5),
(1 , 5),
(1, 5),
(2, 1),
(2, 1),
(2, 2),
(2, 2),
(2, 2),
(2, 2),
(2, 2),
(2, 3),
(2, 3),
(2, 5),
(3, 3),
(3, 4);

select * from accounts;
select * from items;
select * from acounts_items;


select c.username , c.email , count(ac.account_id) as total, sum(i.weight)as weight
from accounts as c
join items as i on 
c.id = i.id
join acounts_items as ac on
c.id = ac.account_id 
group by  c.username ,c.email
having sum(i.weight) > 20
order by  weight desc

