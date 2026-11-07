-- Share of orders delivered later than the estimated date (%), delivered orders only

SELECT 
	round(
    COUNT(*) FILTER (WHERE o.order_delivered_customer_date::date > 
                           o.order_estimated_delivery_date::date)::numeric 
    / COUNT(*) * 100, 2)
FROM public.olist_orders_dataset o
WHERE o.order_status NOT IN('unavailable', 'created', 'canceled')
  AND o.order_delivered_customer_date IS NOT NULL;
