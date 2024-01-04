
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

SELECT C.company_code , C.founder ,count(distinct L.Lead_manager_code) as Lcnt  , count( S.Lead_manager_code) as Scnt , 
count( M.Senior_manager_code) as Mcnt
FROM COMPANY AS C
INNER JOIN LEAD_MANAGER AS L ON
C.Company_code = L.Company_code
INNER JOIN SENIOR_MANAGER as S ON
L.Lead_manager_code = S.Lead_manager_code
INNER JOIN MANAGER AS M ON
M.Senior_manager_code = M.Senior_manager_code
GROUP BY C.company_code , C.founder
