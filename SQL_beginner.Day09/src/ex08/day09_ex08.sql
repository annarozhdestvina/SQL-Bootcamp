CREATE OR REPLACE FUNCTION fnc_fibonacci (IN pstop INTEGER default 10) 
RETURNS table (pstop integer) LANGUAGE SQL AS $$
WITH RECURSIVE t(a, b) AS (
    VALUES(0,1)
    UNION ALL
        SELECT GREATEST(a, b), a + b AS a from t
        WHERE b < pstop
)
SELECT a FROM t;
$$;


select * from fnc_fibonacci(200);
select * from fnc_fibonacci();