ALTER table person_discounts
add constraint ch_nn_person_id CHECK (person_id is not NULL);

ALTER table person_discounts
add constraint ch_nn_pizzeria_id CHECK (pizzeria_id is not NULL);

ALTER table person_discounts
add constraint ch_nn_discount CHECK (discount is not NULL);
--that's right
ALTER table person_discounts
alter discount set DEFAULT 0;

ALTER table person_discounts
add constraint ch_range_discount CHECK (discount >= 0 and discount <= 100);