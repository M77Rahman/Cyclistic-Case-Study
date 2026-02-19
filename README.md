# Cyclistic Bike-Share Case Study (Google Data Analytics Capstone)

Analysed **5.4 million** ride records in **Google BigQuery** to identify behavioural differences between casual riders and annual members.  
Discovered commuter vs leisure usage patterns and proposed targeted marketing actions to improve membership conversion.

**Live project:** https://m77rahman.github.io/Cyclistic-Case-Study/  
**Full report (PDF):** report/cyclistic_case_study.pdf  

---

## Business Problem
Cyclistic wants to increase annual memberships.  
This analysis answers: **How do casual riders and members use bikes differently, and what actions can increase membership conversion?**

---

## Data Environment (Data Warehouse Approach)
This analysis was performed in **Google BigQuery**, enabling efficient querying of a **multi-million row** dataset without local processing.  
Queries were written to aggregate results in the warehouse before export to reduce data movement and improve performance.

- Environment: Google BigQuery (cloud data warehouse)
- Data scale: 5,400,008 cleaned ride records (12 months)
- Output: aggregated tables exported for visualisation

---

## Method (High-Level)
- Queried large datasets using **Google BigQuery**
- Performed **data cleaning and transformation** using analytical SQL
- Built **derived features** from timestamp data (ride length, hour, weekday, month)
- Aggregated millions of records efficiently using warehouse functions
- Exported only summarised outputs for charting

---

## Query Optimisation
To reduce data scanning and improve performance:
- selected only required columns
- filtered invalid rides early (before aggregation)
- aggregated in BigQuery before exporting
- avoided repeated full-table scans by staging tables

---

## Key Findings (Charts = Conclusions)

### Members show commute peaks at 08:00–09:00 and 17:00–18:00
![Members show commute peaks](images/hourly_usage.png)

### Casual riders depend heavily on the summer season
![Casual riders depend on summer](images/monthly_usage.png)

### Weekdays are member-heavy; weekends become more balanced
![Weekdays vs weekends](images/weekday_usage.png)

---

## Business Insight (Behavioural Segmentation)
**Members (transport users)**
- commute-oriented
- predictable daily travel
- consistent year-round usage

**Casual riders (leisure users)**
- seasonal and weather-driven behaviour
- higher weekend share
- recreational use patterns

---

## Recommendations
1. **Convert summer casual riders into members**  
   Run limited-time membership offers during peak warm months when casual usage is highest.

2. **Promote commuting value during peak commute hours**  
   Position membership around cost-per-ride savings for repeat weekday riders.

3. **Weekend-to-weekday conversion campaign**  
   Use trial weekday passes and first-month discounts to shift weekend riders toward weekday habits.

---

## Business Impact
This analysis enables Cyclistic to:
- target marketing during high conversion periods (summer + weekends)
- personalise messaging for commuter vs leisure segments
- improve membership revenue predictability by reducing seasonal dependence

---

## Files in this repo
- `report/cyclistic_case_study.pdf` → full written report
- `images/` → charts used in the write-up
- `sql/01_cleaning.sql` → cleaning stage
- `sql/02_feature_engineering.sql` → derived features
- `sql/03_aggregation.sql` → rollups for charts
- `sql/04_business_questions.sql` → queries answering business questions
