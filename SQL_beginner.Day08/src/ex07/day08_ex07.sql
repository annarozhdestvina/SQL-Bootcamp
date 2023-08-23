
-- cons1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- cons2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- cons1
UPDATE pizzeria
SET rating = 5.0
WHERE id = 1;

-- cons2
UPDATE pizzeria
SET rating = 5.0
WHERE id = 2;

-- cons1
UPDATE pizzeria
SET rating = 5.0
WHERE id = 2;

-- cons2
UPDATE pizzeria
SET rating = 5.0
WHERE id = 1;

-- cons1
COMMIT;
-- cons2
COMMIT;



