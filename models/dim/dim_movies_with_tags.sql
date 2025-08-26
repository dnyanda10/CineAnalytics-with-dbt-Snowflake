{{ config(materialized = 'table') }}

WITH movies AS (
    SELECT * FROM {{ ref("dim_movies") }}
),
tags AS (
    SELECT * FROM {{ ref("src_tags") }}
)

SELECT
    m.movie_id,
    m.movie_title,
    m.genres,
    t.tag AS tag_name
FROM movies m
LEFT JOIN tags t 
    ON m.movie_id = t.movie_id
