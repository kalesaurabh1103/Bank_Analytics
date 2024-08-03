SELECT * FROM bankloan.financial_loan;
use bankloan;

-- Total Application Status 
select count(id) from financial_loan;

-- MTD Loan Applications
select count(id) as MTD_Total_loan_Applications from financial_loan
where month(issue_date)=12 and year(issue_date)=2021;

-- PMTD Loan Applications
select count(id) as PMTD_Total_loan_Applications from financial_loan
where month(issue_date)=11 and year(issue_date)=2021;

-- Total Funded Amount

-- MTD Total Funded Amount
select sum(loan_amount) as MTD_Total_Funded_Amount from financial_loan
where month(issue_date)=12 and year(issue_date)=2021;

-- PMTD Total Funded Amount
select sum(loan_amount) as PMTD_Total_Funded_Amount from financial_loan
where month(issue_date)=11 and year(issue_date)=2021;

-- Total Recieved Amount
select sum(total_payment) as Total_recieved_amount 
from financial_loan;

-- MTD Total Recieved Amount
select sum(total_payment) as MTD_Total_recieved_amount 
from financial_loan
where month(issue_date)=12 and year(issue_date)=2021;


-- PMTD Total Recieved Amount
select sum(total_payment) as PMTD_Total_recieved_amount 
from financial_loan
where month(issue_date)=11 and year(issue_date)=2021;

-- average interest rate
select round(avg(int_rate)*100,2) as Avg_Interest_rate from financial_loan;

-- MTD average interest rate
select round(avg(int_rate)*100,2) as MTD_Avg_Interest_rate from financial_loan
where month(issue_date)=12 and year(issue_date)=2021;

-- PMTD average interest rate
select round(avg(int_rate)*100,2) as PMTD_Avg_Interest_rate from financial_loan
where month(issue_date)=11 and year(issue_date)=2021;

-- Avg debt to income ratio: 
select  round(avg(dti)*100,2) as Avg_debt_to_income_ratio from financial_loan;

-- MTD Avg debt to income ratio: 
select  round(avg(dti)*100,2) as MTD_Avg_debt_to_income_ratio from financial_loan
where month(issue_date)=12 and year(issue_date)=2021;

-- PMTD Avg debt to income ratio: 
select  round(avg(dti)*100,2) as PMTD_Avg_debt_to_income_ratio from financial_loan
where month(issue_date)=11 and year(issue_date)=2021;

-- Good Loan Applications Status
select 
(count(case when loan_status="Fully Paid" or loan_status="Current" then id end)* 100)/
count(id) as Good_loan_Percentage
from financial_loan;

-- Good Loan Applications
select count(id)as good_loan_Applications from financial_loan
where loan_status in ("Fully Paid","Current");

-- Good Loan Funded Amount
select sum(loan_amount)as good_loan_Funded_amount from financial_loan
where loan_status in ("Fully Paid","Current");

-- Good Loan Received Amount
select sum(total_payment)as good_loan_Received_amount from financial_loan
where loan_status in ("Fully Paid","Current");

-- BAD Loan Applications Status
select 
(count(case when loan_status="Charged Off" then id end)* 100)/
count(id) as Bad_loan_Percentage
from financial_loan;


-- BAD Loan Applications
select count(id)as Bad_loan_Applications from financial_loan
where loan_status in ("Charged Off");

-- Bad Loan Funded Amount
select sum(loan_amount)as bad_loan_Funded_amount from financial_loan
where loan_status in ("Charged Off");

-- bad Loan Received Amount
select sum(total_payment)as bad_loan_Received_amount from financial_loan
where loan_status in ("Charged Off");

-- loan Status

select loan_status,
count(id) as Loan_Count,
sum(total_Payment) as Total_Amount_Received,
sum(loan_amount)as Total_Funded_Amount,
avg (int_rate*100) as Interest_Rate,
avg (dti*100) as DTI
from financial_loan
group by loan_status;


------------------------------------------------------------------------------
-- Month trend by issue date
select month(issue_date) as month_number, monthname(issue_date) as month_name,count(id)as Total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment)as total_received_amount
from financial_loan
group by month(issue_date),monthname(issue_date) 
order by month(issue_date);

----------------------------------------------------------------------------

 -- regional analysis by state 
select address_state,
count(id)as Total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment)as total_received_amount
from financial_loan
group by address_state 
order by sum(loan_amount) desc ;

-- Loan Term Analysis
select term,
count(id)as Total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment)as total_received_amount
from financial_loan
group by term
order by term desc ;

-- Employee Length analysis
select emp_length,
count(id)as Total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment)as total_received_amount
from financial_loan
group by emp_length
order by count(id) ;

-- loan Purpose breakdown
select purpose,
count(id)as Total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment)as total_received_amount
from financial_loan
group by  purpose
order by count(id) desc;


select purpose,
count(id)as Total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment)as total_received_amount
from financial_loan
group by  purpose
order by count(id) desc;


-- Home Ownership analysis
select home_ownership,
count(id)as Total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment)as total_received_amount
from financial_loan
where grade="B" and address_State="CA"
group by  home_ownership
order by count(id) desc;


-- Home Ownership analysis
select home_ownership,
count(id)as Total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment)as total_received_amount
from financial_loan
group by  home_ownership
order by count(id) desc;



