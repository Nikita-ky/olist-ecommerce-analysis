-- Distribution of review scores (how many reviews with 1, 2, 3, 4, 5)

select review_score, COUNT(*) as amount_of_rates


from public.olist_orders_dataset o 
join public.olist_order_reviews_dataset p ON o.order_id = p.order_id

Group by review_score

