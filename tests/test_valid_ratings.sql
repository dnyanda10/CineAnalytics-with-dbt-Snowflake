-- Fail if any ratings are outside 0.5–5 range
select *
from {{ ref('fct_ratings') }}
where rating < 0.5 or rating > 5.0
