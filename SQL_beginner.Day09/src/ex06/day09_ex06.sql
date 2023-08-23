create or replace function fnc_person_visits_and_eats_on_date (in pperson varchar default 'Dmitriy', 
													in pprice integer default 500,
												    in pdate date default '2022-01-08')
returns table (pizzeria_name varchar) as $$

begin
return query
	select pizzeria.name from pizzeria  
	join menu on menu.pizzeria_id = pizzeria.id 
	join person_order on menu.id = person_order.menu_id
	join person on person_order.person_id = person.id
	where menu.price < pprice and person_order.order_date = pdate and person.name = pperson;
end;
$$ LANGUAGE plpgsql;


-- select *
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);