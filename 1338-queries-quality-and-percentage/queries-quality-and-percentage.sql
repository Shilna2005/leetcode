SELECT query_name,
       ROUND(sum(quality)/count(*),2) as quality,
       ROUND(sum(is_poor) * 100.0/count(*),2) as poor_query_percentage
from (
    select query_name,
           rating::numeric/position as quality,
           case when rating < 3 then 1 else 0 end as is_poor
    from queries
) as t
group by query_name;

