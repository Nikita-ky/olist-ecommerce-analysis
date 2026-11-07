-- Number of orders and revenue (payments) per month, excluding unavailable, created and canceled orders

SELECT TO_CHAR(o.order_approved_at::date, 'YYYY-MM') AS purchase_month,
COUNT(DISTINCT o.order_id) AS total_orders,
SUM(p.payment_value)::int AS total_revenue

FROM olist_orders_dataset o 
join olist_order_payments_dataset p ON o.order_id = p.order_id
WHERE o.order_status NOT IN ('unavailable', 'created', 'canceled')
group by TO_CHAR(o.order_approved_at::date, 'YYYY-MM')

ORDER BY purchase_month;

