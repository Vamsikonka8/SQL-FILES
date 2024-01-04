CREATE TABLE JOB (
 JOB_ID  VARCHAR(25),
  JOB_TITLE VARCHAR(50),
   MIN_SALARY INT,
    MAX_SALARY int
    );
    
    drop table job;


INSERT INTO JOB Value
( 'AD_PRES ',   'President ',                        20000  , 40000),
 ( 'AD_PRES ',   'President ' ,                        20000   ,    40000 ),
('AD_VP '     ,'Administration Vice President '  ,   15000 ,      30000 ),
(' AD_ASST'    ,' Administration Assistant' ,               3000 ,      6000 ),
( 'FI_MGR'     ,' Finance Manager ',                      8200 ,    16000 ),
( 'FI_ACCOUNT ',' Accountant'                      ,       4200 ,       9000 ),
( 'AC_MGR '  ,'Accounting Manager '             ,      8200 ,     16000 ),
( 'AC_ACCOUNT' ,' Public Accountant '              ,      4200 ,      9000 ),
( 'SA_MAN'    , ' Sales Manager  '                 ,      10000 ,      20000 );

-- -------------------------------------------------------------------------------------------------------------------------------------
insert into vamsi value
(         100  ,'Steven '    ,  'King '      , ' SKING ' ,   515.123.4567       , '1987-06-17' , ' AD_PRES '   , 24000.00 ,          0.00 ,         0 ,   		  90),
(         101 ,'Neena ',      ' Kochhar',     'NKOCHHAR ', 515.123.4568       | 1987-06-18 | AD_VP      | 17000.00 |           0.00 |        100 |            90 |
|         102 | Lex         | De Haan     | LDEHAAN  | 515.123.4569       | 1987-06-19 | AD_VP      | 17000.00 |           0.00 |        100 |            90 |
|         103 | Alexander   | Hunold      | AHUNOLD  | 590.423.4567       | 1987-06-20 | IT_PROG    |  9000.00 |           0.00 |        102 |            60 |
|         104 | Bruce       | Ernst       | BERNST   | 590.423.4568       | 1987-06-21 | IT_PROG    |  6000.00 |           0.00 |        103 |            60 |
|         105 | David       | Austin      | DAUSTIN  | 590.423.4569       | 1987-06-22 | IT_PROG    |  4800.00 |           0.00 |        103 |            60 |
|         106 | Valli       | Pataballa   | VPATABAL | 590.423.4560       | 1987-06-23 | IT_PROG    |  4800.00 |           0.00 |        103 |            60 |
|         107 | Diana       | Lorentz     | DLORENTZ | 590.423.5567       | 1987-06-24 | IT_PROG    |  4200.00 |           0.00 |        103 |            60 |
|         108 | Nancy       | Greenberg   | NGREENBE | 515.124.4569       | 1987-06-25 | FI_MGR     | 12000.00 |           0.00 |        101 |           100 |
|         109 | Daniel      | Faviet      | DFAVIET  | 515.124.4169       | 1987-06-26 | FI_ACCOUNT |  9000.00 |           0.00 |        108 |           100 |
|         110 | John        | Chen        | JCHEN    | 515.124.4269       | 1987-06-27 | FI_ACCOUNT |  8200.00 |           0.00 |        108 