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

## Operational Plan

1) Summer conversion offer
Trigger: after a casual rider completes their 2nd ride  
Channel: mobile push notification  
Timing: May–August, 10:00–16:00  
Goal: convert leisure riders during peak engagement

2) Commute savings messaging
Channel: in-app banner + station display  
Timing: 07:30–09:30 and 16:30–18:30  
Goal: reposition service as daily transport

3) Weekend rider activation
Trigger: 3 weekend rides in 30 days  
Offer: discounted first month membership  
Goal: shift recreational riders into weekday usage


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


How We Measure Success

This project proposes behavioural interventions, so success must be measured through observable change rather than engagement alone.

Primary KPI

Weekly casual → member conversion rate

Supporting KPIs

% of targeted riders who convert

Member rides per week after conversion (retention proxy)

Weekday ride share increase after campaign

Estimated Revenue Impact
Conversion Rate	New Members	Expected Effect
1%	~19,000	Minor uplift
3%	~57,000	Moderate recurring revenue
5%	~95,000	Significant revenue stabilisation
Validation Plan (A/B Testing)

To confirm causality rather than seasonal coincidence:

Run campaign A vs B during identical summer weekends

Use high-casual stations as treatment group

Use matched stations as control group

Measure uplift above baseline conversion

Campaign effectiveness is defined as statistically higher conversion and retained weekday usage after the intervention.

Practical Execution Playbook

Summer Conversion Offer

Channel: mobile push + email

Trigger: after 2 casual rides or ride length > 15 minutes

Timing: May–August, 10:00–16:00

Goal: convert leisure users during peak engagement

Commute Positioning

Channel: in-app banner + station display

Timing: 07:30–09:30 and 16:30–18:30

Goal: reposition service as daily transport

Weekend Activation

Trigger: 3 weekend rides within 30 days

Offer: discounted first month membership

Goal: shift recreational riders into weekday usage

Analytical Limitations

The dataset records behaviour but lacks contextual drivers:

Weather conditions unavailable (confounds seasonality)

Tourist vs resident status unknown

Pricing plan details unavailable

Station geography not analysed (leisure hotspots likely)

Trip purpose inferred rather than observed

Findings therefore identify opportunities, but large-scale rollout should follow controlled testing.

Reproducibility Details

Dataset period: 12 months Divvy trip records
Tables created:

trips_raw → imported source data

cleaned_trips → invalid durations removed

featured_trips → derived time features

aggregated summaries → analysis outputs

Cleaning rules

Remove null timestamps

Remove rides < 1 minute or > 24 hours

Standardise datetime fields

SQL workflow

Staging / loading raw data

Cleaning invalid records

Feature engineering from timestamps

Aggregations for behaviour patterns

Business question queries

Decision Interpretation of Charts

Commute peaks → schedule messaging at commuting hours

Summer surge → concentrate conversion campaigns May–August

Weekend behaviour → target recreational riders for weekday adoption

## Success Metrics

Primary KPI:
- Weekly casual → member conversion rate

Secondary KPIs:
- % of targeted riders converting
- Average member rides per week after conversion
- Weekday ride share change after campaign

These metrics allow evaluation of behavioural change rather than short-term engagement spikes.

---
## Validation Plan

Campaigns should be evaluated using controlled experiments:

- Compare targeted riders vs similar non-targeted riders
- Run tests during identical seasonal periods
- Measure uplift above baseline conversion

This ensures observed improvements are caused by the intervention rather than seasonal variation.


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

## Analytical Limitations

The dataset captures behaviour but not context:

- Weather conditions unavailable (affects seasonal usage)
- Tourist vs resident riders unknown
- Pricing sensitivity not included
- Station geography not analysed (leisure hotspots likely)
- Trip purpose inferred rather than observed

Therefore findings identify opportunities but require experimental validation before large-scale rollout.


---

## Files in this Repository
- `report/cyclistic_case_study.pdf` — full written report
- `images/` — visualisations
- `sql/01_cleaning.sql`
- `sql/02_feature_engineering.sql`
- `sql/03_aggregation.sql`
- `sql/04_business_questions.sql`
