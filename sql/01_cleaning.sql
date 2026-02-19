-- 01_cleaning.sql
-- Purpose: Remove invalid rides and ensure reliable timestamps/durations

CREATE OR REPLACE TABLE cyclistic.cleaned_trips AS
SELECT
  ride_id,
  rideable_type,
  member_casual,
  started_at,
  ended_at,
  start_station_name,
  end_station_name
FROM cyclistic.trips_raw
WHERE
  started_at IS NOT NULL
  AND ended_at IS NOT NULL
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) BETWEEN 1 AND 1440;
