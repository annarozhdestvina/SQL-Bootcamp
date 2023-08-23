CREATE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS $$
    SELECT MIN($1[i]) FROM generate_subscripts($1, 1) G(i);
$$ LANGUAGE SQL;


--SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, -5.1, -9.8, 5.0, 4.4]);