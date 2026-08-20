###########################################################################################################
------------------------------ HR ATTRITION PERFORMANCE ---------------------------------------------------
###########################################################################################################

create database HR_attrition;

use HR_attrition;

CREATE TABLE temp (
    Employee_ID VARCHAR(20),
    Age INT,
    Gender VARCHAR(10),
    Department VARCHAR(50),
    Job_Role VARCHAR(100),
    Salary DECIMAL(10,2),
    Years_At_Company INT,
    Performance_Rating INT,
    Job_Satisfaction INT,
    Work_Life_Balance INT,
    Overtime VARCHAR(10),
    Attendance_Pct DECIMAL(5,2),
    Absence_Days INT,
    Attrition VARCHAR(10),
    Exit_Reason VARCHAR(100)
);


SELECT * FROM TEMP;

select  distinct count(*) from temp;
-- ----------------------------------------------------------------------------------------------------
CREATE TABLE Employees (
    Employee_ID VARCHAR(20) PRIMARY KEY,
    Age INT,
    Gender VARCHAR(20),
    Department VARCHAR(50),
    Job_Role VARCHAR(100),
    Salary DECIMAL(10,2),
    Years_At_Company INT
);
INSERT INTO Employees (
    Employee_ID,
    Age,
    Gender,
    Department,
    Job_Role,
    Salary,
    Years_At_Company
)
SELECT
    Employee_ID,
    Age,
    Gender,
    Department,
    Job_Role,
    Salary,
    Years_At_Company
FROM temp;

select * from employees;
-- ----------------------------------------------------------------------------------------------------

CREATE TABLE Performance (
    Performance_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID VARCHAR(20),
    Performance_Rating INT,
    Job_Satisfaction INT,
    Work_Life_Balance INT,
    Overtime VARCHAR(10),
    Attendance_Pct DECIMAL(6,2),
    Absence_Days INT,

    FOREIGN KEY (Employee_ID)
        REFERENCES Employees(Employee_ID)
);

INSERT INTO Performance (
    Employee_ID,
    Performance_Rating,
    Job_Satisfaction,
    Work_Life_Balance,
    Overtime,
    Attendance_Pct,
    Absence_Days
)
SELECT
    Employee_ID,
    Performance_Rating,
    Job_Satisfaction,
    Work_Life_Balance,
    Overtime,
    Attendance_Pct,
    Absence_Days
FROM temp;

select * from performance;
-- ----------------------------------------------------------------------------------------------------

CREATE TABLE Attrition (
    Attrition_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID VARCHAR(20),
    Attrition VARCHAR(10),
    Exit_Reason VARCHAR(100),

    FOREIGN KEY (Employee_ID)
        REFERENCES Employees(Employee_ID)
);
INSERT INTO Attrition (
    Employee_ID,
    Attrition,
    Exit_Reason
)
SELECT
    Employee_ID,
    Attrition,
    Exit_Reason
FROM temp;


select * from attrition;
-- ----------------------------------------------------------------------------------------------------

use hr_attrition;

-- ----------------------------------------------------------------------------------------------------
-- 1. How many employees are there?
-- ----------------------------------------------------------------------------------------------------

select  count(*)  as total_employee 
	from employees;

-- ----------------------------------------------------------------------------------------------------
-- 2.What is the average salary by department?
-- ----------------------------------------------------------------------------------------------------

select Department,
	avg(salary)
    from Employees 
	group by  Department 
    order by avg(salary) desc;

-- ----------------------------------------------------------------------------------------------------
-- 3.What is the average performance rating by department?
-- ----------------------------------------------------------------------------------------------------
select Department,
	avg(performance_Rating) as avg_performance_rating
    from performance as Dep
    join employees e
    on Dep.employee_id = e.employee_id
	group by  Department 
    order by avg(performance_Rating) desc;
    
 -- ----------------------------------------------------------------------------------------------------   
 -- 4.Which job roles have the highest average performance?
 -- ----------------------------------------------------------------------------------------------------
 select e.job_role,
 avg(p.performance_rating)  as avg_performance
 from employees e
 join performance p
 on e.employee_id = p.employee_id
 group by e.job_role
 order by  avg_performance desc;
 
 - ----------------------------------------------------------------------------------------------------
 -- 5.What is the overall attrition rate?
 -- ----------------------------------------------------------------------------------------------------
SELECT
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) 
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM Attrition;
    
 -- ----------------------------------------------------------------------------------------------------   
 -- 6. Which departments have the highest attrition rate? 
 -- ----------------------------------------------------------------------------------------------------
 select e.department,
	count(*) as total_employees,
	round(sum(case when a.attrition = "yes" then 1 else 0 end) * 100 / count(*),2) as attrition_rate
    from employees e
    join attrition a
        on e.employee_id = a.employee_id
    group by e.department 
    order by attrition_rate desc;

-- ----------------------------------------------------------------------------------------------------
 -- 7.Does overtime affect attrition?
-- ----------------------------------------------------------------------------------------------------
 SELECT
    p.Overtime,
    a.Attrition,
    COUNT(*) AS Employee_Count
FROM Performance p
JOIN Attrition a
    ON p.Employee_ID = a.Employee_ID
GROUP BY p.Overtime, a.Attrition
ORDER BY p.Overtime, a.Attrition;
 
 -- ----------------------------------------------------------------------------------------------------
 -- 8.What is the average job satisfaction of employees who left vs stayed?
 -- ----------------------------------------------------------------------------------------------------
 SELECT
    a.Attrition,
    ROUND(AVG(p.Job_Satisfaction), 2) AS Avg_Job_Satisfaction
FROM Performance p
JOIN Attrition a
    ON p.Employee_ID = a.Employee_ID
GROUP BY a.Attrition;

-- ----------------------------------------------------------------------------------------------------
-- 9.What are the main reasons employees leave?
-- ----------------------------------------------------------------------------------------------------
select exit_reason,
	count(*) as employee_count
    from attrition
    where attrition = "yes"
and trim(exit_reason) <> ""
group by exit_reason
order by employee_count asc;
 
 -- ----------------------------------------------------------------------------------------------------
-- 10.How do attendance and performance compare between employees who left and stayed?
-- ----------------------------------------------------------------------------------------------------
SELECT
    a.Attrition,
    ROUND(AVG(p.Attendance_Pct), 2) AS Avg_Attendance,
    ROUND(AVG(p.Performance_Rating), 2) AS Avg_Performance
FROM Performance p
JOIN Attrition a
    ON p.Employee_ID = a.Employee_ID
GROUP BY a.Attrition;
-- ----------------------------------------------------------------------------------------------------

 
 
 
 
    
 
 
 
 
