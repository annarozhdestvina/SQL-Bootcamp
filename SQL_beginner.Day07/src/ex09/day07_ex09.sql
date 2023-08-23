select 
  person.address, 
  (select round(max(age) - cast(min(age) as numeric)/max(age), 2)) as formula,
    round(avg(age), 2) as average,
    case
    when (select round(max(age) - cast(min(age) as numeric)/max(age), 2)) > round(avg(age), 2) then 'true'
    else 'false'
  end
from person
group by person.address
order by address