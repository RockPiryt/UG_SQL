-- złączenia:
-- sprawdź numery zamówień klientów
SELECT imie, nazwisko, zamowienie.nr AS zamowienie_nr 
   FROM klient, zamowienie
   WHERE klient.nr=zamowienie.klient_nr
   ORDER BY nazwisko
;
-- zmień dalsze zapytania używając INNER JOIN
SELECT imie, nazwisko, zamowienie.nr AS zamowienie_nr
   FROM klient INNER JOIN zamowienie 
   ON klient.nr=zamowienie.klient_nr
   ORDER BY nazwisko
;
--mój układ czytelny
/*SELECT 
  imie, nazwisko
  , zamowienie.nr AS zamowienie_nr
FROM klient 
INNER JOIN zamowienie ON klient.nr=zamowienie.klient_nr
ORDER BY nazwisko;*/

-- sprawdź jacy klienci w ogóle złożyli zamówienia
SELECT imie, nazwisko
   FROM klient, zamowienie
   WHERE klient.nr=zamowienie.klient_nr
   ORDER BY nazwisko
;

-- zad P5: zmień powyższe zapytanie używając INNER JOIN
SELECT 
	kl.imie, kl.nazwisko
FROM klient AS kl
INNER JOIN zamowienie AS z ON z.klient_nr=kl.nr
ORDER BY nazwisko
;
-- wypisz towary wraz z numerami zamówień
SELECT 
	tw.opis
    ,zam.nr AS numer_zamówienia
from towar as tw
INNER JOIN zamowienie as zam ON zam.nr = tw.nr
;
-- sprawdź jakie towary były w ogóle zamawiane
SELECT 
	tw.opis
from towar as tw, zamowienie as zam
WHERE tw.nr=zam.nr
ORDER BY zam.nr
;
-- użyj obu wersji zapytania