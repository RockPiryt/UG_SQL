-- ZAŁOŻENIE: nie ma problemów w integralnością referencyjną
-- tzn. klucze obce mają dodane ON DELETE CASCADE
-- albo usuwamy elementy nie będące adresatem klucza obcego

-- usuń z tabeli towarów wszelkie donice, ale tylko jeśli nie są 
-- zamawiane (innych nie da się usunąć mając zamówienia)
DELETE FROM towar
  WHERE opis LIKE 'donica%' AND nr NOT IN (
    SELECT towar_nr FROM pozycja
    )
;

-- usuń towary niezamawiane
DELETE FROM towar
  WHERE nr NOT IN (
    SELECT towar_nr FROM pozycja
    )
;

-- usuń towary o nieznanej cenie
-- (przedtem być może warto usunąć wszelkie pozycje faktur
--  DELETE from pozycja;)
DELETE FROM towar
  WHERE cena IS NULL
;

-- zad 15: usuń klientów z Sopotu,
DELETE FROM zamowienie WHERE klient_nr=15 -- usunięcie relacji
DELETE FROM klient
  WHERE miasto='Sopot'-- usunięcie klientów


-- usuń klientów, których telefonu nie znamy

DELETE from klient WHERE klient.nr IN
  (SELECT kl.nr
  FROM klient AS kl
  WHERE kl.telefon IS NULL)


-- usuń kody kreskowe nie odpowiadające żadnym towarom
-- usuń klientów, którzy nie złożyli żadnego zamówienia
-- usuń zamówienie, które nie posiada pozycji
-- usuń towary nie posiadające kodu kreskowego


----------------PROCEDURA zmiany ON CASADE
https://stackoverflow.com/questions/14182079/delete-rows-with-foreign-key-in-postgresql



ERROR: update or delete on table "osoby" violates 
foreign key constraint "kontakty_ibfk_1" on table "kontakty" 
DETAIL: Key (id_osoby)=(1) is still referenced from table "kontakty".



SELECT pg_get_constraintdef(oid) AS constraint_def
FROM   pg_constraint
WHERE  conrelid = 'public.kontakty'::regclass  -- assuming public schema
AND    conname = 'kontakty_ibfk_1';


ALTER TABLE kontakty
   DROP CONSTRAINT kontakty_ibfk_1
 , ADD  CONSTRAINT kontakty_ibfk_1
   FOREIGN KEY (id_osoby) REFERENCES osoby (id_osoby) ON DELETE CASCADE;
