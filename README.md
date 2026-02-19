# Cyclistic Bike-Share Case Study

Analysed **5.4 million ride records in a cloud data warehouse (Google BigQuery)** using analytical SQL.

Identified commuter vs leisure behavioural segments and designed targeted marketing actions to improve membership conversion and revenue stability.

**Live project:** https://m77rahman.github.io/Cyclistic-Case-Study/  
**Full report (PDF):** report/cyclistic_case_study.pdf  

---

## Business Problem
Cyclistic wants to increase annual memberships by converting casual riders into repeat customers.  
This analysis determines how rider behaviour differs and what operational actions can realistically drive conversion.

---

## Data Environment (Warehouse Approach)
This analysis was performed in **Google BigQuery**, allowing efficient querying of a multi-million row dataset without local processing.

Queries aggregated data inside the warehouse before export to reduce scanning cost and improve performance.

- Platform: Google BigQuery
- Records analysed: 5,400,008 rides (12 months)
- Output: Aggregated behavioural summaries for decision making

---

## Method
- Queried large datasets using Google BigQuery
- Performed data cleaning and transformation using analytical SQL
- Built derived features from timestamp data (ride length, hour, weekday, season)
- Aggregated millions of records efficiently using warehouse functions
- Exported summarised outputs for business interpretation

---

## Query Optimisation
To reduce processing cost and improve performance:

- Selected only required columns
- Filtered invalid rides before aggregation
- Aggregated inside the warehouse before exporting
- Avoided repeated full-table scans using staged tables

---

## Headline Results
- Members: **3,484,202 rides (64.52%)**
- Casual: **1,915,806 rides (35.48%)**
- Avg ride length: Casual **19.41 min** vs Member **11.68 min**

---

## Behaviour Summary

| Behaviour | Members | Casual Riders |
|--------|------|------|
| Time of day | Commute peaks (08:00 & 17:00) | Afternoon usage |
| Seasonality | Stable year-round | Strong summer dependence |
| Week pattern | Weekday dominant | Weekend heavy |
| Trip purpose | Transportation | Leisure |

---

## Key Findings

### Members show commute peaks at 08:00–09:00 and 17:00–18:00
![Members show commute peaks](images/hourly_usage.png)

### Casual riders depend heavily on the summer season
![Casual riders depend on summer](images/monthly_usage.png)

### Weekdays are member-heavy; weekends become more balanced
![Weekdays vs weekends](images/weekday_usage.png)

---

## Business Insight
Cyclistic has two clear customer segments:

**Members (transport users)**
- predictable daily travel
- routine commuting behaviour
- stable year-round usage

**Casual riders (leisure users)**
- seasonal and weather-dependent behaviour
- weekend-focused activity
- recreational usage patterns

---

## Operational Recommendations

1. Summer conversion campaign  
Send push notifications to casual riders between May–August after their second ride offering a limited-time commuter membership trial.

2. Commute positioning  
Between 07:30–09:30 and 16:30–18:30 display cost-per-ride savings messaging in-app and at high-traffic stations.

3. Weekend-to-weekday shift  
Offer weekday ride challenges to weekend riders: complete three weekday rides → receive discounted first-month membership.

---

## Estimated Business Impact (Reasoned Estimate)

Casual riders completed 1.9M rides in the analysed year.

If 5% of active casual riders convert during summer months, Cyclistic could gain approximately 95,000 new members and increase predictable recurring revenue while reducing seasonal volatility.

---

## Practical Implementation Considerations

- Use existing channels (app notifications, email, station screens)
- Target riders after multiple rides rather than first use
- Limit discount duration to protect long-term revenue
- Focus campaigns during peak casual usage periods

---

## Measuring Success

Campaign performance should be evaluated using:

- Casual → member conversion rate
- Change in weekday ride share
- Repeat usage frequency after conversion
- Membership retention after first month

A/B testing should compare targeted vs non-targeted riders to confirm causal impact.

---

## Data Limitations

The dataset records trip behaviour but lacks contextual variables:

- Weather conditions not included
- Tourist vs resident status unknown
- Pricing sensitivity unavailable
- Marketing exposure history unavailable

Therefore findings identify behavioural opportunities but should be validated experimentally.

---

## Files in this Repository
- `report/cyclistic_case_study.pdf` — full written report
- `images/` — visualisations
- `sql/01_cleaning.sql` — data preparation
- `sql/02_feature_engineering.sql` — derived features
- `sql/03_aggregation.sql` — aggregated outputs
- `sql/04_business_questions.sql` — business analysis queries
