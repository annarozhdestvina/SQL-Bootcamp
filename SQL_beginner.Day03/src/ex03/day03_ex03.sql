with cte_table as (select person.name as person_name, person.gender as gender, person_visits.visit_date as visit_date, pizzeria.name as pizzeria_name from person
join person_visits on person_visits.person_id = person.id
join pizzeria on pizzeria.id = person_visits.pizzeria_id)

select females.pizzeria_name from

(select count(cte_table.gender), cte_table.pizzeria_name from cte_table
where cte_table.gender = 'female'
group by cte_table.pizzeria_name) as females
join
(select count(cte_table.gender), cte_table.pizzeria_name from cte_table
where cte_table.gender = 'male'
group by cte_table.pizzeria_name) as males
on females.pizzeria_name = males.pizzeria_name and females.count != males.count

order by females.pizzeria_name