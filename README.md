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
This analysis was performed in **Google BigQuery**, enabling efficient querying of a multi-million row dataset without local processing.

Queries aggregated results inside the warehouse before export to reduce scanning cost and improve performance.

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

### Members commute: target 07:30–09:30 messaging
![Members show commute peaks](images/hourly_usage.png)

### Summer is the conversion window: run May–August offers
![Casual riders depend on summer](images/monthly_usage.png)

### Weekend riders are conversion candidates: shift to weekday habits
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

## Next Monday Playbook

### Summer conversion trial

| Element | Decision |
|------|------|
| Channel | Mobile app push notification + email |
| Timing | May–August, 10:00–16:00 |
| Trigger | After 2nd ride OR ride length > 15 min |
| Offer | 1-month discounted membership |
| Target | High-casual usage stations |
| Metric | Conversion rate + repeat weekday rides |

### Commute positioning

| Element | Decision |
|------|------|
| Channel | In-app banner + station screen |
| Timing | 07:30–09:30 and 16:30–18:30 |
| Message | Cost-per-ride savings |
| Metric | Weekday member ride share |

### Weekend-to-weekday shift

| Element | Decision |
|------|------|
| Channel | Push notification |
| Trigger | 3 weekend rides within 30 days |
| Offer | Discounted first month |
| Metric | Weekday adoption rate |

---

## Estimated Business Impact

Casual riders completed 1.9M rides in the analysed year.

If 5% of active casual riders convert during summer months, Cyclistic could gain ~95,000 new members and increase predictable recurring revenue while reducing seasonal volatility.

---

## How We Measure Success

Primary metric:
- Casual → member conversion rate

Supporting metrics:
- % targeted riders converting
- Member rides per week after conversion
- Weekday ride share change

### Conversion Scenarios

| Conversion Rate | New Members | Impact |
|------|------|------|
| 1% | ~19,000 | Small uplift |
| 3% | ~57,000 | Moderate uplift |
| 5% | ~95,000 | Significant recurring revenue |

---

## Validation Plan (A/B Testing)

- Test offer A vs offer B during summer weekends
- Compare high-casual stations vs control stations
- Measure uplift vs baseline conversion
- Track retention after first month

---

## Data Limitations

- Weather not included (affects seasonality)
- Tourist vs resident unknown
- Pricing plan details unavailable
- Station geography not analysed
- Trip purpose inferred from behaviour patterns

Findings therefore indicate opportunity but require experimental validation.

---

## Files in this Repository
- `report/cyclistic_case_study.pdf` — full written report
- `images/` — visualisations
- `sql/01_cleaning.sql`
- `sql/02_feature_engineering.sql`
- `sql/03_aggregation.sql`
- `sql/04_business_questions.sql`
