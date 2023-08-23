select pizzeria.name, COUNT(person_order.person_id) as count_of_orders,
						ROUND(AVG(menu.price), 2) as average_price,
						MAX(menu.price) as max_price,
						MIN(menu.price) as min_price
						from person_order
join menu on menu.id = person_order.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
order by pizzeria.name