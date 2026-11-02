with cte as (
    select product_id,
    MIN(year) as minyear
    from sales
    group by product_id
)
select s.product_id,s.year as first_year,s.quantity,s.price
from sales s
join cte c
on c.product_id = s.product_id and s.year = c.minyear;