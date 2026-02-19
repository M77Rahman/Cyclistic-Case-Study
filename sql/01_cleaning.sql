-- 01_cleaning.sql
-- Purpose: Prepare raw ride data for reliable analysis

-- Remove invalid rides and bad records
CREATE OR REPLACE TABLE cyclistic.cleaned_trips AS
SELECT *
FROM cyclistic.trips_raw
WHERE
    start_station_name IS NOT NULL
    AND end_station_name IS NOT NULL
    AND ended_at > started_at;
