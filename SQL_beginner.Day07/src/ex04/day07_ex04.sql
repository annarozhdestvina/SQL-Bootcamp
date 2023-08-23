SELECT person.name, COUNT(person_visits.person_id) AS count_of_visits 
FROM person_visits
JOIN person ON person.id = person_visits.person_id
GROUP BY person.name
having count(person_visits.person_id) > 3
order by count_of_visits DESC, person.name