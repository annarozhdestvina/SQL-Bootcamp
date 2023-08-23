-- select pizza_name, pizzeria.name as pizzeria_name from menu
-- join
-- pizzeria on (pizzeria.id = menu.pizzeria_id);

-- explain(costs off) select * from pizzeria where rating = 3.2;


set enable_seqscan =off;
 explain analyze  select pizza_name, pizzeria.name as pizzeria_name from menu
join
pizzeria on (pizzeria.id = menu.pizzeria_id);