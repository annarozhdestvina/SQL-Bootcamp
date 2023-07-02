select name
from (
   select name, 1 sort
   from person

   union all

   select pizza_name, 2 sort
   from menu
) a
order by a.sort, name