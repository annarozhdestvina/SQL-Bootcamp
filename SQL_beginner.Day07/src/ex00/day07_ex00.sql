select person_visits.person_id, count(person_visits.person_id) as count_of_visits 
from person_visits
group by person_visits.person_id
order by count_of_visits desc, person_visits.person_id