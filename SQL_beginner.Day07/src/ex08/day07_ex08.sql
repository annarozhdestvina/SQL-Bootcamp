select person.address, pizzeria.name, 
			COUNT(person_order.person_id) as count_of_orders
from pizzeria
join menu on pizzeria.id = menu.pizzeria_id
join  person_order on menu.id = person_order.menu_id
join person on person.id = person_order.person_id
group by person.address, pizzeria.name
order by address, name