-- 03_aggregation.sql
-- Purpose: Aggregate millions of rows efficiently before export

-- Average ride length by rider type
SELECT
    member_casual,
    AVG(ride_length_minutes) AS avg_ride_minutes
FROM cyclistic.featured_trips
GROUP BY member_casual;

-- Rides by hour
SELECT
    member_casual,
    hour,
    COUNT(*) AS rides
FROM cyclistic.featured_trips
GROUP BY member_casual, hour;
