select counters.name, sum(count_order_or_visit) as total_count from (
(select pizzeria.name, count(menu.pizzeria_id) as count_order_or_visit, 'order' as action_type
from pizzeria
join menu on menu.pizzeria_id = pizzeria.id
join person_order on person_order.menu_id = menu.id
group by pizzeria.name)

union

(select pizzeria.name, count(person_visits.pizzeria_id) as count_order_or_visit, 'visit' as action_type
from pizzeria
join person_visits on person_visits.pizzeria_id = pizzeria.id
group by pizzeria.name) 
) as counters

group by counters.name
order by total_count desc, counters.name;