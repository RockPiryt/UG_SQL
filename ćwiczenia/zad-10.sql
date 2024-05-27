-- funkcje agregujące

-- wyświetla imie, nazwisko, nr_zamowienia,  ilosc_pozycji na zamowieniu
-- wypisz zamówienia klientów o więcej niż jednej pozycji
SELECT 
imie, nazwisko
, zamowienie.nr as zamowienie_nr
, count(*) as "ile pozycji"
FROM (( klient INNER JOIN zamowienie ON klient.nr = zamowienie.klient_nr) INNER JOIN pozycja ON zamowienie.nr = pozycja.zamowienie_nr)
GROUP BY imie, nazwisko, zamowienie.nr
HAVING count(*)>1
;

-- zad P10: z tabel klientów i zamówień oblicz minimalny, maksymalny
-- i średni czas oczekiwania przez poszczególnych klientów (zamówienia
-- niezrealizowane nie liczą się do średniej).



SELECT 
    k.nr AS klient_nr
    ,CONCAT(k.imie,' ', k.nazwisko) AS imie_nazwisko_klienta
    ,MIN(EXTRACT('day' FROM AGE(z.data_wysylki, z.data_zlozenia))) AS minimalny_czas_oczekiwania
    ,MAX(EXTRACT('day' FROM AGE(z.data_wysylki, z.data_zlozenia))) AS maksymalny_czas_oczekiwania
    ,ROUND(AVG(EXTRACT('day' FROM AGE(z.data_wysylki, z.data_zlozenia))),2) AS sredni_czas_oczekiwania
FROM klient AS k
JOIN zamowienie AS z ON k.nr = z.klient_nr
WHERE z.data_wysylki IS NOT NULL -- odrzucamy zamówienia niezrealizowane (nie liczą się do średniej)
GROUP BY k.nr, k.imie, k.nazwisko -- grupuje wzgledem klientów, bo klient może zamówić pare razy
ORDER by klient_nr

-------------------DODATKOWE ZAPYTANIA---------------------------
-- muszę obliczyć czas_oczekiwania
SELECT 
    zam.nr
    ,zam.data_zlozenia
    ,zam.data_wysylki
    -- zamiana NULL na coś innego
    ,COALESCE(CAST(EXTRACT('day' FROM AGE(zam.data_wysylki, zam.data_zlozenia)) AS VARCHAR(5)), 'nieznany czas') AS czas_oczek_beznull
FROM zamowienie AS zam