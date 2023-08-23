SELECT id AS object_id, pizza_name AS object_name
	FROM menu
UNION
SELECT id, person.name
FROM person
ORDER BY object_id, object_name