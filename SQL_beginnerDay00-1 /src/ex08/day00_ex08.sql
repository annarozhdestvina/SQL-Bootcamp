SELECT * FROM person_order
WHERE mod(id,2) = 0
ORDER BY person_id;