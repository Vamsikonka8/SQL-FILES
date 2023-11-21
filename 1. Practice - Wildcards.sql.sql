
USE sampledb;

CREATE TABLE pattern(
cus_id INT, 
cus_name VARCHAR(30)
);
drop database  sql_2;

INSERT INTO pattern VALUES
(1,'anand'),
(2,'anirudhabc'),
(3,'esther'),
(4,'amy'),
(5,'sana'),
(6,'pawan'),
(7,'fernandes'),
(8,'david'),
(9,'sanam'),
(10,'karan'),
(11,'abcntr'),
(12,'pqrswt'),
(13,'sarth'),
(14,'sneha'),
(15,'matri'),
(16,'hemanth'),
(17,'amarri'),
(18,'prasantha');

select * 
from pattern;

  

update  pattern
set cus_name = 'vamsi'
where cus_name = 'anand';

-- 1.)STARTING WITH 'a'  
	 SELECT cus_name 
	 FROM pattern
     where cus_name like 'a%';
     
     
-- 2.) names ending wth 'a'
	 SELECT cus_name 
	 FROM pattern
     where cus_name like '%a';
    

-- 3.) ALL customers that have 'abc' in any position
	 SELECT cus_name 
	 FROM pattern 
     where cus_name like '%abc%';
     
     
     -- customers that have 'a' 'b' or 'c' in any position
	 SELECT cus_name 
	 FROM pattern 
     where cus_name like '%a%' or '%b%' or '%c%';
     

-- 4.) ALL CUSTOMERS THAT HAVE 's' in second position
	 SELECT cus_name 
	 FROM pattern
     where cus_name like '_s%';
     

-- 5.)ALL CUSTOMERS THAT START WITH 'a'  and ATLEAST 3 CHARACTERS IN LENGTH
	 SELECT cus_name 
	 FROM pattern
     where cus_name like 'a___%';
     
     

-- 6.) ALL CUSTOMERS THAT START WITH 's' and end with 'a'-- IMPORTANT
	 SELECT cus_name 
	 FROM pattern 
     where cus_name like 's%a' ;
     

-- 7.)ALL CUSTOMERS NAME THAT DO NOT START WITH 'a'
	 SELECT cus_name 
	 FROM pattern
     where cus_name not like 'a%';
  

-- 8.) ALL CUSTOMERS WITH FIRST CHARACTER IS A LETTER IN THE RANGE 'a' through 'f'
	 SELECT cus_name 
	 FROM pattern
     where cus_name like '[af]';
     

-- 9.) ALL CUSTOMERS CONTAINING EXACTLY 5 CHARACTERS
	 SELECT cus_name 
	 FROM pattern
     where cus_name like '_____';
    

-- 10.) ALL CUSTOMERS THAT START WITH 'abc' or 'pqr'
	 SELECT cus_name 
	 FROM pattern 
     where cus_name like 'abc%' or cus_name like 'pqr%';
    

-- 11.) ALL CUSTOMER NAMES THAT END WITH 'th' or end with 'ha' or end with 'ri' and are of length 5
	 SELECT cus_name 
	 FROM pattern
     where  cus_name like '___th' or cus_name like '___ha' or cus_name  like '___ri';
    
