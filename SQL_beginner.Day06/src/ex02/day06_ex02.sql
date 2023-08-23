select person.name, 
    pizza_name, 
    price, 
    round(menu.price - menu.price * person_discounts.discount / 100) AS discount_price, 
    pizzeria.name from person
join person_discounts on person.id = person_discounts.person_id
join menu on menu.pizzeria_id = person_discounts.pizzeria_id
join pizzeria on menu.pizzeria_id = pizzeria.id
join person_order on menu.id = person_order.menu_id
where person_order.person_id = person.id
order by person.name, pizza_name