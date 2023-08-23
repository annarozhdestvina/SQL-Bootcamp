with menu_cte as 
(select * from menu
where menu.id not in (select person_order.menu_id from person_order)
order by menu.id)

select menu_cte.pizza_name, menu_cte.price, pizzeria.name from menu_cte
join pizzeria on menu_cte.pizzeria_id = pizzeria.id
order by menu_cte.pizza_name, menu_cte.price