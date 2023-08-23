with cte_table as (select person.name as person_name, person.gender as gender, person_visits.visit_date as visit_date, pizzeria.name as pizzeria_name from person
join person_visits on person_visits.person_id = person.id
join pizzeria on pizzeria.id = person_visits.pizzeria_id)

select pizzeria_name from cte_table where gender = 'female'

union

select pizzeria_name from cte_table where gender = 'male'

order by pizzeria_name