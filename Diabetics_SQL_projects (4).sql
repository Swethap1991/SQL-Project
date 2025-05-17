show databases;
create database diabetics;
use diabetics;
show tables;
select count(*) from diabetics;
select * from diabetics;




-- 1.	Retrieve all records from the dataset. --s1
SELECT * FROM diabetics;

-- 2.	Select only the Glucose and BMI columns.--s2
SELECT Glucose, BMI FROM diabetics;

-- 3.	Find the number of unique values in the Outcome column.--s3
SELECT COUNT(DISTINCT Outcome) as number_of_Outcome FROM diabetics;


-- --4.	Count the total number of patients in the dataset. --h4
select count(*) as total_patience from diabetics;

-- --5.	Find the average Age of patients.--h5
select avg(age) as avg_age from diabetics;

-- --Filtering Data:
-- 6.Retrieve all records where Outcome = 1 (patients with diabetes).--h6
select * from diabetics where Outcome=1;

-- 7.	Retrieve all records where BMI > 30. --n7
select * from diabetics where BMI > 30;

-- 8.	Find all patients who are older than 40 years. --n8
select * from diabetics where Age > 40;

-- 9.	Retrieve all records where BloodPressure is between 60 and 80.--n9
SELECT * FROM diabetics WHERE BloodPressure BETWEEN 60 AND 80;

-- 10.	Find patients with a DiabetesPedigreeFunction greater than 1. --sw10
SELECT * FROM diabetics WHERE DiabetesPedigreeFunction > 1;

-- 11.	Find the average Glucose uplevel for diabetic patients (Outcome = 1).--sw11
SELECT AVG(Glucose) AS AvgGlucose FROM diabetics WHERE Outcome = 1;

-- 12.	Count the number of non-diabetic patients (Outcome = 0).
SELECT COUNT(*) AS NonDiabeticCount FROM diabetics WHERE 'Outcome'=0;

-- 13. Find the maximum Insulin level recorded.--d13
select max(Insulin) as Max_Insulin from diabetics;

-- 14. Get the minimum SkinThickness value for patients with diabetes.--d14
select min(SkinThickness) as Min_SkinThickness from diabetics where   Outcome = 1;

-- 15.  Group the records by Outcome and count how many patients fall into each category.--d15
SELECT Outcome, COUNT(*) AS Patient_Count FROM diabetics GROUP BY Outcome;


-- 16. Find the Glucose level of patients who have the highest BMI using a subquery.
SELECT Glucose FROM diabetics WHERE BMI = (SELECT MAX(BMI) FROM diabetics);

-- 17. Retrieve the top 5 oldest patients with their Glucose levels.
SELECT Age, Glucose FROM diabetics ORDER BY Age DESC LIMIT 5;

-- 18. Identify patients with missing or zero values in the Insulin column.
SELECT * FROM diabetics WHERE Insulin = 0;

-- 19.	Find the average BMI of patients who have an Insulin level greater than 100. --v19
SELECT AVG(BMI) AS Average_BMI FROM diabetics WHERE Insulin > 100;

-- 20.	Retrieve the top 10 highest Glucose values in descending order --v20.
SELECT * FROM diabetics ORDER BY Glucose DESC LIMIT 10;

-- 21.	Find the median Age of all patients. --v21
SELECT AVG(Age) AS Median_Age FROM (SELECT Age FROM diabetics ORDER BY Age LIMIT 2) AS MedianValues;

