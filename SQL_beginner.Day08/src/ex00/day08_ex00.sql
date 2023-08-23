-- Session #1
BEGIN; 

select * from pizzeria where name = 'Pizza Hut'; --before update

update pizzeria
set rating = 5 where name = 'Pizza Hut';
select * from pizzeria where name = 'Pizza Hut'; -- after update

--Session #2
BEGIN;

select * from pizzeria where name = 'Pizza Hut'; --cant see changes;

-- Session #1
commit;         --publish your changes 
select * from pizzeria where name = 'Pizza Hut';

-- Session #2
commit;
select * from pizzeria where name = 'Pizza Hut'; -- see changes
