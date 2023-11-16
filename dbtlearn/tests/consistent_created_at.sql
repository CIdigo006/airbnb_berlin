SELECT
    *
FROM
    {{ ref("dim_listings_cleansed") }} as dlc
LEFT JOIN
    {{ ref("fct_reviews") }} as fr
ON
    dlc.listing_id = fr.listing_id
WHERE
    fr.review_date < dlc.created_at