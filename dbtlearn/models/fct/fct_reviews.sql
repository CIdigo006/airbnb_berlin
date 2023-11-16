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
    {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_comments']) }}
AS
    review_id, *
FROM 
    src_reviews
WHERE
    review_comments is not null
{% if is_incremental() %}
  and review_date > (select max(review_date) from {{ this }})
{% endif %}