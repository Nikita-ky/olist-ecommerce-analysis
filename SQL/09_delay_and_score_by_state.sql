-- Average review score and share of delayed orders by customer state, highest delay share first
SELECT 
    c.customer_state,
    ROUND(AVG(r.review_score::numeric), 2) AS avg_review_score,
    COUNT(o.order_id) AS total_orders,
    -- Share of delayed orders (%)
    ROUND(
        COUNT(*) FILTER (WHERE o.order_delivered_customer_date::date > o.order_estimated_delivery_date::date)::numeric 
        / COUNT(o.order_id) * 100, 2
    ) AS delayed_percentage
FROM public.olist_customers_dataset c
JOIN public.olist_orders_dataset o ON c.customer_id = o.customer_id
JOIN public.olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL 
  AND o.order_estimated_delivery_date IS NOT NULL
  AND r.review_score IS NOT NULL
GROUP BY c.customer_state
ORDER BY delayed_percentage DESC;