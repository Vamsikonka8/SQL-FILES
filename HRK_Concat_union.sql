use sample_db;

create table occupation (
Name varchar(200),
occupation Varchar(200) );


insert into occupation values (
"Samantha" , "Doctor"  ),
("Julia" ,  "Actor"),
("Maria"  , "Actor");


-- sample output
-- Ashely(P)
-- Christeen(P)
-- Jane(A)
-- Jenny(D)
-- Julia(A)
-- Ketty(P)
-- Maria(A)
-- Meera(S)
-- Priya(S)
-- Samantha(D)
-- There are a total of 2 doctors.
-- There are a total of 2 singers.
-- There are a total of 3 actors.
-- There are a total of 3 professors.

-- 1. Solution 
select concat(Name, concat ( "(" ,left(occupation , 1),")"))
from occupation 
union 
select concat("There are  a total of " ,count(occupation),"  ",lower(occupation), "s.")
from occupation
group by occupation;


-- SELECT concat(NAME,concat("(",concat(substr(occupation,1,1),")"))) 
-- FROM occupation ORDER BY NAME ASC union
-- SELECT concat("There are a total of ", count(OCCUPATION), concat(lower(occupation),"s.") )
-- FROM OCCUPATION GROUP BY OCCUPATION ORDER BY count(OCCUPATION), OCCUPATION ASC