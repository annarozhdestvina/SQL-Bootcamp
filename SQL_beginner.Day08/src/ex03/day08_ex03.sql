
-- ПЕРЕДЕЛАТЬ
-- cons1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT *
FROM pizzeria;

SELECT *
FROM pizzeria;

COMMIT;

SELECT *
FROM pizzeria;



-- cons2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT *
FROM pizzeria;

UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';

SELECT *
FROM pizzeria;

COMMIT;

SELECT *
FROM pizzeria;