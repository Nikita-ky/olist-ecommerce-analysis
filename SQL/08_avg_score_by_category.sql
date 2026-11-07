-- Average review score by product category (categories with more than 100 orders), lowest first
SELECT pcnt.product_category_name_english, 
    ROUND(AVG(r.review_score::numeric), 2) AS avg_review_score,
    COUNT(DISTINCT i.order_id) AS total_orders
FROM public.olist_products_dataset p
JOIN public.olist_order_items_dataset i ON p.product_id = i.product_id
JOIN public.olist_order_reviews_dataset r ON i.order_id = r.order_id
JOIN public.product_category_name_translation pcnt on p.product_category_name = pcnt.product_category_name
WHERE p.product_category_name IS NOT NULL
GROUP BY pcnt.product_category_name_english
HAVING COUNT(DISTINCT i.order_id) > 100
ORDER BY avg_review_score ASC;