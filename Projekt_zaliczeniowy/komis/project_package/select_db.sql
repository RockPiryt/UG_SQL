   /* • Obecność złączenia, zarówno w składni ze słowami INNER JOIN jak i bez niej.
    • Użycie grupowania i funkcji agregujących.
    • Wyświetlanie wyniku operacji np. operacji arytmetycznych na liczbach czy na datach.
    • Warunki odwołujące się do wzorców napisów (np. opisy wszystkich układanek, LIKE 'układanka%').
    • Użycie zagnieżdżenia w obu odmianach, nieskorelowane i skorelowane.
    • Sprawdzanie warunku NULL.
    • Zapytania negatywne, np. klienci bez złożonych zamówień. Co najmniej w dwu wersjach.*/


--------------WYMAGANIE-------------- Użycie zagnieżdżenia w obu odmianach, nieskorelowane i skorelowane.
-- Pokaż wszystkie samochody, które pochodzą z Niemiec
SELECT 
    dos.kraj_pochodzenia,
    s.*
FROM samochod as s 
JOIN dostawa as dos ON dos.id_samochod=s.id_samochod
WHERE s.id_samochod IN (SELECT d.id_samochod FROM dostawa AS d WHERE kraj_pochodzenia = 'Polska')

--------------WYMAGANIE-------------- Warunki odwołujące się do wzorców napisów (np. opisy wszystkich układanek, LIKE 'układanka%').
-- wyświetl samochody zarejestrowane w Poznania
SELECT * FROM samochod WHERE nr_rejestracyjny LIKE'PO%';
-- wyświetl samochody zarejestrowane w Poznania
SELECT * FROM samochod WHERE model LIKE '%4x4%';

--------------WYMAGANIE-------------- Użycie zagnieżdżenia w obu odmianach, nieskorelowane i skorelowane.
--Wyświetlić samochodu na placu nr 1 które maja diesla



--------------WYMAGANIE---------------INNER JOIN+grupowanie+funkcja aggregująca count
-- Pokaż informacje o sprzedawcy, który sprzedał najwięcej samochodów, 
--możemy zsumować ilość sprzedanych samochodów dla każdego sprzedawcy i posortować wyniki malejąco.
SELECT s.id_sprzedawca, s.imie, s.nazwisko, COUNT(k.id_samochod) AS liczba_sprzedanych_samochodow
FROM sprzedawca s
JOIN kartoteka_zlecen k ON s.id_sprzedawca = k.id_sprzedawca
GROUP BY s.id_sprzedawca, s.imie, s.nazwisko
ORDER BY liczba_sprzedanych_samochodow DESC
LIMIT 1;

--------------WYMAGANIE-----------------Sprawdzanie warunku NULL.
--pokaż klientów którzy nie dostali żadnego rabatu - rabat=NULL
-- Pokaż średnią wartość rabatu udzielanego klientom
SELECT AVG(rabat) AS sredni_rabat
FROM faktura;


--------------WYMAGANIE-----------------Wyświetlanie wyniku  operacji arytmetycznych 
--  Pokaż średnią cenę sprzedaży samochodów - przeliczyć walute najpierw
--• Wyświetlanie wyniku operacji np. operacji arytmetycznych na liczbach czy na datach.)
SELECT AVG(f.kwota) AS srednia_cena_sprzedazy
FROM faktura f
JOIN kartoteka_zlecen kz ON f.id_faktura = kz.id_faktura;


--------------WYMAGANIE-----------------Wyświetlanie wyniku operacji na datach.
-- pokaż transakcje z kartoteki zleceń od dacie z tego roku









