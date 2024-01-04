
USE sample_db;

CREATE TABLE COMPANY (

Company_code varchar(20),

founder varchar(20) );

INSERT INTO COMPANY VALUES 
( "C1" , "MONIKA"),
("C2" , "SAMANTHA");

CREATE TABLE LEAD_MANAGER (

Lead_manager_code varchar(20),

Company_code varchar(20) );

INSERT INTO LEAD_MANAGER VALUES
("LM1" , "C1"),
("LM2" , "C2");

CREATE TABLE SENIOR_MANAGER (

Senior_manager_code varchar(20),

Lead_manager_code varchar(20),

Company_code varchar(20) );

INSERT INTO SENIOR_MANAGER VALUES
("SM1","LM1" , "C1"),
("SM2","LM1" , "C1"),
( "SM3","LM2" , "C2");


CREATE TABLE MANAGER (

Manager_code varchar(20),

Senior_manager_code varchar(20),

Lead_manager_code varchar(20),

Company_code varchar(20) );


INSERT INTO MANAGER VALUES
("M1","SM1","LM1" , "C1"),
("M2","SM3","LM2" , "C2"),
( "M3","SM3","LM2" , "C2");


CREATE TABLE EMPLOYEE (
Employee_code varchar(20),

Manager_code varchar(20),

Senior_manager_code varchar(20),

Lead_manager_code varchar(20),

Company_code varchar(20) );


INSERT INTO EMPLOYEE VALUES
("E1","M1","SM1","LM1" , "C1"),
("E2","M1","SM1","LM1" , "C1"),
("E3","M2","SM3","LM2" , "C2"),
("E4", "M3","SM3","LM2" , "C2");


-- solution 
SELECT * FROM COMPANY;
SELECT * FROM LEAD_MANAGER;
SELECT * FROM SENIOR_MANAGER;
SELECT * FROM MANAGER;
SELECT * FROM EMPLOYEE;

SELECT Company_code , founder,
(SELECT COUNT(DISTINCT Lead_manager_code)  FROM LEAD_MANAGER WHERE Company_code = C.Company_code) as Lcnt,
(SELECT COUNT(DISTINCT Senior_manager_code)  FROM SENIOR_MANAGER WHERE Company_code = C.Company_code) as Scnt,
(SELECT COUNT(DISTINCT manager_code)  FROM MANAGER WHERE Company_code = C.Company_code) as Mcnt,
(SELECT COUNT(DISTINCT Employee_code)  FROM Employee WHERE Company_code = C.Company_code) as Ecnt
FROM COMPANY AS C
