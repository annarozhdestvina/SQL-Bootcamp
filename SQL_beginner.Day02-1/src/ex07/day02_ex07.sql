
select pizzeria.name from pizzeria
join person_visits on (pizzeria.id = person_visits.pizzeria_id)
join person on (person.id = person_visits.person_id)
join menu on (pizzeria.id = menu.pizzeria_id)
where person.name = 'Dmitriy' and menu.price < 800 and person_visits.visit_date = '2022-01-08'

