use bank_analytics;
select * from bank_loan;

# Total funded amount :
select Concat(round(sum(Funded_amount)/1000000,2)," M") as Total_funded_Amount from bank_loan;
 
# Total number of loans :

select concat(round((count(funded_amount)/1000))," K") AS Total_number_of_loans from bank_loan;

# Total Collection Amount :

select concat(round(sum(total_pymnt)/1000000,2)," M")as 
Total_Collection_amount from bank_loan;

# Total Interest Amount :

select concat(round(sum(total_rrec_int)/1000000,2)," M") as 
Total_Interest_Amount from bank_loan;

# Total Default loans 

select concat(round(count(is_default_loan)/1000,2)," K") as total_default_loans
from bank_loan where is_default_loan = "Y";

# Total Deliquent Client 

select concat(round(count(is_delinquent_loan)/1000,2)," K") as total_default_loans
from bank_loan where is_delinquent_loan = "Y";

# Delinquent Loan Rate 

SELECT concat(round((SUM(CASE WHEN is_delinquent_loan = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)),2)," %")
AS delinquent_loan_rate
FROM bank_loan;

# Default Loan rate 

select concat(round(sum(case when is_default_loan = "Y" Then 1 Else 0 end) * 100 / count(*),2)," %")
as default_loan_rate
from bank_loan;

# Total Non-verified loan 

select concat(round(count(*)/1000, 2)," K") as total_non_verified_loan from bank_loan 
where verification_status = "Not Verified";

# Total verified loan

select concat(round(count(*)/1000, 2)," K") as total_non_verified_loan from bank_loan 
where verification_status = "Verified";

# Branchwise Revenue, Interest, Fees 

select branch_name, Total_pymnt, total_rrec_int, total_fees
from bank_loan
order by 2 desc;

# Loan Maturity Period 

select term as Loan_Maturity, concat(round(count(*)/1000,2)," K") as Number_of_Loans from bank_loan
group by 1;

# Loan Disbursment trend 

select year(disbursement_date) As YEAR, concat(round(count(*)/1000,2)," K") As Number_of_Loans from bank_loan 
group by 1
order by 1;

# Grade Wise Loan trend 

select grade, count(*) as No_of_Loans from bank_loan
group by 1
order by 1;

# Top 10 State wise Loan

select state_name AS State, count(*) as No_of_Loans from bank_Loan
group by 1
Order by 2 desc
limit 10;

# Religion wise Loan

select religion As Religion , count(*) as No_of_Loans from bank_loan
group by 1
order by 2 desc;

# Top 10 Product Wise loan

select purpose_category, count(*) as No_of_Loans from bank_loan
group by 1
order by 2 desc
limit 10;

# Loan Status wise Loan

select Loan_Status,count(*) as No_of_Loans from bank_loan
group by 1
order by 2 desc;

# Age group wise loan

select age as Age_Group, count(*) as No_of_Loans from bank_Loan
group by 1
order by 2 desc;


