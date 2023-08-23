(select pizzeria.name, count(menu.pizzeria_id) as count, 'order' as action_type
from pizzeria
join menu on menu.pizzeria_id = pizzeria.id
join person_order on person_order.menu_id = menu.id
group by pizzeria.name
limit 3)

union

(select pizzeria.name, count(person_visits.pizzeria_id) as count, 'visit' as action_type
from pizzeria
join person_visits on person_visits.pizzeria_id = pizzeria.id
group by pizzeria.name
limit 3)

order by action_type, count desc