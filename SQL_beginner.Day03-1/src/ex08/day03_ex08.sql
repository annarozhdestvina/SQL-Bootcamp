 insert into menu (id, pizzeria_id, pizza_name, price)  
 values ((select MAX(menu.id) from menu)+1,
		 (select pizzeria.id from pizzeria
					where pizzeria.name = 'Dominos'), 
		 'sicilian pizza', 
		 900);