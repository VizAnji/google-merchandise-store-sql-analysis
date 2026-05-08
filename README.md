🛒 Digital Marketing Strategy Optimisation — SQL Analysis
Google Merchandise Store | MySQL | E-commerce Analytics

📌 Project Overview
The Google Marketing Team was running multiple campaigns simultaneously but had no unified view of which channels were actually driving revenue versus just traffic. Without consolidated data, proving ROI to stakeholders and making confident marketing decisions was a constant challenge.
As the analyst on this project, I built a MySQL database from scratch, merged three months of raw session data into a single unified dataset, and conducted an in-depth analysis of user behavior, device performance, traffic channels, and regional patterns — delivering 10 data-backed strategic recommendations to boost revenue.

Dataset: Google Merchandise Store (real e-commerce platform)
Period: October 1, 2016 — December 31, 2016
Scope: US website sessions across 3 months
Tool: MySQL Workbench


📊 Key Findings
FindingInsight🏆 Top converting channelReferral converts at 7% — 3x higher than any other channel📱 Mobile revenue gapMobile = 25% of sessions but only 5% of revenue🔄 Retention problem80% of users visit only once — major retention opportunity📍 Hidden high-value marketWashington state = 1% of mobile sessions → 11% of revenue📅 Best conversion dayMondays convert best despite lower traffic than Tuesdays📈 Holiday upliftDecember traffic spike confirms seasonal campaign potential

💡 Strategic Recommendations

Seasonal campaigns — Replicate December holiday strategy year-round for an estimated 20–25% revenue uplift in non-peak months
Maximize Monday conversions — Boost Monday traffic by 10% through targeted start-of-week promotions
Enhance mobile experience — Optimize mobile checkout and UI to close the 25% sessions vs 5% revenue gap
Expand referral partnerships — Referral's 7% conversion rate makes it the highest ROI channel — invest accordingly
Target high-value regions — Focus mobile campaigns on Washington and Illinois which punch far above their session share
Retention strategy — Launch loyalty programs and retargeting campaigns to convert 80% one-time visitors into repeat buyers
Weekday promotions — Leverage peak Tuesday/Wednesday traffic with targeted deals and email campaigns
Revamp social strategy — Social drives traffic but has the lowest conversion rate — campaigns need a full redesign
Improve affiliate quality — Affiliates have the highest bounce rate and lowest conversions — audit and restructure partnerships
Fix mobile data gaps — Work with Data Engineering to resolve untracked mobile session regions for more accurate analysis


🗂️ Project Structure
google-merchandise-store-sql-analysis/
│
├── README.md                          # Project overview (you are here)
├── sql/
│   ├── 01_database_setup.sql          # Database creation and data combination
│   ├── 02_data_exploration.sql        # Null checks, duplicate analysis, session ID fix
│   ├── 03_engagement_by_day.sql       # Daily and weekday traffic analysis
│   ├── 04_device_analysis.sql         # Device performance and revenue breakdown
│   ├── 05_regional_analysis.sql       # Geographic revenue and mobile analysis
│   ├── 06_retention_analysis.sql      # New vs returning visitor breakdown
│   ├── 07_acquisition_analysis.sql    # Bounce rate and channel performance
│   └── 08_channel_monetisation.sql    # Full channel performance with conversions

🔍 Technical Highlights
1. Engineering a reliable session identifier
visitid appeared unique but wasn't — multiple visitors can start sessions at the same timestamp. I solved this by concatenating fullvisitorid with visitid to create a truly unique session key.
sqlSELECT
    CONCAT(fullvisitorid, '-', visitid) AS unique_session_id,
    COUNT(*) AS total_rows
FROM gms_project.data_combined
GROUP BY 1
HAVING COUNT(*) > 1;
2. Full channel performance breakdown using window functions
Combined bounce rate, conversion rate, average time on site, and revenue in a single query using SQL window functions — no separate queries needed.
sqlSELECT
    channelGrouping,
    COUNT(DISTINCT unique_session_id) AS sessions,
    ((SUM(bounces)/COUNT(DISTINCT unique_session_id))*100) AS bounce_rate,
    (SUM(pageviews)/COUNT(DISTINCT unique_session_id)) AS avg_pages_on_site,
    (SUM(timeonsite)/COUNT(DISTINCT unique_session_id)) AS avg_time_on_site,
    ((SUM(CASE WHEN transactions >= 1 THEN 1 ELSE 0 END)
        /COUNT(DISTINCT unique_session_id))*100) AS conversion_rate,
    SUM(transactionrevenue)/1e6 AS revenue
FROM (
    SELECT
        channelGrouping, bounces, pageviews,
        timeonsite, transactions, transactionrevenue,
        CONCAT(fullvisitorid, '-', visitid) AS unique_session_id
    FROM gms_project.data_combined
    GROUP BY 1,2,3,4,5,6,7
) t1
GROUP BY 1
ORDER BY 2 DESC;
3. Uncovering the mobile revenue gap by region
Used window functions to calculate each region's share of total mobile sessions and revenue simultaneously — revealing that Washington state generates 11% of mobile revenue from just 1% of sessions.
sqlSELECT
    deviceCategory,
    region,
    COUNT(DISTINCT unique_session_id) AS sessions,
    ((COUNT(DISTINCT unique_session_id)/SUM(COUNT(DISTINCT unique_session_id))
        OVER ())*100) AS sessions_percentage,
    SUM(transactionrevenue)/1e6 AS revenue,
    ((SUM(transactionrevenue)/SUM(SUM(transactionrevenue))
        OVER ())*100) AS revenue_percentage
FROM (
    SELECT
        deviceCategory,
        CASE
            WHEN region = '' OR region IS NULL THEN 'NA'
            ELSE region
        END AS region,
        transactionrevenue,
        CONCAT(fullvisitorid, '-', visitid) AS unique_session_id
    FROM gms_project.data_combined
    WHERE deviceCategory = 'mobile'
    GROUP BY 1,2,3,4
) t1
GROUP BY 1,2
ORDER BY 3 DESC;

🛠️ Tools & Techniques
CategoryDetailsDatabaseMySQL, MySQL WorkbenchSQL techniquesWindow functions, CASE statements, subqueries, date functions, string functions, UNION ALL, GROUP BY, HAVINGAnalysis areasUser behavior, device performance, traffic channels, regional analysis, retention, conversion rate analysisData tasksDatabase creation, data merging, null handling, deduplication, session engineering

📈 Analysis Areas Covered

✅ Website engagement by day and weekday
✅ Conversion rate analysis by day
✅ Device performance — sessions vs revenue
✅ Regional breakdown of mobile revenue
✅ New vs returning visitor retention
✅ Bounce rate by channel
✅ Full channel monetisation analysis
