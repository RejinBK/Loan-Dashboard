SELECT * FROM financial_loan;

-- Monthly Trends of Issue Date
SELECT 
	DISTINCT MONTH(issue_date) AS MONTH, COUNT(id),
	SUM(annual_income) AS Annual_Income, 
	AVG(int_rate * 100) AS AVG_INTEREST, 
	SUM(loan_amount) AS Total_Loan_Amount 
    FROM financial_loan GROUP BY MONTH(issue_date) ORDER BY MONTH(issue_date) ASC;

-- Regional Analysis by State
SELECT 
	distinct address_state, 
    COUNT(id) AS Total_Applications,
	SUM(annual_income) AS Annual_Income, 
	AVG(int_rate * 100) AS AVG_INTEREST, 
    SUM(loan_amount) AS Total_Loan_Amount 
from financial_loan GROUP BY address_state;

-- Loan Term Analysis
SELECT 
	term,
    COUNT(id) AS Total_Applications,
	SUM(annual_income) AS Annual_Income, 
	AVG(int_rate * 100) AS AVG_INTEREST, 
	SUM(loan_amount) AS Total_Loan_Amount  from financial_loan
GROUP BY term ORDER BY Annual_Income DESC;

-- Employee Length
SELECT 
	emp_length,
    COUNT(id) AS Total_Applications,
	SUM(annual_income) AS Annual_Income, 
	AVG(int_rate * 100) AS AVG_INTEREST, 
	SUM(loan_amount) AS Total_Loan_Amount  from financial_loan
GROUP BY emp_length ORDER BY Annual_Income DESC;

-- Loan Purpose
SELECT 
	purpose,
    COUNT(id) AS Total_Applications,
	SUM(annual_income) AS Annual_Income, 
	AVG(int_rate * 100) AS AVG_INTEREST, 
	SUM(loan_amount) AS Total_Loan_Amount  from financial_loan
GROUP BY purpose ORDER BY Annual_Income DESC;

-- Home Ownership
SELECT 
	home_ownership,
    COUNT(id) AS Total_Applications,
	SUM(annual_income) AS Annual_Income, 
	AVG(int_rate * 100) AS AVG_INTEREST, 
	SUM(loan_amount) AS Total_Loan_Amount  from financial_loan
GROUP BY home_ownership ORDER BY Annual_Income DESC