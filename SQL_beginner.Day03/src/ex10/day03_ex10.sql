 insert into person_order (id, person_id, menu_id, order_date)  
 values ((select MAX(person_order.id) from person_order)+1,
		 (select person.id from person
					where person.name = 'Denis'),
		 (select menu.id from menu
					where menu.pizza_name = 'sicilian pizza'),
		 '2022-02-24');

insert into person_order (id, person_id, menu_id, order_date)  
 values ((select MAX(person_order.id) from person_order)+1,
		 (select person.id from person
					where person.name = 'Irina'),
		 (select menu.id from menu
					where menu.pizza_name = 'sicilian pizza'),
		 '2022-02-24');