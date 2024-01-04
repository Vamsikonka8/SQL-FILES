

use sample_db;

create table project(

project_id  int,
employee_id int);
insert into project values(
 1           ,1           ),
( 1           , 2           ),
(1           , 3           ),
(2           , 1          ),
(2           , 4           );
create table Employee4 (
employee_id int ,
 name   varchar(20),
 experience_years int);
 insert into Employee4 values(
1           ," Khaled " ,3                ),
( 2           ," Ali    ", 2                ),
( 3           ," John   ", 1                ),
( 4           ," Doe    ", 2                );


select * from project;
select * from Employee4;


-- solution

select p.project_id, ifnull(round(sum(e.experience_years )/count(e.employee_id),2),0) as average_years
from project as p
inner join Employee4 as e
on p.employee_id = e.employee_id
group by p.project_id
