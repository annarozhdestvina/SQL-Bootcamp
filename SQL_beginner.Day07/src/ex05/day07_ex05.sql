select distinct person.name from person
inner join person_order on person_order.person_id = person.id
order by name