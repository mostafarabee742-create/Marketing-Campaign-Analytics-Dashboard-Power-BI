# 📣 Marketing Campaign Analytics Dashboard — SQL + Power BI

<div align="center">

![Dashboard Preview](Page%201.png)

[![Power BI](https://img.shields.io/badge/Built%20with-Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com)
[![SQL](https://img.shields.io/badge/SQL-Data%20Engineering-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)](.)
[![Star Schema](https://img.shields.io/badge/Data%20Model-Star%20Schema-0078D4?style=for-the-badge)](.)
[![DAX](https://img.shields.io/badge/DAX-Advanced%20Measures-28A745?style=for-the-badge)](.)

> **A full end-to-end marketing analytics solution** — from raw data to SQL engineering, star schema modeling, customer segmentation, and a 5-page interactive Power BI dashboard that drives smarter campaign decisions.

</div>

---

## 📊 Dashboard Previews

| Page 1 | Page 2 | Page 3 |
|--------|--------|--------|
| ![Page 1](Page%201.png) | ![Page 2](Page%202.png) | ![Page 3](Page%203.png) |

| Page 4 | Page 5 | Data Model |
|--------|--------|------------|
| ![Page 4](Page%204.png) | ![Page 5](Page%205.png) | ![Model](Data%20modeling.png) |

---

## 🔍 Project Overview

Marketing teams run dozens of campaigns every year — but without proper analytics, they have no idea which ones work, who responds, or where the money goes. This project solves that by building a complete analytics pipeline from the ground up:

**Raw CSV Data → SQL Transformation → Star Schema → Power BI Dashboard → Actionable Insights**

### 🎯 Business Questions Answered
- Which customer segments respond best to marketing campaigns?
- What drives campaign acceptance — age, income, channel, or behavior?
- Which product categories generate the most revenue?
- Who are the at-risk customers and how do we reactivate them?
- How does discount sensitivity vary across customer groups?

---

## 🏗️ Project Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    DATA PIPELINE                        │
│                                                         │
│  marketing_data.csv                                     │
│         │                                               │
│         ▼                                               │
│  SQL Transformation (Create tables queries.sql)         │
│         │                                               │
│         ▼                                               │
│  ┌──────────────────────────────────────┐               │
│  │         STAR SCHEMA MODEL            │               │
│  │                                      │               │
│  │  Behavioral_Segmentation ──┐         │               │
│  │                            ▼         │               │
│  │  Response Dimension ──► FACT TABLE   │               │
│  │                            ▲         │               │
│  │  Date Dimension ───────────┘         │               │
│  └──────────────────────────────────────┘               │
│         │                                               │
│         ▼                                               │
│  Power BI Dashboard (5 Pages + DAX Layer)               │
└─────────────────────────────────────────────────────────┘
```

---

## 🗄️ Data Engineering — SQL Layer

This project goes beyond Power BI — the data was first **engineered using SQL** to create a clean, optimized analytical model before any visualization.

### Fact Table — `marketing_table`

| Field | Description |
|-------|-------------|
| Customer spend by category | Fruits, Meat, Gold, Fish, Sweets, Wines |
| Campaign acceptance flags | 6 campaign response indicators |
| Purchase channels | Store, Web, Catalog counts |
| Recency Score | Days since last purchase |
| Total_spend | Calculated aggregate spend |
| Campaign_Acceptance_Score | Composite responsiveness score |
| Recency_Segment | Hot / Warm / Cold classification |

### Dimension Tables

**Behavioral Segmentation Dimension**
Classifies each customer across 3 axes:

```
Purchase Channel    →  In-Store / Online / Catalog
Discount Sensitivity →  High / Medium / Low
Web Engagement      →  High / Medium / Low
```

**Response Dimension**
Groups customers by campaign responsiveness:

```
High Responsive     →  Accepted 4–6 campaigns
Medium Responsive   →  Accepted 2–3 campaigns
Low Responsive      →  Accepted 1 campaign
Non-Responsive      →  Accepted 0 campaigns
```

**Date Dimension**
Supports Year, Quarter, Month, and full time-series trend analysis.

---

## 📈 Key Insights from the Analysis

**1. 🎯 Age 35–50 is the Sweet Spot**
Customers in this age group showed the highest campaign acceptance rates across multiple campaigns — making them the primary target demographic for future marketing spend.

**2. 🛒 In-Store Buyers = Most Valuable Segment**
In-store customers had the highest total spend and lowest discount sensitivity — meaning they buy at full price and do so consistently. These are your premium customers.

**3. 💻 Online Buyers = Discount Hunters**
Online buyers showed significantly higher discount sensitivity. Sending them full-price campaigns is inefficient — they respond best to promotional offers.

**4. 📦 Revenue Concentration in 3 Categories**
```
Meat    →  Highest revenue category
Gold    →  Second highest, strong cross-campaign demand
Fruits  →  Consistent performer across all segments
```

**5. 🌐 High Web Engagement = High Campaign Response**
Customers with 10+ monthly web visits showed the strongest responsiveness to campaigns AND the highest cross-category purchase behavior — a clear signal for digital retargeting strategies.

**6. ⚠️ At-Risk Segments Need Reactivation**
A clear cluster of "lost" and "at-risk" customers was identified in the segmentation. These represent low-hanging fruit for reactivation campaigns with personalized offers.

---

## 💼 Dashboard Pages Breakdown

### 📄 Page 1 — Campaign Overview
High-level KPIs: total customers, total spend, campaign acceptance rates, and revenue by product category.

### 📄 Page 2 — Customer Segmentation
Behavioral clustering — in-store vs. online vs. catalog buyers, discount sensitivity distribution, and web engagement levels.

### 📄 Page 3 — Campaign Performance
Campaign-by-campaign acceptance rates, demographic breakdown of responders, and multi-campaign acceptance analysis.

### 📄 Page 4 — Product & Revenue Analysis
Category-level revenue breakdown, cross-category purchase patterns, and spend trends by customer segment.

### 📄 Page 5 — Customer Lifecycle & Recency
Recency segmentation (Hot / Warm / Cold), at-risk customer identification, and reactivation opportunity sizing.

---

## ⚙️ Key DAX Measures Used

```dax
-- Total Campaign Acceptance Rate
Campaign Acceptance Rate =
DIVIDE(
    COUNTROWS(FILTER(Fact, Fact[Campaign_Acceptance_Score] > 0)),
    COUNTROWS(Fact)
)

-- High Value Customer Segment
High Value Customers =
CALCULATE(
    COUNTROWS(Fact),
    Fact[Total_spend] >= PERCENTILE.INC(Fact[Total_spend], 0.75)
)

-- Recency Segmentation
Recency Segment =
SWITCH(
    TRUE(),
    Fact[Recency] <= 30, "Hot",
    Fact[Recency] <= 90, "Warm",
    "Cold"
)

-- Discount Sensitivity Score
Discount Sensitivity =
DIVIDE([Total Purchases with Discount], [Total Purchases])
```

---

## 🛠️ Technical Stack

```
📁 Project Structure
├── 🗄️ Create tables queries.sql       # SQL views & transformations
├── 🗄️ SQLQuery1.sql                   # Additional SQL queries
├── 📊 marketing project.pbix          # Power BI dashboard (5 pages)
├── 📂 marketing_data.csv              # Raw source data
├── 📂 marketing_data_dictionary.csv   # Data dictionary
├── 🖼️ Data modeling.png               # Star schema diagram
├── 🖼️ Page 1.png                      # Dashboard screenshot
├── 🖼️ Page 2.png                      # Dashboard screenshot
├── 🖼️ Page 3.png                      # Dashboard screenshot
├── 🖼️ Page 4.png                      # Dashboard screenshot
├── 🖼️ Page 5.png                      # Dashboard screenshot
└── 📖 README.md
```

### Tools & Technologies
- **SQL (T-SQL)** — Data transformation, view creation, segmentation logic
- **Power BI Desktop** — 5-page interactive dashboard
- **DAX** — Advanced KPIs, segmentation measures, time intelligence
- **Data Modeling** — Star schema architecture
- **Power Query** — Data cleaning and loading pipeline
- **CSV / Excel** — Source data format

---

## 🚀 How to Use

1. **Clone this repository**
   ```bash
   git clone https://github.com/mostafarabee742-create/Marketing-Campaign-Analytics-Dashboard-Power-BI.git
   ```

2. **Set up the database**
   - Open SQL Server Management Studio (SSMS)
   - Run `Create tables queries.sql` to generate the fact and dimension views
   - Run `SQLQuery1.sql` for additional transformations

3. **Open the dashboard**
   - Install [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free)
   - Open `marketing project.pbix`
   - Update the data source connection to point to your SQL Server

4. **Explore the data**
   - Navigate across all **5 pages** using the bottom tabs
   - Use **segment slicers** to filter by behavioral group, age, or campaign
   - Click any visual to cross-filter the entire page

---

## 🎓 Skills Demonstrated

- **SQL Engineering** — Writing views, transformations, and segmentation logic from scratch
- **Star Schema Design** — Fact and dimension table architecture for optimal BI performance
- **Customer Segmentation** — Behavioral, recency, and response-based clustering
- **DAX** — Advanced calculated measures, KPIs, and dynamic segmentation
- **Data Visualization** — 5-page storytelling dashboard with cross-filtering
- **Business Intelligence** — Translating marketing data into revenue-driving recommendations

---

## 📬 Contact

**Author:** Mostafa Rabee
**Role:** Data Analyst
**LinkedIn:** [linkedin.com/in/mostafa-rabee74](https://www.linkedin.com/in/mostafa-rabee74)
**Email:** [mostafarabee742@gmail.com](mailto:mostafarabee742@gmail.com)
**GitHub:** [github.com/mostafarabee742-create](https://github.com/mostafarabee742-create)

---

<div align="center">

⭐ **If you found this project useful, please give it a star!** ⭐

*Built with ❤️ by Mostafa Rabee | Data Analyst*
*From Raw Data to Marketing Intelligence*

</div>
