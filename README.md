# 📊 Telco Customer Churn Analysis

## End-to-End Data Analytics Project | Python • SQL • Power BI

![Executive Overview](images/executive-overview.png)

---

## 📌 Project Overview

Customer churn is a major challenge for telecommunications companies because losing existing customers can significantly affect recurring revenue and long-term business growth.

This project analyzes telecommunications customer data to identify:

- Overall customer churn rate
- Customer segments with the highest churn
- Churn patterns across contracts and services
- The relationship between tenure and churn
- The relationship between monthly charges and churn
- Payment methods associated with higher churn
- High-value customers who have churned
- High monthly-charge customers who have churned
- Customer segments requiring different retention strategies
- Potential recurring revenue at risk

The project follows an end-to-end data analytics workflow using **Python, SQL, and Power BI**, with each tool serving a different purpose.

---

## 🎯 Business Problem

The telecommunications company wants to understand why customers are leaving and which customer groups should receive the highest priority for retention efforts.

### Main Business Question

> How can the company identify the major drivers of customer churn, determine which customer segments are most at risk, and develop data-driven customer retention strategies?

---

## 🎯 Project Objectives

The analysis aims to:

1. Determine the overall customer churn rate.
2. Understand the characteristics of churned customers.
3. Identify customer segments with high churn rates.
4. Analyze churn across different services.
5. Analyze churn by contract type.
6. Investigate the relationship between tenure and churn.
7. Investigate the relationship between monthly charges and churn.
8. Analyze churn by payment method and paperless billing.
9. Identify high-value customers who have churned.
10. Identify high monthly-charge customers who have churned.
11. Estimate recurring monthly revenue associated with churned customers.
12. Develop actionable recommendations for customer retention.

---

## 🗂️ Dataset

The dataset used in this project is the **Telco Customer Churn** dataset from Kaggle.

**Source:** IBM Telco Customer Churn Dataset

[View Dataset on Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)

The dataset contains approximately **7,043 customers** and **21 columns**.

### Main Data Categories

- Customer demographics
- Tenure
- Phone services
- Internet services
- Additional services
- Contract information
- Payment methods
- Monthly charges
- Total charges
- Customer churn status

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning, exploration and analysis |
| Pandas | Data manipulation and transformation |
| Matplotlib | Data visualization |
| Seaborn | Exploratory data visualization |
| MySQL | SQL analysis and business queries |
| Power BI | Interactive dashboard and business reporting |
| DAX | Power BI calculations and measures |
| Power Query | Data transformation |
| GitHub | Project documentation and portfolio |

---

## 🔄 Project Workflow

```text
Kaggle Dataset
      ↓
Raw CSV Data
      ↓
Python / Pandas
      ↓
Data Cleaning & EDA
      ↓
Cleaned Dataset
      ↓
MySQL
      ↓
SQL Business Analysis
      ↓
Power BI
      ↓
DAX Measures & Data Modeling
      ↓
Interactive Dashboard
      ↓
Business Insights
      ↓
Retention Recommendations
1. Python — Data Cleaning & Exploratory Data Analysis

Python was used to clean, validate and explore the dataset before performing the SQL and Power BI analysis.

Data Cleaning

The following data-quality checks and transformations were performed:

Inspected the dataset structure
Checked column data types
Checked for missing values
Checked for duplicate records
Validated the customerID field
Converted TotalCharges to a numeric data type
Investigated invalid or missing values
Reviewed categorical variables
Created analytical customer segments
Example: Converting Total Charges
df["TotalCharges"] = pd.to_numeric(
    df["TotalCharges"],
    errors="coerce"
)
Python Exploratory Data Analysis

The exploratory analysis focused on understanding customer behavior and identifying potential churn drivers.

Overall Churn
What is the overall churn rate?
How many customers have churned?
How many customers have been retained?
Customer Characteristics
What is the distribution of customer tenure?
What is the distribution of monthly charges?
How does churn vary by gender?
How does churn vary by senior citizen status?
How does churn vary by partner and dependent status?
Services
How does churn vary across internet services?
How does churn vary across online security?
How does churn vary across online backup?
How does churn vary across device protection?
How does churn vary across technical support?
How does churn vary across streaming services?
How does churn vary across phone services?
Customer Accounts
How does contract type affect churn?
Does tenure relate to churn?
Does monthly spending relate to churn?
Does payment method relate to churn?
Does paperless billing relate to churn?
2. SQL — Business Analysis

The cleaned dataset was loaded into MySQL for structured business analysis.

The SQL analysis was designed around business questions rather than simply querying the data.

Overall Customer Churn
SELECT 
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS churned_customers,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM `telco-customer-churn`;
Overall Metrics
Metric	Value
Total Customers	7,043
Churned Customers	1,869
Retained Customers	5,174
Churn Rate	26.54%
Retention Rate	73.46%
3. Power BI — Customer Churn Dashboard

The Power BI dashboard consists of three analytical pages:

Executive Overview
Customer Churn Drivers
Customer Retention & Revenue Risk
Executive Overview

Focus

The Executive Overview provides a high-level summary of customer churn and overall customer performance.

Key KPIs
Total Customers
Churned Customers
Retained Customers
Churn Rate
Retention Rate
Average Monthly Charges
Average Tenure
Customer Churn Drivers

Focus

This page investigates the characteristics and services associated with customer churn.

Areas Analyzed
Churn by contract
Churn by tenure
Churn by monthly charges
Churn by internet service
Churn by payment method
Churn by paperless billing
Churn across customer services
Customer demographics
Key Business Question

What characteristics and services are associated with higher customer churn?

Customer Retention & Revenue Risk

Focus

This page moves beyond identifying churn and focuses on which customers should receive retention priority.

High-Value Churned Customers

Customers are classified based on their customer value and churn status.

The highest-priority segment is:

High Value
    +
Churn = Yes
    ↓
CRITICAL
High Monthly Charges + Churn

The analysis also identifies customers with:

High Monthly Charges
        +
Churn = Yes

These customers are important because they represent potential recurring revenue risk.

⚠️ Customer Risk Segmentation
Customer Segment	Churn Status	Priority
High Value	Churned	🔴 Critical
High Value	Retained	🟠 Protect
Low Value	Churned	🟡 Monitor
Low Value	Retained	🟢 Maintain
Risk Definitions

🔴 Critical

High-value customers who have already churned.

🟠 Protect

High-value customers who are still retained.

🟡 Monitor

Lower-value customers who have churned.

🟢 Maintain

Lower-value customers who remain active.

🧮 Power BI DAX
Churned Customers
Churned Customers =
CALCULATE(
    COUNT('Telco-Customer-Churn'[customerID]),
    'Telco-Customer-Churn'[Churn] = "Yes"
)
Churn Rate
Churn Rate =
DIVIDE(
    CALCULATE(
        COUNTROWS('Telco-Customer-Churn'),
        'Telco-Customer-Churn'[Churn] = "Yes"
    ),
    COUNTROWS('Telco-Customer-Churn')
)

The measure is formatted as a percentage in Power BI.

0.2654 → 26.54%
Risk Segment
Risk Segment =
SWITCH(
    TRUE(),

    'Telco-Customer-Churn'[Customer Value] = "High Value"
        && 'Telco-Customer-Churn'[Churn] = "Yes",
        "Critical",

    'Telco-Customer-Churn'[Customer Value] = "High Value"
        && 'Telco-Customer-Churn'[Churn] = "No",
        "Protect",

    'Telco-Customer-Churn'[Customer Value] = "Low Value"
        && 'Telco-Customer-Churn'[Churn] = "Yes",
        "Monitor",

    'Telco-Customer-Churn'[Customer Value] = "Low Value"
        && 'Telco-Customer-Churn'[Churn] = "No",
        "Maintain",

    "Other"
)
💡 Key Business Insights
1. Overall Churn

Approximately 26.54% of customers have churned, meaning more than one-quarter of the customer base has left.

2. Contract Type

Month-to-month customers demonstrate substantially higher churn than customers on longer-term contracts.

3. Internet Service

Fiber optic customers show a relatively high observed churn rate compared with other internet service categories.

4. Customer Tenure

Newer customers represent a greater retention risk than customers who have been with the company for longer periods.

5. Additional Services

Customers without services such as online security and technical support show higher observed churn rates than customers subscribed to those services.

6. Monthly Charges

Customers with higher monthly charges represent an important churn-risk segment because losing these customers can affect recurring revenue.

7. High-Value Customers

High-value customers who have churned should receive special attention because they represent historically valuable customers.

💼 Business Recommendations
1. Target Month-to-Month Customers

Develop incentives encouraging month-to-month customers to move to longer-term contracts.

Potential strategies:

Contract upgrade incentives
Loyalty discounts
Longer-term plan benefits
Personalized retention offers
2. Focus on New Customers

Customers in their early months with the company should receive additional attention.

Possible strategies:

New-customer onboarding
Early satisfaction surveys
Dedicated technical support
First-year loyalty incentives
3. Investigate Fiber Optic Churn

Investigate:

Pricing
Service quality
Connection reliability
Customer support
Competitor pricing
Contract structure

The company should avoid assuming that fiber optic service itself causes churn.

4. Promote Retention-Oriented Services

Investigate whether services such as:

Online Security
Online Backup
Device Protection
Technical Support

can improve customer retention.

5. Protect High-Value Customers

Prioritize high-value retained customers through:

Loyalty programs
Personalized offers
Dedicated customer support
Contract incentives
Early identification of dissatisfaction
6. Prioritize Revenue at Risk

Retention efforts should consider both:

Probability of churn + Customer value

A high-value customer who churns can have a greater financial impact than a low-value customer.

⚠️ Limitations

This analysis identifies relationships and patterns, but it does not prove causation.

For example:

Higher monthly charges are associated with higher churn.

This does not necessarily mean:

Higher monthly charges cause customers to churn.

Other variables such as contract type, tenure, internet service, demographics and support services may influence the relationship.

Additionally:

TotalCharges represents historical accumulated charges.
MonthlyCharges is a more appropriate proxy for recurring monthly revenue when discussing revenue at risk.
📁 Project Structure
Telco-Customer-Churn/
│
├── data/
│   ├── raw/
│   │   └── Telco-Customer-Churn.csv
│   │
│   └── cleaned/
│       └── Telco-Customer-Churn-Cleaned.csv
│
├── python/
│   └── telco_churn_eda.ipynb
│
├── sql/
│   ├── 01_overall_churn.sql
│   ├── 02_customer_segmentation.sql
│   ├── 03_service_churn_analysis.sql
│   └── 04_revenue_risk_analysis.sql
│
├── powerbi/
│   └── Telco_Customer_Churn.pbix
│
├── images/
│   ├── executive-overview.png
│   ├── customer-churn-drivers.png
│   └── retention-revenue-risk.png
│
└── README.md
🚀 How to Reproduce the Analysis
Step 1 — Download the Dataset

Download the dataset from Kaggle:

Telco Customer Churn Dataset

Step 2 — Python

Open:

python/telco_churn_eda.ipynb

Run the data-cleaning and exploratory analysis workflow.

Step 3 — Export Clean Data

Save the cleaned dataset as:

Telco-Customer-Churn-Cleaned.csv
Step 4 — MySQL

Import the cleaned dataset into MySQL and execute the SQL scripts located in:

sql/
Step 5 — Power BI

Open:

powerbi/Telco_Customer_Churn.pbix

The dashboard contains:

Executive Overview
Customer Churn Drivers
Customer Retention & Revenue Risk
🧠 Skills Demonstrated
Python
  Pandas
  Data cleaning
  Data validation
  Feature engineering
  Exploratory Data Analysis
  GroupBy analysis
  Churn-rate calculations
  Data visualization
SQL
  SELECT statements
  WHERE filtering
  GROUP BY
  CASE statements
  Aggregate functions
  COUNT
  SUM
  ROUND
  UNION ALL
  Customer segmentation
  Business-oriented analysis
Power BI
  Power Query
  Data transformation
  Conditional columns
  Data modeling
  DAX
  Calculated columns
  Measures
  KPI cards
  Matrix visuals
  Conditional formatting
  Interactive dashboards
  Business storytelling
  Business Analytics
  Customer segmentation
  Churn analysis
  Retention analysis
  Revenue-risk analysis
  Customer value analysis
  Data-driven recommendations
🎯 Final Takeaway

This project demonstrates an end-to-end approach to solving a real-world business problem with data.

The analysis combines:

Python
  ↓
Clean & Understand the Data
  ↓
SQL
  ↓
Answer Business Questions
  ↓
Power BI
  ↓
Communicate Insights
  ↓
Business Recommendations
  ↓
Support Better Retention Decisions

The ultimate goal is not simply to identify how many customers churned, but to understand:

Who is churning, what characteristics are associated with churn, which customers are most valuable, and where the business should focus its retention efforts.

👤 Author

Ryan Gisa Mwaliko

Data Analyst | Python | SQL | Power BI | Excel

📜 Dataset Attribution

Telco Customer Churn Dataset

IBM / Kaggle

View Dataset on Kaggle
