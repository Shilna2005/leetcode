with salary as(
select  'Low Salary' as category , count(*) as accounts_count
from Accounts 
WHERE income < 20000

UNION

SELECT 'Average Salary' as category , count(*) as accounts_count
from Accounts
WHERE income >=20000 and income <=50000

UNION

SELECT 'High Salary' as category , count(*) as accounts_count
from accounts
where income > 50000
) 

select * from salary order by accounts_count desc;
