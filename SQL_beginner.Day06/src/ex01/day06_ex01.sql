insert into person_discounts(id, person_id, pizzeria_id, discount)
select (select count(id) from person_discounts) + ROW_NUMBER() OVER () AS id,
        person_order.person_id as person_id,
        menu.pizzeria_id       as pizzeria_id,
        (CASE COUNT(order_date)
            WHEN 1 THEN 10.5
            WHEN 2 THEN 22
            ELSE 30
            END     ) AS discount
    from person_order
        JOIN menu ON person_order.menu_id = menu.id
GROUP BY person_id, pizzeria_id