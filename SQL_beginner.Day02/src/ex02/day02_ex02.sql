SELECT 
    CASE 
        WHEN person.name is null 
        THEN '-' ELSE person.name END  
    AS person_name
     , person_visits_new.visit_date AS visit_date
	 , 
    CASE 
        WHEN pizzeria.name is null 
        THEN '-' ELSE pizzeria.name END 
        AS pizzeria_name

  FROM 
    (SELECT * FROM person_visits 
        WHERE person_visits.visit_date 
        BETWEEN '2022-01-01' AND '2022-01-03') 
        AS person_visits_new
        
FULL JOIN person ON person.id = person_visits_new.person_id 
FULL JOIN pizzeria ON person_visits_new.pizzeria_id = pizzeria.id
  ORDER BY person_name, visit_date, pizzeria_name