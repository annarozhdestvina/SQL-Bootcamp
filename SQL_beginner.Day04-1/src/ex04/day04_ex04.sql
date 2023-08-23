create view v_symmetric_union as

    with cte_joined as 
    (select person.name as name, person.id as person_id, person_visits.visit_date as visit_date from person
    join person_visits on person.id = person_visits.person_id),

    cte_R as
    (select * from cte_joined
    where cte_joined.visit_date = '2022-01-02'),

    cte_S as
    (select * from cte_joined
    where cte_joined.visit_date = '2022-01-06'), 

    cte_R_S as 
    (select cte_R.person_id from cte_R
    except
    select cte_S.person_id from cte_S),

    cte_S_R as 
    (select cte_S.person_id from cte_S
    except
    select cte_R.person_id from cte_R)

select * from cte_R_S
union
select * from cte_S_R

order by person_id;

select * from v_symmetric_union