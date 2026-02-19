-- 02_feature_engineering.sql
-- Purpose: Create analytical features from timestamps

CREATE OR REPLACE TABLE cyclistic.featured_trips AS
SELECT
    *,
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes,
    EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week,
    FORMAT_TIMESTAMP('%A', started_at) AS weekday_name,
    EXTRACT(HOUR FROM started_at) AS hour,
    EXTRACT(MONTH FROM started_at) AS month
FROM cyclistic.cleaned_trips;
