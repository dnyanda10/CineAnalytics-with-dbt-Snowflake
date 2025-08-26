-- Fail if duplicate movie_ids exist
select movie_id, count(*) 
from {{ ref('dim_movies') }}
group by movie_id
having count(*) > 1
