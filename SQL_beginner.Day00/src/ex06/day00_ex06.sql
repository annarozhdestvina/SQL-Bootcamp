SELECT temp_table.name, 
	CASE 
	WHEN name = 'Denis' THEN 'true'
	ELSE 'false'
	END
	AS check_name
FROM
	
(SELECT name 
FROM person
WHERE id =
	(SELECT person_id FROM person_order
	WHERE menu_id = 13 AND order_date = '2022-01-07') OR 
	id = 
	(SELECT person_id FROM person_order
	WHERE menu_id = 14 AND order_date = '2022-01-07') OR
	id =
	(SELECT person_id FROM person_order
	WHERE menu_id = 18 AND order_date = '2022-01-07')) temp_table