-- użycie różnych warunków, IS NOT NULL, dopasowanie wzorców tekstowych, warunki dotyczące dat:
-- wyświetl klientów z Sopotu,
SELECT * FROM klient WHERE miasto='Sopot'
;
-- towary z podaną ceną,
SELECT * FROM towar WHERE cena IS NOT NULL
;
-- dane o donicach
SELECT * FROM towar WHERE opis LIKE '%donica%'
;
-- zamówienia złożone w marcu 2021
SELECT * FROM zamowienie WHERE data_zlozenia BETWEEN '2021/03/01' AND '2021/03/31'
;
-- wyświetl dane o zysku dla towarów, ale tylko wtedy, gdy zysk da się określić
SELECT *,cena-koszt AS zysk FROM towar WHERE cena is NOT NULL
;

-- zad P4: wyświetl w kolejnych zapytaniach:
-- dane klientów spoza Gdańska,
SELECT 
* 
FROM klient 
WHERE miasto!='Gdańsk'
;
-- klientów, których telefonu nie znamy
SELECT 
* 
FROM klient 
WHERE telefon is NULL
   

-- klientów spoza Gdańska, których telefonu nie znamy,
SELECT 
* 
FROM klient 
WHERE telefon is NULL AND miasto!='Gdańsk'
-- dane o układankach,
SELECT 
* 
FROM towar 
WHERE opis LIKE '%układanka%'
;
-- zamówienia niezrealizowane (bez daty wysyłki),
SELECT * 
FROM zamowienie 
WHERE data_wysylki IS NULL;
-- zrealizowane w lutym 2021,
SELECT 
 * 
FROM zamowienie 
WHERE data_wysylki IS NOT NULL and (data_wysylki BETWEEN '2021-02-01' AND '2021-02-28');
-- wyświetl dane o czasie realizacji zamówień już zrealizowanych----------------
SELECT 
 * 
 ,(data_zlozenia-data_wysylki) As czas_realizacji
FROM zamowienie 
WHERE data_wysylki IS NOT NULL;
