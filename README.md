# Olist E-commerce: Why Do Customers Leave Low Reviews?

## The problem

Olist is a Brazilian online marketplace. Most customers are happy (average review score **4.08 / 5**), but a group of orders gets 1–2 star reviews, and low ratings hurt sellers and the platform.

**Business question:** What drives low review scores, and what can the business do to reduce the share of unhappy customers?

## Answer in short

**Late delivery is the clearest driver of low ratings.**

| Delivery | Orders | Share of 1–2 star reviews |
|---|---|---|
| On time or early | 92,901 | **11.5%** |
| Late by 1–10 days | 4,371 | 54.8% |
| Late by 11–19 days | 1,183 | 79.7% |
| Late by 20+ days | 769 | 76.7% |

Average review score: **4.29** for orders delivered on time, **2.57** for late orders.

Only about **6.4%** of orders arrive late, but they produce a large part of the bad reviews. The share of late orders differs a lot between states (roughly 3% to 21%), and the states with the most delays also tend to have lower scores.

## Dashboards

**[View on Tableau Public](https://public.tableau.com/views/Olist_Dashboards_17940910222640/Dashboard1)** (two tabs)

- **Dashboard 1: Sales and satisfaction overview.** Orders and revenue over time, average review score, share of delayed orders.
- **Dashboard 2: Drivers of low review scores.** Ratings for on-time vs late orders, share of 1–2 star reviews by delay length, delays and scores by state, ten lowest-rated product categories.

![Dashboard 1](Dashboards/Dashboard%201.png)
![Dashboard 2](Dashboards/Dashboard%202.png)

## Key findings

1. **Delivery punctuality has a large effect on satisfaction.** On-time orders average 4.29, late orders 2.57, a gap of about 1.7 points.
2. **Longer delays mean more unhappy customers.** 1–2 star reviews make up 11% of on-time orders, 55% of orders late by 1–10 days and roughly 77–80% of orders late by more than 10 days.
3. **Delays are concentrated in specific states.** Alagoas (AL) has the highest share of late orders (about 21%), followed by Maranhão (MA). Average scores differ much less between states (about 3.8 to 4.3) but are generally lower where delays are more common.
4. **Lowest-rated categories** include office furniture (3.49), male fashion (3.64) and fixed telephony (3.68). Furniture and home categories are over-represented in the bottom ten.

## Recommendations (hypotheses to test)

1. Review carrier performance and delivery estimates in high-delay states such as AL and MA.
2. Set more realistic estimated delivery dates for bulky categories such as furniture.
3. Contact customers whose orders are already late, before they leave a review.

## Approach

1. Loaded the 9 Olist CSV files into **PostgreSQL** and explored the data with SQL.
2. Checked data quality: missing delivery dates by order status and orders with more than one review.
3. Calculated delivery time, share of late orders and review scores for on-time vs late orders.
4. Built a relational model in **Tableau Public** (orders, order items, reviews, customers, products, payments, sellers) and compared its totals with the SQL results.
5. Analyzed ratings by delay length, state and product category.

## SQL queries

| File | What it does |
|---|---|
| `01_orders_revenue_by_month.sql` | Orders and revenue per month |
| `02_review_score_distribution.sql` | Distribution of review scores 1–5 |
| `03_median_delivery_time.sql` | Median delivery time in days |
| `04_avg_score_on_time_vs_late.sql` | Average score for on-time vs late orders |
| `05_late_delivery_share.sql` | Share of orders delivered after the estimated date |
| `06_check_null_dates.sql` | Data check: missing delivery dates by order status |
| `07_check_duplicate_reviews.sql` | Data check: orders with more than one review |
| `08_avg_score_by_category.sql` | Average score by product category (100+ orders) |
| `09_delay_and_score_by_state.sql` | Average score and share of late orders by state |

## Limitations

- **Correlation, not proof of causation.** Late delivery and low scores move together, but other factors (product quality, price, seller) are not controlled for.
- **Small states have few orders**, so their averages are less reliable.
- **The last month of the dataset is incomplete**, so the drop at the end of the time charts is not a real decline in sales.

## Data and tools

- **Data:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (Kaggle), about 99,000 orders from 2016–2018.
- **Tools:** PostgreSQL, Tableau Public.

## Repository structure

```
├── README.md
├── sql/            # analysis queries
└── Dashboards/     # dashboard images
```
