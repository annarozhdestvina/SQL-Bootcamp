select ROUND(AVG(pizzeria.rating), 4) as global_rating, 
		pizzeria.name from pizzeria