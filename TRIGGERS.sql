# Triggers-----------------
# BEFORE INSERT TRIGGERS-------------
CREATE TABLE CUSTOMER1(
CUST_ID INT,AGE INT ,NAME VARCHAR(30


delimiter //
create trigger age_verify
before insert on customer1
for each row
if new.age<0 then set new.age=0;
end if; //
delimiter ;

insert into  customer1 values (110, 27, 'vamsi'),
(111 , -47 , 'john'),
(112 , -45 , ' ganesh'),
(113 , 56 , 'king');

SELECT  * FROM CUSTOMER1;

CREATE TABLE CUSTOMER2(
ID INT auto_increment primary key,
name varchar(40) not null,
email varchar(30) ,
birthdate date
);

create table message(
id int auto_increment,
messageid int,
message varchar (300) not null,
primary key (id , messageid )
)

delimiter //
create trigger
check_null_dob
after insert 
on customer2
for each row
begin 
if new.birthdate is null then 
insert into  message(messageid , message) values(new.id , concat ('HI' ,new.name , ' please update your date of birth.'));
end if;
end //
delimiter \\

insert into customer2( name , email , birthdate)
values ('vamsi' , 'vamsi@ 1233555' , null),
('ronald' , 'konkaaanahfg@453' ,' 2002-11-14'),
('karthik' , ' srikarathik@gmail.com' ,' 2002-11-26'),
('rushi' , 'konkaaanahfg@453' , null);

select * from message



-- before update
create table employees1
( emp_id int primary key ,
emp_name varchar(25) ,
age int,
salary float );

insert into employees1 values
(101 , 'vamsi' , 35 , 80000),
(102 , 'shruthika ' , 46 , 76000),
(103 , 'naveen' , 34 , 76300),
(104 , 'pavani' , 24 , 35000),
(105 , 'pavan' , 34 , 1000000),
(106, 'lokesh' , 25 , 56000),
(107 , 'venkatesh' , 28, 76000),
(108 , 'giri', 23, 1000000);

delimiter //
create trigger upd_trigger
before update
on employees1
for each row
begin
if new.salary = 100000 then set new.salary = 85000;
elseif new.salary < 10000 then set new.salary = 72000;
end if;
end//
delimiter ;
select * from employees1;
update employees1
set salary = 8000;
set sql_safe_updates = 0;


  -- before delete 
  
  create table salary (
  eid int primary key ,
  validfrom date not null,
  amount float not null 
  );
  
  insert into salary (eid , validfrom ,amount)
  values ( 110 , '2023-05-01' , 55000),
  (102 , '2022-05-03', 56000),
  (103 , '2023-05-20' , 76000),
  (104 , '2012-07-23' , 76888),
  (105 , '2023-08-22', 78888);
  
  create table salarydel (id  int primary key auto_increment,
  eid int,
  validfrom date not null,
  amount float not null,
  deletedat timestamp default now()
  );
  
  delimiter $$
  create trigger salary_delete
  before delete 
  on salary
  for each row
  begin
  insert into salarydel(eid , validfrom , amount)
  values (old.eid , old.validfrom , old.amount);
  end$$
  delimiter ;
  
  delete from salary
  where eid = 103;
drop table salary
  select * from salarydel
 
