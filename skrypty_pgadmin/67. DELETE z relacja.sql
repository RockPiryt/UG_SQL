--SELECT * FROM actor WHERE actor_id=15
DELETE FROM actor WHERE actor_id=15 --- usuwam aktora

/*ERROR:  Klucz (actor_id)=(15) ma wciąż odwołanie w tabeli "film_actor".modyfikacja 
	lub usunięcie na tabeli "actor" 
	narusza klucz obcy "film_actor_actor_id_fkey" tabeli "film_actor" */


----Podejrzenie obecnych ustawień
/*
SELECT pg_get_constraintdef(oid) AS constraint_def
FROM   pg_constraint
WHERE  conrelid = 'public.film_actor'::regclass  -- assuming public schema
AND    conname = 'film_actor_actor_id_fkey';*/

---Zmiana ustawien dla foreign_key
/*
ALTER TABLE film_actor
   DROP CONSTRAINT film_actor_actor_id_fkey
 , ADD  CONSTRAINT film_actor_actor_id_fkey
   FOREIGN KEY (actor_id) REFERENCES actor (actor_id) ON DELETE CASCADE;*/