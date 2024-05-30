   /* • Obecność złączenia, zarówno w składni ze słowami INNER JOIN jak i bez niej.
    • Użycie grupowania i funkcji agregujących.
    • Wyświetlanie wyniku operacji np. operacji arytmetycznych na liczbach czy na datach.
    • Warunki odwołujące się do wzorców napisów (np. opisy wszystkich układanek, LIKE 'układanka%').
    • Użycie zagnieżdżenia w obu odmianach, nieskorelowane i skorelowane.
    • Sprawdzanie warunku NULL.
    • Zapytania negatywne, np. klienci bez złożonych zamówień. Co najmniej w dwu wersjach.*/


--------------WYMAGANIE-------------- Użycie zagnieżdżenia w obu odmianach, nieskorelowane i skorelowane.
-- Pokaż wszystkie samochody, które pochodzą z Polski
SELECT 
    dos.kraj_pochodzenia,
    s.*
FROM samochod as s 
JOIN dostawa as dos ON dos.id_samochod=s.id_samochod
WHERE s.id_samochod IN (SELECT d.id_samochod FROM dostawa AS d WHERE kraj_pochodzenia = 'Polska')

--------------WYMAGANIE-------------- Użycie zagnieżdżenia w obu odmianach, nieskorelowane i skorelowane.
--Wyświetlić samochodu na placu nr 1 które maja diesla





--------------WYMAGANIE-------------- Warunki odwołujące się do wzorców napisów (np. opisy wszystkich układanek, LIKE 'układanka%').
-- wyświetl samochody zarejestrowane w Poznania
SELECT * FROM samochod WHERE nr_rejestracyjny LIKE'PO%';
-- wyświetl samochody zarejestrowane, które mają napęd 4x4
SELECT 
    s.nr_vin,
    s.marka,
    s.model,
    s.rocznik
FROM samochod AS s WHERE model LIKE '%4x4%';




--------------WYMAGANIE---------------INNER JOIN+grupowanie+funkcja aggregująca count
-- Pokaż informacje o sprzedawcach, którzy sprzedali najwięcej samochodów
--możemy zsumować ilość sprzedanych samochodów dla każdego sprzedawcy i posortować wyniki malejąco.
SELECT s.id_sprzedawca, s.imie, s.nazwisko, COUNT(k.id_samochod) AS liczba_sprzedanych_samochodow
FROM sprzedawca AS s
JOIN kartoteka_transakcji AS  k ON s.id_sprzedawca = k.id_sprzedawca
GROUP BY s.id_sprzedawca, s.imie, s.nazwisko
ORDER BY liczba_sprzedanych_samochodow DESC
--LIMIT 1; -- wybór najlepszego sprzedawcy

--------------WYMAGANIE-----------------Sprawdzanie warunku NULL.
--pokaż samochody z opisami
SELECT 
    s.nr_vin,
    s.marka,
    s.model,
    s.rocznik,
    s.opis
FROM samochod AS s WHERE opis IS NOT NULL;

--pokaż klientów którzy nie dostali żadnego rabatu - rabat=NULL
SELECT 
    k.imie,
    k.nazwisko,
    f.rabat
FROM klient AS k
JOIN kartoteka_transakcji as t ON t.id_klient=k.id_klient  
JOIN faktura AS f ON f.id_faktura=t.id_faktura
WHERE f.rabat IS NULL;


--------------WYMAGANIE-----------------Wyświetlanie wyniku  operacji arytmetycznych 
--  Pokaż średnią cenę sprzedaży samochodów - przeliczyć walute najpierw
--• Wyświetlanie wyniku operacji np. operacji arytmetycznych na liczbach czy na datach.)
SELECT 
    AVG(f.kwota) AS srednia_cena_sprzedazy
FROM faktura AS f
JOIN kartoteka_zlecen kz ON f.id_faktura = kz.id_faktura;

-- Pokaż średnią wartość rabatu udzielanego klientom w procentach i kwotowo
SELECT 
    ROUND(AVG(rabat),2) AS sredni_rabat_procent
FROM faktura;

---- dodac kwoty do samochodow

--------------WYMAGANIE-----------------Użycie widoku (perspektywy, VIEW).
--wyświetl tabele faktura z kwotami podanymi w walucie polskiej
CREATE VIEW kwoty_polskie
AS
    SELECT 
        id_faktura,nr_faktury,
        ROUND(kwota * przelicznik_waluty,2) AS kwota_PLN,
        rabat,sposob_zaplaty,czy_zaplacono
    FROM faktura;

SELECT * FROM kwoty_polskie;



--------------WYMAGANIE-----------------Wyświetlanie wyniku operacji na datach.
-- pokaż transakcje z kartoteki zleceń od dacie z tego roku









