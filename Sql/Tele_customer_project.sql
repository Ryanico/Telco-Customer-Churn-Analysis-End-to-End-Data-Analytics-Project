SELECT * 
FROM `telco-customer-churn`;

-- What is the total number of customers?
SELECT DISTINCT COUNT(customerID) AS Customer_no
FROM `telco-customer-churn`;

-- How many customers have churned?
SELECT COUNT(customerID) AS Churned_customers
FROM `telco-customer-churn`
WHERE Churn = "Yes";

-- How many customers have stayed?
SELECT COUNT(customerID) AS Churned_customers
FROM `telco-customer-churn`
WHERE Churn = "No";

-- What is the overall churn rate?
SELECT COUNT(CASE WHEN Churn = "Yes" THEN 1 END) AS Churned_customers, 
(COUNT(CASE WHEN Churn = "Yes" THEN 1 END) / COUNT(customerID) * 100) AS Churn_rate
FROM `telco-customer-churn`
;

-- What is the overall retention rate?
SELECT COUNT(CASE WHEN Churn = "No" THEN 1 END) AS Remaining_customers, 
(COUNT(CASE WHEN Churn = "No" THEN 1 END) / COUNT(customerID) * 100) AS Retention_rate
FROM `telco-customer-churn`
;

-- KPI Table
SELECT 
    'Total Customers' AS Metric,
    COUNT(customerID) AS Value
FROM `telco-customer-churn`

UNION ALL

SELECT 
    'Churned Customers',
    COUNT(customerID)
FROM `telco-customer-churn`
WHERE Churn = 'Yes'

UNION ALL

SELECT 
    'Retained Customers',
    COUNT(customerID)
FROM `telco-customer-churn`
WHERE Churn = 'No'

UNION ALL

SELECT 
    'Churn Rate',
    ROUND(
        COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) 
        / COUNT(customerID) * 100,
        2
    )
FROM `telco-customer-churn`

UNION ALL

SELECT 
    'Retention Rate',
    ROUND(
        COUNT(CASE WHEN Churn = 'No' THEN 1 END) 
        / COUNT(customerID) * 100,
        2
    )
FROM `telco-customer-churn`;

-- What is the churn rate by gender?
SELECT gender,
COUNT(*) AS total_customers,
(COUNT(CASE WHEN Churn = "Yes" THEN 1 END) / COUNT(customerID) * 100) AS Churn_rate
FROM `telco-customer-churn`
GROUP BY gender
;

-- What is the churn rate by senior citizen status?
SELECT SeniorCitizen,
COUNT(*) AS total_customers,
(COUNT(CASE WHEN Churn = "Yes" THEN 1 END) / COUNT(customerID) * 100) AS Churn_rate
FROM `telco-customer-churn`
GROUP BY SeniorCitizen
;

-- What is the churn rate by partner status?
SELECT Partner,
COUNT(*) AS total_customers,
(COUNT(CASE WHEN Churn = "Yes" THEN 1 END) / COUNT(customerID) * 100) AS Churn_rate
FROM `telco-customer-churn`
GROUP BY Partner
;

-- What is the churn rate by dependent status?
SELECT Dependents,
COUNT(*) AS total_customers,
(COUNT(CASE WHEN Churn = "Yes" THEN 1 END) / COUNT(customerID) * 100) AS Churn_rate
FROM `telco-customer-churn`
GROUP BY Dependents
;

-- What is the churn rate for each contract type?
SELECT Contract,
COUNT(*) AS total_customers,
(COUNT(CASE WHEN Churn = "Yes" THEN 1 END) / COUNT(customerID) * 100) AS Churn_rate
FROM `telco-customer-churn`
GROUP BY Contract
;

-- What is the average monthly charge by contract type?
SELECT Contract,
AVG(MonthlyCharges) AS Average_monthly_charges
FROM `telco-customer-churn`
GROUP BY Contract;

-- Which contract type generates the most total charges?
SELECT Contract,
SUM(TotalCharges) AS Total_charges
FROM `telco-customer-churn`
GROUP BY Contract
ORDER BY Total_charges DESC
;

-- Which internet service type has the highest churn?
SELECT InternetService,
(COUNT(CASE WHEN Churn = "Yes" THEN 1 END) / COUNT(customerID) * 100) AS Churn_rate
FROM `telco-customer-churn`
GROUP BY InternetService
ORDER BY Churn_rate DESC
;

-- What percentage of churned customers had no online security?
SELECT OnlineSecurity,
(COUNT(CASE WHEN Churn = "Yes" THEN 1 END) / COUNT(customerID) * 100) AS Churn_rate
FROM `telco-customer-churn`
GROUP BY OnlineSecurity
ORDER BY Churn_rate DESC
;

-- What percentage of churned customers had no tech support?
SELECT TechSupport,
(COUNT(CASE WHEN Churn = "Yes" THEN 1 END) / COUNT(customerID) * 100) AS Churn_rate
FROM `telco-customer-churn`
GROUP BY TechSupport
ORDER BY Churn_rate DESC
;

-- Which customers generate the highest total charges?
SELECT
    customerID,
    TotalCharges
FROM `telco-customer-churn`
ORDER BY TotalCharges DESC
LIMIT 10;

-- What is the average total charge of churned customers?
SELECT Churn,
AVG(TotalCharges) AS Average_total_charges
FROM `telco-customer-churn`
WHERE Churn = 'Yes'
GROUP BY Churn
;

-- What is the average total charge of retained customers?
SELECT Churn,
AVG(TotalCharges) AS Average_total_charges
FROM `telco-customer-churn`
WHERE Churn = 'No'
GROUP BY Churn
;

-- Which customer segments have the highest churn?
-- Customer Segmentations
-- 1. Contract Segments

SELECT 
Contract,
COUNT(*) AS Total_customers,
COUNT(CASE WHEN Churn = "Yes" THEN 1 END) AS Churned_customers,
ROUND(
	COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100 / COUNT(*),
	2
    ) AS Churn_rate
FROM `telco-customer-churn`
GROUP BY Contract
ORDER BY Churn_rate DESC
;
	
-- 2. Segment customers by tenure
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49-72 Months'
    END AS tenure_group,

    COUNT(*) AS total_customers,

    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS churned_customers,

    ROUND(
        COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM `telco-customer-churn`

GROUP BY tenure_group

ORDER BY churn_rate DESC;

-- 3. Combine segments

SELECT
    Contract,

    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49-72 Months'
    END AS tenure_group,

    COUNT(*) AS total_customers,

    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS churned_customers,

    ROUND(
        COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM `telco-customer-churn`
GROUP BY Contract, tenure_group
ORDER BY churn_rate DESC;

-- Monthly Charges Segments
SELECT
    CASE
        WHEN MonthlyCharges < 40 THEN 'Low'
        WHEN MonthlyCharges < 80 THEN 'Medium'
        ELSE 'High'
    END AS charge_segment,

    COUNT(*) AS total_customers,

    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS churned_customers,

    ROUND(
        COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM `telco-customer-churn`
GROUP BY charge_segment
ORDER BY churn_rate DESC;

-- Which high-value customers have churned?
SELECT customerID,
TotalCharges,
Churn
FROM `telco-customer-churn`
WHERE Churn = 'Yes'
ORDER BY TotalCharges DESC
LIMIT 10;














