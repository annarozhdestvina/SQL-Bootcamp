select
  a.name as person_name1, 
  b.name as person_name2,
  a.address as common_address
from person a 
join person b on a.address = b.address and a.name < b.name
order by person_name1, person_name2, common_address