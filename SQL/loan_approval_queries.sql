SELECT * FROM project1.loan_approval_dataset;

#Total Loan Applications
SELECT COUNT(*) AS total_applications
FROM project1.loan_approval_dataset;

#Loan Approval vs Rejection Count
SELECT loan_status,
COUNT(*) AS total_loans
FROM project1.loan_approval_dataset
GROUP BY loan_status;

#Loan Approval Rate
SELECT 
ROUND(
SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) 
/ COUNT(*) * 100,2
) AS approval_rate_percentage
FROM project1.loan_approval_dataset;

#Average Income by Loan Status
SELECT loan_status,
ROUND(AVG(income_annum),2) AS avg_income
FROM project1.loan_approval_dataset
GROUP BY loan_status;

#Loan Applications by Education
SELECT education,
COUNT(*) AS total_applications
FROM project1.loan_approval_dataset
GROUP BY education
ORDER BY total_applications DESC;

#Average Credit Score by Loan Status
SELECT loan_status,
ROUND(AVG(cibil_score),2) AS avg_credit_score
FROM project1.loan_approval_dataset
GROUP BY loan_status;

#Average Loan Amount by Employment Type
SELECT self_employed,
ROUND(AVG(loan_amount),2) AS avg_loan_amount
FROM project1.loan_approval_dataset
GROUP BY self_employed;

#Loan Amount by Education
SELECT education,
ROUND(AVG(loan_amount),2) AS avg_loan
FROM project1.loan_approval_dataset
GROUP BY education;

#Risk Segmentation
SELECT
CASE
WHEN cibil_score >= 750 THEN 'Low Risk'
WHEN cibil_score BETWEEN 650 AND 749 THEN 'Medium Risk'
ELSE 'High Risk'
END AS risk_category,
COUNT(*) AS total_customers
FROM project1.loan_approval_dataset
GROUP BY risk_category;

#Total Assets Calculation
SELECT loan_id,
(residential_assets_value +
commercial_assets_value +
luxury_assets_value +
bank_asset_value) AS total_assets
FROM project1.loan_approval_dataset;

#Assets vs Loan Approval
SELECT loan_status,
AVG(residential_assets_value +
commercial_assets_value +
luxury_assets_value +
bank_asset_value) AS avg_total_assets
FROM project1.loan_approval_dataset
GROUP BY loan_status;
