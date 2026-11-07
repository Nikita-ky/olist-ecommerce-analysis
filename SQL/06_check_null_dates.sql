-- Data quality check: orders with no delivery date, by order status
SELECT order_status,
COUNT(*) AS total,
COUNT(*) FILTER (WHERE order_delivered_customer_date IS NULL) AS no_delivery_date
FROM public.olist_orders_dataset
GROUP BY order_status;