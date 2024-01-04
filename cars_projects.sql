use cars;
select * from car_data;

-- Read Cars data
select * from car_data;

-- Total Cars: To get a count of total records
select count(*) from car_data;

-- The manager asked the employee how many cars will be available in 2023
Select count(year)
from car_data
where year in (2023);

-- The manager asked the employee how many cars is available in 2020,2021,2022
Select year ,count(year)from car_data where year = 2020; # 74
Select year ,count(year)from car_data where year = 2021; # 7
Select year ,count(year)from car_data where year = 2022; # 7

-- group by ----------
Select year ,count(year)
from car_data
where year in (2020 ,2021 ,2022)
group by year
order by year;

-- Client asked me to print the total of all cars by year. I don't see all the details
SELECT YEAR ,Count(year) FROM car_data GROUP BY YEAR;

-- clients asked to call dealer agent how many diesel cars will there will be in 2020
SELECT Count(*) FROM car_data WHERE YEAR = 2020 AND fuel = 'Diesel';

-- clients asked to call dealer agent how many Petrol cars will there will be in 2020
SELECT year ,fuel ,Count(*) FROM Car_data WHERE YEAR = 2020 AND fuel = 'Petrol';

-- The manager told the employee to give a print all fuel cars (diesel ,petrol , (CNG) ) come by all year
SELECT year ,count(*) From car_data where fuel = 'Diesel' group by year;
SELECT year ,count(*) From car_data where fuel = 'Petrol' group by year;
SELECT year ,count(*) From car_data where fuel = 'CNG' group by year;

-- Manager Said there were more than 100 cars in a given year which year had more than 100 cars;
SELECT year , count(*) From car_data group by year having count(*) > 100;
SELECT year , count(*) From car_data group by year having count(*) < 100;

-- The Manager said to the employee All cars details between 2015 and 2023 we need a complete list
SELECT year, count(*) from car_data where year between 2015 and 2023;

-- The manager said to the employee all cars details between 2015 and 2023 we need a complete list
SELECT * FROM car_data where year between 2015 and 2023;