# 🏦 Bank Loan Approval & Risk Analysis

![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Excel](https://img.shields.io/badge/Microsoft%20Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![PowerBI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

---

## 📌 Project Overview

This project analyzes bank loan application data to understand approval patterns, identify risk factors, and segment customers by creditworthiness. The analysis uses **SQL**, **Excel**, and **Power BI** to build an interactive dashboard that supports data-driven lending decisions and risk management strategy.

---

## 🎯 Business Objectives

- Analyze loan approval vs. rejection trends across customer segments
- Identify and classify high-risk vs. low-risk applicants
- Understand the impact of income, education, employment type, and credit score on approval
- Evaluate asset value as a lending risk indicator
- Build an interactive dashboard for real-time loan risk monitoring

---

## 🗂️ Dataset Information

| Column | Description |
|--------|-------------|
| Loan ID | Unique loan application identifier |
| Applicant Income | Monthly income of the applicant |
| Credit Score | Applicant's credit score |
| Employment Type | Salaried / Self-Employed |
| Education | Graduate / Not Graduate |
| Loan Amount | Requested loan amount |
| Loan Term | Duration of the loan |
| Risk Category | High Risk / Medium Risk / Low Risk |
| Asset Value | Total asset value of the applicant |
| Loan Status | Approved / Rejected |

> **Dataset Size:** 4,269 loan applications

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| SQL (MySQL) | Data extraction & analytical queries |
| Microsoft Excel | Data cleaning & preprocessing |
| Power BI | Interactive dashboard & visualization |
| GitHub | Version control & documentation |

---

## 📊 Key KPIs

| Metric | Value |
|--------|-------|
| 📋 Total Applications | 4,269 |
| ✅ Approved Loans | 2,656 |
| ✅ Approval Rate | 62% |
| ❌ Rejection Rate | 38% |
| 📈 Average Credit Score | 600 |
| 🏦 Approved Asset Value | ~75bn |

---

## 🧮 SQL Analysis (MySQL)

**File:** `SQL/loan_analysis_queries.sql`

**Key queries performed:**
- Total applications, approval count, and approval rate
- Loan status breakdown by risk category
- Credit score band segmentation
- Self-employment impact on approval rate
- Education-level approval comparison
- Asset value analysis by loan status
- High-value applicant identification using subqueries
- Window functions for approval ranking

**Example Queries:**

```sql
-- Approval Rate by Risk Category
SELECT risk_category,
       COUNT(*) AS total_applications,
       SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved,
       SUM(CASE WHEN loan_status = 'Rejected' THEN 1 ELSE 0 END) AS rejected,
       ROUND(SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM bank_loans
GROUP BY risk_category
ORDER BY approval_rate DESC;
```

```sql
-- Credit Score Band Analysis
SELECT
  CASE
    WHEN credit_score < 580 THEN 'Poor'
    WHEN credit_score BETWEEN 580 AND 669 THEN 'Average'
    WHEN credit_score BETWEEN 670 AND 739 THEN 'Good'
    ELSE 'Excellent'
  END AS credit_band,
  COUNT(*) AS total_applicants,
  ROUND(AVG(loan_amount), 2) AS avg_loan_amount,
  SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved
FROM bank_loans
GROUP BY credit_band
ORDER BY total_applicants DESC;
```

```sql
-- Self-Employment Impact
SELECT self_employed,
       COUNT(*) AS total,
       ROUND(SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM bank_loans
GROUP BY self_employed;
```

---

## 📈 Dashboard Features (Power BI)

**File:** `Dashboard/Bank_Loan_Approval_Dashboard.pbix`

### ✔ Loan Approval Insights
- Approval vs. Rejection Distribution (Pie Chart)
- Loan Conversion Funnel (Funnel Visual)

### ✔ Risk Analysis
- Loan Status by Risk Category (Stacked Bar)
- Loan Applications by Credit Score Band (Bar Chart)

### ✔ Customer Insights
- Self-Employment Impact on Loan Approval
- Education-Level Approval Percentage (Stacked Bar)

### ✔ Financial Analysis
- Total Asset Value by Loan Status (Bar Chart)

---

## 🔍 Key Insights

1. **62% approval rate reflects a moderate lending strategy** — out of 4,269 applications, 2,656 were approved, showing a balanced but cautious approach to lending
2. **High-risk customers face significantly higher rejection** — the High Risk category shows near-equal or greater rejections than approvals, confirming that risk segmentation actively drives decisions
3. **Credit score is the strongest approval driver** — applicants in the "Poor" band account for the largest volume (~2K) but face the highest rejection rate
4. **Graduates have a marginally higher approval rate** — education acts as a secondary positive signal in creditworthiness evaluation
5. **Self-employed applicants face ~15% higher rejection** — income stability from salaried employment is favored by the lending model
6. **Approved applicants hold significantly higher asset value** — total assets of approved loans (~75bn) far exceed rejected (~45bn), confirming asset value as a key lending criterion

---

## 💡 Business Recommendations

| Recommendation | Supporting Insight |
|----------------|-------------------|
| Introduce tiered interest rates for High Risk segment | Rather than outright rejection, capture this segment with risk-adjusted pricing |
| Build a credit improvement program for Poor score band | Largest applicant volume with lowest approval — a major addressable market |
| Fast-track approvals for Low Risk + Excellent credit | Streamline the process to improve customer experience for best applicants |
| Review self-employment criteria | Self-employed applicants may be creditworthy but lack traditional income proof |
| Leverage asset value more in scoring | Strong predictor — formalize it as a weighted scoring factor |

---

## 📁 Project Structure

```
📁 Bank-Loan-Approval-Analysis
├── 📁 SQL/
│   └── loan_analysis_queries.sql
├── 📁 Dataset/
│   └── bank_loan_data.xlsx
├── 📁 Dashboard/
│   ├── Bank_Loan_Approval_Dashboard.pbix
│   └── Bank_Loan_Approval_dashboard.png
└── README.md
```

---

## 👩‍💻 Author

**Annapurna Gannarapu**
📧 annapurna.gannarapu@gmail.com
🔗 [LinkedIn](https://linkedin.com/in/annapurna-gannarapu) | [GitHub](https://github.com/GannarapuAnnapurna)

---

*This project was completed as part of a self-learning data analytics portfolio by a 2025 Computer Science graduate.*
