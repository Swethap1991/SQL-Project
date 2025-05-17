create database project;
show databases;
use project;
show tables;
describe ev_dataset;
select * from ev_dataset;
select count(*) from ev_dataset;
-- 🧾 BASIC QUERIES (1–8)
-- 1.	List all unique states in the dataset.
select distinct State from ev_dataset;
-- 2.	Find the total EV sales quantity in India.
  select sum(EV_Sales_quantity) as Total_sales  from ev_dataset;
-- 3.	Show EV sales per year in ascending order.
select year,sum(EV_Sales_quantity) as sales_per_year from ev_dataset group by year order by sales_per_year;
-- 4.	Display the number of vehicle categories sold in 2022.
select vehicle_category,count(*) as count_2022 from ev_dataset where year=2022 group by Vehicle_Category order by count_2022;
-- 5.	Get the distinct vehicle types available.
select distinct Vehicle_Type from ev_dataset order by Vehicle_Type;
-- 6.	List all records where EV sales were zero.
select * from ev_dataset where Ev_Sales_Quantity=0;
-- 7.	Find the first date EVs were recorded in the dataset.
select *from ev_dataset  where EV_Sales_Quantity>0 limit 1;
-- 8.	Which state had the highest EV sales in 2023?
select State,max(EV_Sales_Quantity)as Max_ev_sale from ev_dataset where year=2023 group by State order by Max_ev_sale desc limit 1;
-- 📈 Grouping & Aggregation (9–15)
-- 9.	Total EV sales by each vehicle class.
select Vehicle_Class,sum(EV_Sales_Quantity) as total_sales from ev_dataset group by Vehicle_class order by total_sales desc;
-- 10.	Average EV sales per month in Karnataka.
select Month_Name,avg(EV_Sales_Quantity) as monthlysales from ev_dataset where State="Karnataka" group by Month_Name order by monthlysales;
-- 11.	Year with the lowest total EV sales.
select year,sum(EV_Sales_Quantity) as total_yearly_sales from ev_dataset group by year order by total_yearly_sales limit 1;
-- 12.	Compare total EV sales between 'BUS' and 'AMBULANCE' vehicle classes.
select vehicle_class, sum(ev_sales_quantity) as total_ev_sales from ev_dataset where vehicle_class in ('bus', 'ambulance') 
group by vehicle_class order by total_ev_sales desc;
-- 13.	List vehicle categories that had more than 10,000 EV sales overall.
 select vehicle_category, sum(ev_sales_quantity) as total_sales
from ev_dataset
group by vehicle_category
having sum(ev_sales_quantity) > 10000
order by total_sales desc;
-- 14.	Total EV sales for each month name (Jan to Dec).
select month_name, sum(ev_sales_quantity) as total_ev_sales
from ev_dataset
group by month_name
order by field(month_name, 'jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec');
-- 15.	Which vehicle type had the highest sales in Kerala?
select Vehicle_Type, sum(Ev_Sales_Quantity) as total_sales
from ev_dataset
where state = 'Kerala'
group by Vehicle_Type
order by total_sales desc
limit 1;
-- 🕵️‍♂️ Filtering, Conditions & Sorting (16–20)
-- - 16.Find states with more than 100,000 EV sales in total.-
select State,sum(Ev_sales_Quantity) as total_sales
from ev_dataset group by State
having sum(Ev_Sales_Quantity) > 100000;
-- 17.	Show all records where vehicle type is 'Bus' and sales > 300.
select * from ev_dataset where Vehicle_Type ='Bus'and Ev_Sales_Quantity >300;
-- 18.	Find all EV records from Maharashtra between 2021 and 2023.
select * from ev_dataset where lower(state) = 'Maharashtra'and year between 2021 and 2023;
-- 19.	Top 3 states by EV sales in the year 2022.
select state, sum(Ev_Sales_Quantity) as total_sales from ev_dataset
where year = 2022 group by state order by total_sales desc limit 3;
-- 20.	Show EV sales trends for the 'Others' vehicle category over the years.
select year, sum(Ev_Sales_Quantity) as total_sales from ev_dataset
where Vehicle_Category= 'others' group by year order by year;
-- 🔍 Analytical / Advanced (21–25)
-- 21 Monthly Sales Trend for the Latest Year
select Month_Name, sum(Ev_Sales_Quantity) as Monthly_Sales
from ev_dataset where Year =(select max(year) from ev_dataset)
group by Month_Name
order by field(Month_Name, 'jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec');
-- 22.Top 10 States by Total EV Sales
select State, sum(Ev_Sales_Quantity) as Total_Sales
from ev_dataset group by state order by Total_Sales desc limit 10;
-- 23. Most Popular EV Vehicle Types
select Vehicle_Type, sum(Ev_Sales_Quantity) as total_sales
from ev_dataset group by Vehicle_Type order by total_sales desc;
