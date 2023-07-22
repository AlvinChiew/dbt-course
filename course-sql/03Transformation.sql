USE DATABASE AIRBNB;
USE SCHEMA RAW;

// renmae & subset cols
WITH raw_listings AS (
    SELECT
        *
    FROM
        AIRBNB.RAW.RAW_LISTINGS
)
SELECT
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM
    raw_listings;
    
SELECT * FROM DEV.SRC_LISTINGS;
SELECT * FROM DEV.DIM_LISTINGS_CLEANSED;
SELECT * FROM DEV.fct_reviews;

// incremental load test
INSERT INTO "AIRBNB"."RAW"."RAW_REVIEWS"
VALUES (3176, CURRENT_TIMESTAMP(), 'Zoltan', 'excellent stay!', 'positive');
SELECT * FROM "AIRBNB"."DEV"."FCT_REVIEWS" WHERE listing_id=3176;

DROP VIEW AIRBNB.DEV.SRC_raw_HOSTS;
DROP VIEW AIRBNB.DEV.SRC_LISTINGS;
DROP VIEW AIRBNB.DEV.SRC_REVIEWS;

SELECT * FROM DEV.SEED_FULL_MOON_DATES;

SELECT TOP 1 * FROM RAW.RAW_REVIEWS ORDER BY DATE DESC;

SELECT current_timestamp(); 

SELECT * FROM AIRBNB.raw.RAW_LISTINGS    WHERE ID=3176;
SELECT * FROM AIRBNB.DEV.SCD_RAW_LISTINGS WHERE ID=3176;
UPDATE AIRBNB.RAW.RAW_LISTINGS SET MINIMUM_NIGHTS=60,
    updated_at='2028-01-01 00:00:00' WHERE ID=3176;
