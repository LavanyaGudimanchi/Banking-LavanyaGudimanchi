use  banking;

-- 1. For each product, show the product name "Product" and the product type name "Type".

select p.NAME as "Product", pt.PRODUCT_TYPE_CD as "Type"
from product p 
join product_type pt on p.PRODUCT_TYPE_CD = pt.PRODUCT_TYPE_CD;


-- 2. For each branch, list the branch name and city, plus the last name and title of each employee who works in that branch.


select b.NAME,b.CITY ,e.LAST_NAME, e.TITLE
from branch b 
join employee e 
on b.BRANCH_ID =e.ASSIGNED_BRANCH_ID ;

-- 3. Show a list of each unique employee title.

select distinct title 
from employee; 

-- 4. Show the last name and title of each employee, along with the last name and title of that employee's boss.

select e.LAST_NAME ,e.TITLE, e2.LAST_NAME ,e2.TITLE
from employee e 
join employee e2
on  e.SUPERIOR_EMP_ID = e2.EMP_ID ;

-- 5. For each account, show the name of the account's product, the available balance, and the customer's last name.

select p.NAME,a.AVAIL_BALANCE,i.LAST_NAME 
from account a 
join product p 
on a.PRODUCT_CD =p.PRODUCT_CD
join individual i 
on a.CUST_ID = i.CUST_ID;

-- 6. List all account transaction details for individual customers whose last name starts with 'T'.

select at2.TXN_ID, at2.AMOUNT, at2.FUNDS_AVAIL_DATE, at2.TXN_DATE,at2.EXECUTION_BRANCH_ID,i.LAST_NAME 
from account a 
join individual i 
on a.CUST_ID =i.CUST_ID
join acc_transaction at2 
on a.ACCOUNT_ID =at2.ACCOUNT_ID
where i.LAST_NAME like "T%";


