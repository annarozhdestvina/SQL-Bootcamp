select person.name from person
join person_order on (person.id = person_order.person_id)
join menu on (menu.id = person_order.menu_id)
where person.gender = 'male' and 
    (person.address = 'Moscow' or person.address = 'Samara') and 
    (menu.pizza_name = 'pepperoni pizza' or menu.pizza_name = 'mushroom pizza')
order by person.name desc