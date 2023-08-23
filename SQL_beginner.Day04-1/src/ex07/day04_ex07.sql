insert into person_visits (id, person_id, pizzeria_id, visit_date)
values (  
  (select max(person_visits.id) from person_visits) + 1,
  (select person.id from person where person.name = 'Dmitriy'),  
  (select menu.pizzeria_id from menu where price < 800 limit 1),
  '2022-01-08' 
);

insert into person_order (id, person_id, menu_id, order_date)
values (
  (select max(person_order.id) from person_order) + 1,  
  (select person.id from person where person.name = 'Dmitriy'),
  (select menu.id from menu where price < 800 limit 1),
  '2022-01-08'
 ); 

refresh materialized view mv_dmitriy_visits_and_eats;

select * from  mv_dmitriy_visits_and_eats;