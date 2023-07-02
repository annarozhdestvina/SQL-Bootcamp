SELECT order_date, Concat (person.name, ' (age:', person.age, ')') 
AS person_information from person_order
NATURAL JOIN
person