Use Sample_db;
drop table occupation;

insert into occupation values (
"Samantha" , "Doctor"  ),
("Julia" ,  "Actor"),
("Maria"  , "Actor"),
("Meera" , "Singer"),
("Ashely" , "Professor"),
("Ketty" , "Professor"),
("Christeen" , "Professor"),
("Jane" , "Actor"),
("Jenny" , "Doctor"),
("priya" , "Singer");
-- Sql questions 




-- solutions 
select max(case when occupation = "Doctor" Then Name end) as Doctor,
        max(case when occupation = "Actor" Then Name end) as  Actor,
        max( case when occupation = "Professor" Then Name end) as  Professor,
         max( case when occupation = "Singer" Then Name end) as Singer
from ( select *, row_number() over(partition by occupation order by name)  rn
    from occupation ) as o
group by rn


