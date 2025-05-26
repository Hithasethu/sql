Use Files;
show tables;
describe international_education;

select * from international_education;


-- --1. Show all columns for the first 5 universities
select * from international_education limit 5;

-- --2. Count Unique Program across all countries
select count(distinct program) from international_education;

-- --3. Count the total number of rows 
select count(University)  from international_education;

-- --4. Get the number of programs per country
select Country,count(*) as Program_count from international_education group by Country;

-- --5. Top 5 most expensive universities (Total Cost)
select distinct University,Country,(Tuition_USD+Living_Cost_Index*100 +Insurance_USD+Rent_USD+Visa_Fee_USD) as Total_cost 
from international_education
order by Total_cost desc
limit 5;



-- --1. Calculate Total Cost for Each Program
select distinct Country,University,Program,Level,(Tuition_USD+(Living_Cost_Index*100)+Rent_USD+Visa_Fee_USD+Insurance_USD) as Total_cost
from international_education 
Order By Total_cost desc;

-- -- Most affordable Universities
select distinct University,Country,(Tuition_USD+Living_Cost_Index*100 +Insurance_USD+Rent_USD+Visa_Fee_USD) as Total_cost 
from international_education
order by Total_cost asc
limit 5;

-- --7.Programs with duration over 2 years
Select  distinct Program from international_education where Duration_years>2;


-- --8. Average tuition by level (e.g., Master, Bachelor)
Select level,Avg(Tuition_USD) as Avg_Tuition_Cost
from international_education 
group by level;

-- --9 Countries with Free Tuition Options
select Country,count(*) as free_programs
from international_education
where Tuition_USD = 0
group by Country
order by free_programs DESC;

-- --10. Cities with Highest Living Costs
select City,Country,avg(Living_Cost_Index) as Avg_Living_Cost
from international_education 
group by City,Country
order by Avg_Living_cost desc
limit 10;


-- --11. Average Annual Cost per Program
Select program, avg((Tuition_USD + Rent_USD + Visa_Fee_USD + Insurance_USD) / Duration_Years) AS Avg_Annual_Cost
from international_education 
group by Program
order by Avg_Annual_Cost desc;

-- --12. Distribution of universities by study level
Select Level,count(University) as Uni_Count 
from international_education
group by Level;

-- --13.Rent vs. Living Cost Index by City
Select Country,City,avg(Rent_USD) as Avg_Rent,avg(Living_Cost_Index*100) as Avg_Living_Cost
from international_education
group by Country,city;

-- --14. Visa and Insurance fees by country
Select Country,avg(Visa_Fee_USD) as Avg_Visa_Fee,avg(Insurance_USD) as Avg_Insurance
from international_education
group by country;
-- --15. Total Cost Comparison: USA UK Australia
select  Country,avg(Tuition_USD+(Living_Cost_Index*100)+Rent_USD+Visa_Fee_USD+Insurance_USD) as Total_cost
from international_education 
where Country in ('USA','UK','Australia')
group by Country;
















