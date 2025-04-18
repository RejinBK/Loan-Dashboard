SELECT * FROM financial_loan;

-- Total Loan Applications
SELECT COUNT(id) FROM financial_loan;

-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan;

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Received FROM financial_loan
WHERE MONTH(last_payment_date) = 12 AND YEAR(last_payment_date) = 2021;

-- Average Interest Rate (%)
SELECT AVG(int_rate) * 100 AS Average_Interest_Rate FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- Average Debt to Income Ratio (%)
SELECT AVG(dti) * 100 AS Average_Debt_to_Income FROM financial_loan
WHERE MONTH(issue_date) = 10;

-- Good Loan
SELECT (COUNT( CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
/COUNT(id) AS Good_Loan_Percentage FROM financial_loan;

-- Count of Good Loan
SELECT COUNT(id) AS Fully_Paid_Loan FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Amount FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Total Received Amount
SELECT SUM(total_payment) AS Good_Loan_Amount FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Bad Loan
SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100) / COUNT(id) AS Bad_Loan_Percent FROM financial_loan;

-- Count of Bad Loan
SELECT COUNT(id) AS Fully_Paid_Loan FROM financial_loan
WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Amount FROM financial_loan
WHERE loan_status = 'Charged Off';

-- Loan Status Grid
SELECT loan_status, COUNT(id) AS Total_Loan_Applications, SUM(total_payment) AS Total_Amount_Received,
		AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) As Avg_DTI from financial_loan
        GROUP BY loan_status

