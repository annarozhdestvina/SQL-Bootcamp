select name from 
(select person.name, menu.pizza_name from person
join person_order on person.id = person_order.person_id
join menu on menu.id = person_order.menu_id
where menu.pizza_name = 'pepperoni pizza' and person.gender = 'female') as pv1

intersect 

select name from
(select person.name, menu.pizza_name from person
join person_order on person.id = person_order.person_id
join menu on menu.id = person_order.menu_id
where menu.pizza_name = 'cheese pizza' and person.gender = 'female') as pv2

order by name 