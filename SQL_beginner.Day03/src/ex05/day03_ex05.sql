with all_pizzerias
as(select distinct pizzeria.name as pizzeria_name from pizzeria
  join person_visits on
  person_visits.pizzeria_id = pizzeria.id
  join person on person.id = person_visits.person_id
  	where person.name = 'Andrey'),
	
	where_ordered 
	as (select distinct pizzeria.name from menu
  join person_order on
  person_order.menu_id = menu.id
  join person on person.id = person_order.person_id
		join pizzeria on pizzeria.id = menu.pizzeria_id
  	where person.name = 'Andrey')
	
	Select * from all_pizzerias
	except
	select* from where_ordered
	order by 1;