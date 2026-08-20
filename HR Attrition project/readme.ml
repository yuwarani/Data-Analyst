# 📊 HR Employee Performance & Attrition Analysis

Welcome to my **HR Employee Performance & Attrition Analysis** project.

This project analyzes employee performance and attrition data using **Excel, SQL, and Power BI**. The objective is to understand employee performance, attendance, job satisfaction, salary, and attrition patterns and present the results through an interactive dashboard.

## 🛠️ Tools & Skills

- Microsoft Excel
- Power Query
- MySQL
- SQL
- Power BI
- DAX
- Data Cleaning
- Data Modeling
- Data Visualization
- Dashboard Development
- KPI Analysis

## 📌 Project Workflow

### 1. Data Cleaning – Excel & Power Query

The HR dataset was cleaned and prepared using Excel Power Query.

Cleaning steps included:

- Removed duplicate Employee IDs
- Handled missing values
- Trimmed and cleaned text columns
- Standardized categorical values
- Corrected data types
- Checked salary and age values
- Validated performance ratings
- Validated job satisfaction ratings
- Checked attendance percentage
- Checked absence days
- Standardized Attrition values
- Reviewed missing Exit Reasons

## 🗄️ 2. SQL Database

The cleaned dataset was imported into **MySQL** and organized into three tables:

### Employees
Contains employee demographic and employment information.

### Performance
Contains employee performance, satisfaction, attendance, overtime, and absence information.

### Attrition
Contains employee attrition status and exit reasons.

The tables were connected using **Primary Key and Foreign Key relationships** through `Employee_ID`.

## 🔍 3. SQL Analysis

SQL was used to answer important HR business questions, including:

- Total number of employees
- Average salary by department
- Average performance by department
- Performance by job role
- Overall attrition rate
- Attrition by department
- Overtime vs attrition
- Job satisfaction vs attrition
- Main reasons for employee exits
- Attendance and performance of employees who left vs stayed

SQL concepts used:

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- COUNT
- AVG
- SUM
- CASE WHEN
- JOIN
- ROUND
- Primary Keys
- Foreign Keys

## 📊 4. Power BI Dashboard

The MySQL database was connected to **Power BI using ODBC**.

Relationships were created between:

Employees → Performance

Employees → Attrition

### Key KPIs

- Total Employees
- Average Performance Rating
- Average Salary
- Average Attendance %
- Attrition Rate %

### Dashboard Visuals

- Performance by Department
- Performance by Job Role
- Attrition by Department
- Attrition Status
- Overtime vs Attrition
- Job Satisfaction vs Attrition
- Reasons for Leaving

Interactive slicers were added for fields such as Department, Gender, Job Role, Overtime, and Attrition.

## 📁 Project Structure

HR-Performance-Attrition-Analysis/
│
├── data/
│   └── hr-cleaned-data.csv
│
├── sql/
│   └── hr-analysis.sql
│
├── images/
│   └── hr-dashboard.png
│
├── powerbi/
│   └── HR-Performance-Attrition-Dashboard.pbix
│
└── README.md

## 🎯 Project Objective

The objective of this project is to analyze employee performance and attrition patterns and identify factors associated with employee retention and workforce performance.

The project demonstrates an end-to-end data analytics workflow using:

**Excel → Power Query → MySQL → SQL → Power BI → DAX**

## 📈 Key Skills Demonstrated

- Data Cleaning
- Data Transformation
- SQL Analysis
- Relational Database Design
- Data Modeling
- DAX Measures
- KPI Development
- Data Visualization
- Dashboard Design
- HR Analytics

---

⭐ Thank you for visiting my HR Employee Performance & Attrition Analysis project!