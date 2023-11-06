{{
    config(
        materialized = "incremental",
    )
}}

with src_reviews AS (
    SELECT
        *
    FROM
        {{ ref("src_reviews") }}
)

SELECT 
    * 
FROM 
    src_reviews
WHERE
    review_comments is not null
{% if is_incremental() %}
  and review_date > (select max(review_date) from {{ this }})
{% endif %}