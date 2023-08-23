insert into person_visits (id, person_id, pizzeria_id, visit_date)  
 values ((select MAX(person_visits.id) from person_visits)+1,
		 (select person.id from person
					where person.name = 'Denis'),
		 (select pizzeria.id from pizzeria
					where pizzeria.name = 'Dominos'), 
		 '2022-02-24');

insert into person_visits (id, person_id, pizzeria_id, visit_date)  
 values ((select MAX(person_visits.id) from person_visits)+1,
		 (select person.id from person
					where person.name = 'Irina'),
		 (select pizzeria.id from pizzeria
					where pizzeria.name = 'Dominos'), 
		 '2022-02-24');
		 