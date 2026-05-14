# E-Commerce Marketing Analytics — SQL
### Google Merchandise Store 

> 📂 Full SQL Queries → [gms_project_queries.sql](https://github.com/VizAnji/google-merchandise-store-sql-analysis/blob/main/gms_project_queries.sql)

---

## 🏢 Client & Project Background

| | |
|---|---|
| **Client** | Google Marketing Team — United States |
| **Platform** | Google Merchandise Store — Google-branded apparel, lifestyle & stationery |
| **Data Source** | Google Analytics Public Dataset · Google BigQuery |

### The Problem

The Google Marketing Team ran campaigns across **7 channels simultaneously** with no unified view of which were driving revenue. Leadership needed answers to 6 critical questions:

| # | Business Challenge |
|---|---|
| 1 | How do users interact with the platform — and what behaviours drive purchases? |
| 2 | Are promotional campaigns driving **long-term retention** or only short-term sales? |
| 3 | How does **mobile and web experience** impact sales and engagement? |
| 4 | Which **geographic markets** are most profitable? |
| 5 | How effective are strategies at **acquiring and retaining** customers? |
| 6 | Which **traffic channels** yield the highest conversion rates — and why? |

### My Role
As the marketing analyst, I built a **MySQL database from scratch**, merged 3 months of raw session data, and performed full data preprocessing. I then used **advanced SQL** — window functions, date functions, string functions, and subqueries — to turn fragmented data into actionable business intelligence.

---

## 🎯 Project Objective

> **To identify exactly where Google's e-commerce platform was losing revenue — and prescribe specific, measurable actions to recover it.**

| # | Business Question | Analysis Area |
|---|---|---|
| 1 | Which days drive the most sessions — and the most conversions? | Engagement & Monetisation |
| 2 | Where is the mobile experience failing to convert traffic into revenue? | Device Performance |
| 3 | Which channels are worth investing in — and which are wasting budget? | Channel Attribution |
| 4 | Are we retaining customers, or constantly paying to acquire new ones? | Retention |

---

## 📊 Business Insights

---

### Analysis 1 — Website Engagement & Monetisation by Day

<img width="888" height="658" alt="Website_Engagement_By_Day" src="https://github.com/user-attachments/assets/1549e85b-6ea1-464f-9b51-3d063b8051e5" />

| Day | Sessions | Conversion Rate | Performance |
|---|---|---|---|
| Monday | 16,500 | **3.5%** | Highest conversion |
| Tuesday | **17,300** | 3.2% | Highest traffic |
| Wednesday | 16,800 | 3.1% | Strong |
| Thursday | 16,200 | 3.0% | Strong |
| Friday | 14,900 | 2.8% | Declining |
| Saturday | 10,100 | **2.5%** | Lowest conversion |
| Sunday | 9,600 | 2.6% | Weak |

> **Monday leads conversion at 3.5% but ranks 2nd in traffic.** Weekday sessions (Mon–Thu) are the most valuable monetisation window. Weekend conversion drops **29% vs Monday**, signalling an opportunity for targeted weekend promotions and remarketing campaigns.

---



### Analysis 2 — Website Engagement & Monetisation by Device

<img width="1536" height="1024" alt="Website Engagement by Device" src="https://github.com/user-attachments/assets/79b791fa-e2fc-4a3e-bea0-4557cf96a83a" />

| Device | Sessions Share | Revenue Share | Gap |
|---|---|---|---|
| Desktop | 72% | **94%** | Converts above session share |
| **Mobile** | **24%** | **5%** | **19% revenue gap** |
| Tablet | 4% | 1% | Minor underperformance |

> **Mobile drives 24% of sessions but only 5% of revenue — a near 5x gap.** This is not a demand problem — it's a **checkout friction problem.** Optimising mobile UX, simplifying the checkout flow, and adding mobile payment options (Apple Pay, Google Pay) directly targets this gap.


---



### Analysis 3 — Website Acquisition & Monetisation by Channel


| Channel | Sessions | Bounce Rate | Conversion Rate | Revenue | Grade |
|---|---|---|---|---|---|
| **Referral** | 7,500 | **15%** | **6.6%** | **$163M** | 
| Organic Search | **39,900** | 32% | 3.1% | High |
| Direct | 28,000 | 46% | 2.0% | Moderate | 
| Social | 8,500 | 46% | **<1%** | Low | 
| Paid Search | 11,000 | 34% | 2.1% | Moderate | 
| Display | 5,200 | 34% | 1.2% | Low | 
| Affiliates | 2,100 | **51%** | **<0.5%** | Minimal |

> **Referral is the standout channel** — lowest bounce rate (15%), highest conversion (6.6%), and strongest revenue. **Social and Affiliates are the clear underperformers** — high traffic, minimal return. Every pound spent on Affiliates is largely wasted at a 51% bounce rate.


---



### Analysis 4 — Website Retention: New vs Returning Visitors

<img width="1536" height="1024" alt="Website Retention" src="https://github.com/user-attachments/assets/e2fefa1d-7b18-4a61-94d4-ef124d8439b3" />


| Visitor Type | Share | Healthy Benchmark | Gap |
|---|---|---|---|
| New Visitors | **80%** | 50–70% | Above healthy range |
| Returning Visitors | **20%** | 30–50% | Below benchmark |

> **80% of users visit only once** — well above the healthy benchmark. The platform attracts strongly but lacks any retention mechanism. Raising returning visitors from **20% → 30%** adds **50% more repeat sessions at zero acquisition cost** — the highest-ROI retention lever available.



---



## 🚀 Recommendations & Strategic Action Plan

> 10 data-backed recommendations derived from the analysis, organised by business area with measurable impact targets.

---

### Timing & Campaigns

| # | Recommendation | Data Behind It | Action | Target Impact |
|---|---|---|---|---|
| 1 | **Seasonal & Holiday Campaigns** | December traffic spike visible in daily sessions data | Create themed promotions, holiday guides, and limited-time discounts during key seasonal periods | **Est. +25% revenue uplift** during campaign months |
| 2 | **Maximise Monday Conversions** | Monday has highest conversion rate at **2.8%** but 14% fewer sessions than Tuesday | Launch start-of-week exclusive deals promoted via email and social media every Monday morning | **+10% Monday traffic** → highest-converting day fully utilised |
| 3 | **Targeted Weekday Promotions** | Tuesday and Wednesday are the **two highest-traffic days** of the week | Align email marketing and social campaigns to land on Tuesday–Wednesday when users are most active | **Maximise conversion** during peak 40% of weekly traffic |

---

### Mobile & Device

| # | Recommendation | Data Behind It | Action | Target Impact |
|---|---|---|---|---|
| 4 | **Enhance Mobile Experience** | Mobile = **25% of sessions** but only **5% of revenue** — a 5x gap | Optimise mobile UI, streamline checkout to 3 steps, add Apple Pay and Google Pay | **Close 50% of mobile revenue gap** — potential +150% mobile revenue |
| 5 | **Focus on High-Value Regions** | Washington = **1% of mobile sessions → 11% of mobile revenue**. Illinois = **3% sessions → 9% revenue** | Run localised mobile campaigns in Washington and Illinois first before national rollout | **Validate mobile strategy** in highest-converting states first |

---

### Retention & Engagement

| # | Recommendation | Data Behind It | Action | Target Impact |
|---|---|---|---|---|
| 6 | **Strengthen Retention** | **80% of users visit only once** — well below the 30–50% returning visitor benchmark | Launch retargeting campaigns for first-time visitors, introduce a loyalty points programme | **Raise returning visitors from 20% → 30%** — 50% more repeat sessions at zero acquisition cost |
| 7 | **Weekend Engagement Strategy** | Conversion drops **57% from Friday to Sunday** — weekend visitors browse but don't buy | Deploy retargeting ads to re-engage weekday visitors with weekend-exclusive promotions and loyalty rewards | **+15% uplift** in off-peak weekend sales |

---

### Channel Optimisation

| # | Recommendation | Data Behind It | Action | Target Impact |
|---|---|---|---|---|
| 8 | **Optimise Referral & Organic** | Referral converts at **7%** — highest of all channels. Organic Search drives the most sessions at 45,200 | Expand referral partnerships by 20%. Continue SEO investment to sustain Organic Search volume | **+20% referral traffic** · Protect $18,000 Organic revenue base |
| 9 | **Revamp Social & Paid Channels** | Social bounce rate = **47%**, conversion = **0.4%**. Paid Search and Display both at **34% bounce rate** | Rebuild Social campaigns around product-specific landing pages. Improve audience targeting in Paid and Display | **Reduce Social bounce rate below 30%** · Target 2%+ Social conversion |
| 10 | **Reevaluate Affiliate Strategy** | Affiliates have the **highest bounce rate (52%)** and **lowest conversion (0.3%)** of all channels | Audit all affiliate partnerships for quality and relevance. Terminate underperformers. Restructure commission model | **Eliminate wasted spend** · Redirect budget to Referral and Organic |

---

### Impact Summary

| Priority | Area | Key Metric | Potential Uplift |
|---|---|---|---|
| Critical | Mobile experience | 25% sessions → 5% revenue | **+150% mobile revenue** |
| Critical | Retention | 80% one-time visitors | **+50% repeat sessions** |
| High | Referral expansion | 7% conversion rate | **+20% referral traffic** |
| High | Seasonal campaigns | December spike replicable | **+25% revenue in campaign months** |
| Medium | Monday traffic boost | 2.8% conversion underutilised | **+10% Monday sessions** |
| Medium | Social media redesign | 0.4% conversion, 47% bounce | **Target 2%+ conversion** |
| Medium | Weekend engagement | 57% conversion drop on weekends | **+15% weekend sales** |
| Ongoing | SEO & Organic | Largest session volume channel | **Protect $18,000 revenue base** |
| Ongoing | Regional targeting | Washington & Illinois high-value | **Mobile strategy validation** |
| Review | Affiliate audit | 52% bounce, 0.3% conversion | **Eliminate wasted budget** |
---

## 🛠️ Tools & Techniques

`MySQL` · `MySQL Workbench` · `Window Functions` · `Subqueries` · `CASE WHEN` · `Date Functions` · `UNION ALL` · `Conversion Rate Analysis` · `Channel Attribution` · `E-commerce Analytics`

---



