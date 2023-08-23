with cte as
(select 
  menu.pizza_name as pizza_name
  , menu.price as price
  , pizzeria.name as pizzeria_name
  , person_order.order_date as visit_date
  , person.name as name
from pizzeria
join menu on pizzeria.id = menu.pizzeria_id
join person_order on person_order.menu_id = menu.id
join person on person_order.person_id = person.id)

select pizza_name, price, pizzeria_name, visit_date from cte
where cte.name = 'Kate'

union

select pizza_name, price, pizzeria_name, visit_date from cte
where cte.price between 800 and 1000

order by pizza_name, price, pizzeria_name