WITH requests as (
select requester_id as id  from RequestAccepted 
UNION ALL
select accepter_id as id from RequestAccepted 
)
select id , count(id) as num
from requests
group by id
order by num desc
limit 1;

