select person_name 
from (
    select person_name , turn,
    sum(weight) over(order by turn) as cumulative
    from queue
)
where cumulative <= 1000
order by turn desc
limit 1;



