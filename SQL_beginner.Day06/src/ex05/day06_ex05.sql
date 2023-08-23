--Creation of table person_discounts where 
create table person_discounts
( 
    id bigint primary key,          -- id of our table
    person_id bigint not null ,     -- to do personal discounts
    pizzeria_id bigint not null,    -- for every pizzeria in town
    constraint fk_person_discounts_person_id foreign key  (person_id) references person(id),        --corresponds to person_id 
    constraint fk_person_discounts_pizzeria_id foreign key  (pizzeria_id) references pizzeria(id),  --corresponds to pizzeria_id
    discount numeric not null default 0  -- discount for every person 
);