-- CLEAN DATA
CREATE OR REPLACE TABLE cyclistic.trips_clean AS
SELECT
    ride_id,
    rideable_type,
    member_casual,
    started_at,
    ended_at,
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes,
    DATE(started_at) AS ride_date,
    FORMAT_DATE('%A', DATE(started_at)) AS day_of_week,
    EXTRACT(HOUR FROM started_at) AS hour,
    FORMAT_DATE('%B', DATE(started_at)) AS month,
    EXTRACT(MONTH FROM started_at) AS month_num,
    CASE
        WHEN EXTRACT(DAYOFWEEK FROM started_at) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type
FROM cyclistic.trips_raw
WHERE started_at IS NOT NULL
AND ended_at IS NOT NULL
AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) BETWEEN 1 AND 1440;

-- HOURLY USAGE
SELECT
    member_casual,
    hour,
    COUNT(*) AS rides
FROM cyclistic.trips_clean
GROUP BY member_casual, hour
ORDER BY member_casual, hour;


-- MONTHLY USAGE
SELECT
    member_casual,
    month,
    COUNT(*) AS rides
FROM cyclistic.trips_clean
GROUP BY member_casual, month
ORDER BY rides DESC;

-- WEEKDAY VS WEEKEND
SELECT
    member_casual,
    day_type,
    COUNT(*) AS rides
FROM cyclistic.trips_clean
GROUP BY member_casual, day_type
ORDER BY member_casual;
