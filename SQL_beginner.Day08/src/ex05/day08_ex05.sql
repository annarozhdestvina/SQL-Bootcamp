
-- cons1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- cons2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- cons1
SELECT sum(rating) as sum_rating
FROM pizzeria;
-- cons2
SELECT sum(rating) as sum_rating
FROM pizzeria;

-- cons2
UPDATE pizzeria
SET rating = 1.0
WHERE name = 'Pizza Hut';

-- cons1
SELECT sum(rating) as sum_rating
FROM pizzeria;
-- cons2
SELECT sum(rating) as sum_rating
FROM pizzeria;

-- cons2
COMMIT;

-- cons1
SELECT sum(rating) as sum_rating
FROM pizzeria;

-- cons1
COMMIT;

-- cons1
SELECT sum(rating) as sum_rating
FROM pizzeria;
-- cons2
SELECT sum(rating) as sum_rating
FROM pizzeria;





