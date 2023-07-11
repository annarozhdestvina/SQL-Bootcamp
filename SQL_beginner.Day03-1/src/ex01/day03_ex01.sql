select menu.id from menu
where menu.id not in (select person_order.menu_id from person_order)
order by menu.id