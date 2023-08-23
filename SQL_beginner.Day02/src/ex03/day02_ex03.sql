WITH TABLE_CTE AS (SELECT day::date AS missing_date
 				FROM GENERATE_SERIES(timestamp '2022-01-01', '2022-01-10', '1 day') AS day)
SELECT missing_date from TABLE_CTE
LEFT JOIN  
(SELECT visit_date from person_visits
where person_id = 1 OR person_id = 2) q2
ON missing_date = q2.visit_date
WHERE visit_date IS NULL
ORDER BY missing_date;