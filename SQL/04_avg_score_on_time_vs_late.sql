-- Average review score for on-time vs late orders (orders JOIN order_reviews)


SELECT 
	round(
    AVG(r.review_score) FILTER (WHERE o.order_delivered_customer_date::date <=
                           o.order_estimated_delivery_date::date), 2)  as at_time,
	round(
	AVG(r.review_score) FILTER (WHERE o.order_delivered_customer_date::date > 
                           o.order_estimated_delivery_date::date) , 2)as expired

	
FROM public.olist_orders_dataset o
JOIN public.olist_order_reviews_dataset r ON o.order_id = r.order_id


  
