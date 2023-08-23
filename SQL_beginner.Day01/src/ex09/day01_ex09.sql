SELECT name from pizzeria
WHERE pizzeria.id NOT IN (SELECT pizzeria_id from person_visits)

--SELECT name from pizzeria
--WHERE NOT EXISTS (SELECT pizzeria_id from person_visits
			--WHERE pizzeria_id = pizzeria.id)