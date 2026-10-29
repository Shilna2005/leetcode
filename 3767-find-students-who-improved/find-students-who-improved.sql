with cte as (
    select student_id,subject,
    first_value(score) over(
        partition by student_id,subject
        order by exam_date asc
    ) as first_score,
    first_value(score) over(
        partition by student_id,subject
        order by exam_date desc
    ) as latest_score
    from scores
)
select distinct student_id,subject,first_score,latest_score
from cte
where latest_score > first_score
order by student_id,subject;
