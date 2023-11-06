WITH
raw_listings AS
(
SELECT
    *
FROM
    AIRBNB.RAW.RAW_LISTINGS
)

SELECT
    id as listing_id,
    listing_url,
    name as listing_name,
    room_type,
    minimum_nights,
    host_id,
    price as price_str,
    created_at,
    updated_at
FROM
    raw_listings