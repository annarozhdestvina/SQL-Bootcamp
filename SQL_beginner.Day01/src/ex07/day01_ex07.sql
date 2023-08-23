SELECT order_date, Concat (person.name, ' (age:', person.age, ')') 
AS person_information from person_order
JOin person on (person_order.person_id = person.id)
ORDER BY order_date, person_information