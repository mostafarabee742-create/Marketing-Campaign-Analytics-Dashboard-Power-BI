Marketing Analytics Project – Customer Segmentation & Campaign Performance
Overview

This project presents a complete end-to-end Marketing Analytics solution built using SQL, Data Modeling, and Power BI. The goal is to understand customer behavior, evaluate campaign performance, and provide actionable insights to support data-driven marketing decisions.

The project includes:

Data cleaning and transformation

Star schema modeling

Segmentation logic (behavioral + response)

DAX measures for KPI calculations

Interactive Power BI dashboard

Key insights for business decision-making

1. Dataset

The dataset contains customer demographic data, purchase history, marketing campaign interactions, discounts, web behavior, and product category spending.

Key fields include:

Purchases (store, web, catalog)

Product category spend (Fruits, Meat, Gold, etc.)

Recency / Web visits

Campaign responses

Income, age, marital status

Complaint records

2. Data Engineering & SQL Modeling

The data was transformed and structured using SQL views to create a clean analytical model.

Fact Table – marketing_table

Includes:

Customer spend across categories

Campaign acceptance flags

Discounts & visit activity

Recency score

Age & age grouping

Total purchase metrics

Calculated fields such as Total_spend, Campaign_Acceptance_Score, Recency_Segment

Dimensions
Behavioral_Segmentation

Segmentation based on:

Purchase channel (In-Store, Online, Catalog)

Discount sensitivity (High / Medium / Low)

Web engagement (High / Medium / Low)

Response Dimension

Categorizes customers by:

Campaign Acceptance Score

Response Category (High / Medium / Low / Non-Responsive)

Date Dimension

Supports Year, Quarter, Month, and time-series analysis.

SQL scripts for all transformations are included in the repository.

3. Data Model

A structured Star Schema was developed:

          Behavioral_Segmentation     Response
                    |                     |
                    |                     |
                    -------- Fact Table -------
                              |
                              |
                           Date DIM


This model enables clean, efficient filtering and multi-dimensional analysis.

4. DAX Measures

A complete DAX layer was created to support dashboard calculations, including:

Total Purchases

Total Purchases with Discount

Total Accepted Campaigns

Product-category spend KPIs

Income-based aggregations

Multi-year sales metrics

Campaign-specific acceptance rates

These measures form the backbone of the analytics and visual insights.

5. Dashboard & Insights

The Power BI dashboard delivers a comprehensive view of customer behavior and marketing performance.

Key Insights Identified

Highly engaged customers (10+ monthly web visits) showed the strongest campaign responsiveness and frequent cross-category purchases.

Customers aged 35–50 demonstrated the highest acceptance across multiple campaigns.

In-store buyers represented the most valuable customer group, while online buyers showed higher discount sensitivity.

Revenue was mainly driven by Meat, Gold, and Fruits categories.

At-risk and lost segments indicated clear opportunities for targeted reactivation campaigns.

6. Project Files

Create tables queries.sql – SQL transformations and view creation

marketing_project.pbix – Power BI data model and dashboard

README.md – Project documentation

7. Tools & Technologies

SQL – Data transformation & segmentation logic

Power BI – Modeling, DAX, visualization

Data Modeling – Star Schema architecture

DAX – Business KPIs & analytical measures

8. How to Use

Run the SQL scripts to generate the fact and dimension views.

Load the views into Power BI.

Refresh the model and explore the dashboards.

Customize the measures or add additional segmentation if needed.

9. Contact

For any questions or collaboration opportunities, feel free to reach out.
