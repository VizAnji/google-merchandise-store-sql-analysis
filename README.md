# E-Commerce Marketing Analytics — SQL
### Google Merchandise Store | MySQL 

> 📂 Full SQL queries and dataset structure → [`TECHNICAL.md`](TECHNICAL.md)

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
| Monday | 16,500 | **3.5%** | 🥇 Highest conversion |
| Tuesday | **17,300** | 3.2% | 🥇 Highest traffic |
| Wednesday | 16,800 | 3.1% | ✅ Strong |
| Thursday | 16,200 | 3.0% | ✅ Strong |
| Friday | 14,900 | 2.8% | ⚠️ Declining |
| Saturday | 10,100 | **2.5%** | 🔴 Lowest conversion |
| Sunday | 9,600 | 2.6% | 🔴 Weak |

> 🔑 **Monday leads conversion at 3.5% but ranks 2nd in traffic.** Weekday sessions (Mon–Thu) are the most valuable monetisation window. Weekend conversion drops **29% vs Monday**, signalling an opportunity for targeted weekend promotions and remarketing campaigns.

---

### Analysis 2 — Website Engagement & Monetisation by Device

<img width="1536" height="1024" alt="Website Engagement by Device" src="https://github.com/user-attachments/assets/79b791fa-e2fc-4a3e-bea0-4557cf96a83a" />

| Device | Sessions Share | Revenue Share | Gap |
|---|---|---|---|
| 🖥️ Desktop | 72% | **94%** | Converts above session share ✅ |
| 📱 **Mobile** | **24%** | **5%** | 🔴 **19% revenue gap** |
| 📟 Tablet | 4% | 1% | Minor underperformance |

> 🔑 **Mobile drives 24% of sessions but only 5% of revenue — a near 5x gap.** This is not a demand problem — it's a **checkout friction problem.** Optimising mobile UX, simplifying the checkout flow, and adding mobile payment options (Apple Pay, Google Pay) directly targets this gap.

---

### Analysis 3 — Website Acquisition & Monetisation by Channel


| Channel | Sessions | Bounce Rate | Conversion Rate | Revenue | Grade |
|---|---|---|---|---|---|
| 🏆 **Referral** | 7,500 | **15%** | **6.6%** | **$163M** | ✅ **A+** |
| 🔍 Organic Search | **39,900** | 32% | 3.1% | High | ✅ A |
| 🏠 Direct | 28,000 | 46% | 2.0% | Moderate | ⚠️ C+ |
| 📱 Social | 8,500 | 46% | **<1%** | Low | 🔴 D |
| 💰 Paid Search | 11,000 | 34% | 2.1% | Moderate | ✅ B |
| 🖥️ Display | 5,200 | 34% | 1.2% | Low | ⚠️ C |
| 🤝 Affiliates | 2,100 | **51%** | **<0.5%** | Minimal | 🔴 F |

> 🔑 **Referral is the standout channel** — lowest bounce rate (15%), highest conversion (6.6%), and strongest revenue. **Social and Affiliates are the clear underperformers** — high traffic, minimal return. Every pound spent on Affiliates is largely wasted at a 51% bounce rate.

---

### Analysis 4 — Website Retention: New vs Returning Visitors

<img width="1536" height="1024" alt="Website Retention" src="https://github.com/user-attachments/assets/e2fefa1d-7b18-4a61-94d4-ef124d8439b3" />


| Visitor Type | Share | Healthy Benchmark | Gap |
|---|---|---|---|
| 🆕 New Visitors | **80%** | 50–70% | 🔴 Above healthy range |
| 🔁 Returning Visitors | **20%** | 30–50% | 🔴 Below benchmark |

> 🔑 **80% of users visit only once** — well above the healthy benchmark. The platform attracts strongly but lacks any retention mechanism. Raising returning visitors from **20% → 30%** adds **50% more repeat sessions at zero acquisition cost** — the highest-ROI retention lever available.

---

## 🚀 Strategic Recommendations

> 5 highest-impact actions derived from the analysis, prioritised by revenue potential.

---

**📱 Priority 1 — Enhance Mobile Experience**
`Data: 24% of sessions → 5% of revenue`

| Action | Target Impact |
|---|---|
| Streamline checkout to 3 steps · Add Apple Pay & Google Pay | **Close 50% of mobile revenue gap** |
| Optimise mobile UI and page load speed | **Est. +150% mobile revenue** |

---

**🔁 Priority 2 — Strengthen Retention**
`Data: 80% one-time visitors · Benchmark is 30–50% returning`

| Action | Target Impact |
|---|---|
| Email retargeting for first-time visitors · Launch loyalty programme | **Raise returning visitors 20% → 30%** |
| Personalised content for repeat visitors | **+50% repeat sessions at zero acquisition cost** |

---

**🏆 Priority 3 — Expand Referral Partnerships**
`Data: 6.6% conversion · $163M revenue · Lowest bounce rate (15%)`

| Action | Target Impact |
|---|---|
| Partner with top referring sites · Offer revenue share to quality partners | **+20% referral traffic** |
| Analyse and replicate top referrer profiles | **Highest ROI channel — scale what works** |

---

**📅 Priority 4 — Seasonal & Holiday Campaigns**
`Data: December traffic spike clearly outperforms all other months`

| Action | Target Impact |
|---|---|
| Replicate December tactics across key periods · Create themed promotions | **Est. +25% revenue in campaign months** |

---

**✂️ Priority 5 — Reevaluate Affiliate Strategy**
`Data: 51% bounce rate · <0.5% conversion · Worst channel by every metric`

| Action | Target Impact |
|---|---|
| Audit and terminate underperforming affiliates | **Eliminate wasted spend** |
| Redirect budget to Referral expansion | **Reinvest into 6.6% conversion channel** |

---

### 📊 Priority Summary

| Priority | Area | Current State | Target |
|---|---|---|---|
| 🔴 1 — Critical | Mobile experience | 5% revenue from 24% sessions | **+150% mobile revenue** |
| 🔴 2 — Critical | Retention | 80% one-time visitors | **+50% repeat sessions** |
| 🟠 3 — High | Referral expansion | 6.6% conversion underinvested | **+20% referral traffic** |
| 🟠 4 — High | Seasonal campaigns | December spike replicable | **+25% revenue uplift** |
| 🟡 5 — Medium | Affiliate audit | 51% bounce · <0.5% conversion | **Eliminate wasted budget** |

---

## 🛠️ Tools & Techniques

`MySQL` · `MySQL Workbench` · `Window Functions` · `Subqueries` · `CASE WHEN` · `Date Functions` · `UNION ALL` · `Conversion Rate Analysis` · `Channel Attribution` · `E-commerce Analytics`

---



