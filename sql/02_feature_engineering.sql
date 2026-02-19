-- 02_feature_engineering.sql
-- Purpose: Build derived analytical features from timestamps

CREATE OR REPLACE TABLE cyclistic.featured_trips AS
SELECT
  *,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes,
  DATE(started_at) AS ride_date,
  EXTRACT(DAYOFWEEK FROM started_at) AS day_num,
  FORMAT_DATE('%A', DATE(started_at)) AS day_of_week,
  EXTRACT(HOUR FROM started_at) AS hour,
  EXTRACT(MONTH FROM started_at) AS month_num,
  FORMAT_DATE('%B', DATE(started_at)) AS month,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM started_at) IN (1,7) THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type,
  CASE
    WHEN EXTRACT(HOUR FROM started_at) BETWEEN 6 AND 9 THEN 'Morning commute'
    WHEN EXTRACT(HOUR FROM started_at) BETWEEN 10 AND 15 THEN 'Midday'
    WHEN EXTRACT(HOUR FROM started_at) BETWEEN 16 AND 19 THEN 'Evening commute'
    ELSE 'Night'
  END AS time_bucket
FROM cyclistic.cleaned_trips;
