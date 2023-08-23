select 
		menu.pizza_name as pizza_name
	  , pizzeria.name as pizzeria_name
	  , menu.price as price
from menu
join pizzeria on menu.pizzeria_id = pizzeria.id
where pizza_name in ('mushroom pizza', 'pepperoni pizza')
order by pizza_name, pizzeria_name