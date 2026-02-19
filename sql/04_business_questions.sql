-- 04_business_questions.sql
-- Purpose: Answer business behaviour questions

-- Commuting pattern detection
SELECT
    member_casual,
    hour,
    COUNT(*) AS rides
FROM cyclistic.featured_trips
WHERE hour BETWEEN 6 AND 10 OR hour BETWEEN 16 AND 19
GROUP BY member_casual, hour
ORDER BY hour;

-- Seasonal usage
SELECT
    member_casual,
    month,
    COUNT(*) AS rides
FROM cyclistic.featured_trips
GROUP BY member_casual, month
ORDER BY month;
