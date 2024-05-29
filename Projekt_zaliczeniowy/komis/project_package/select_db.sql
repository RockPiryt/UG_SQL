-- Pokaż wszystkie dostawy, które pochodzą z Polski

SELECT * FROM dostawa WHERE kraj_pochodzenia = 'Polska';

-- Pokaż informacje o sprzedawcy, który sprzedał najwięcej samochodów, 
--możemy zsumować ilość sprzedanych samochodów dla każdego sprzedawcy 
--i posortować wyniki malejąco.

SELECT s.id_sprzedawca, s.imie, s.nazwisko, COUNT(k.id_samochod) AS liczba_sprzedanych_samochodow
FROM sprzedawca s
JOIN kartoteka_zlecen k ON s.id_sprzedawca = k.id_sprzedawca
GROUP BY s.id_sprzedawca, s.imie, s.nazwisko
ORDER BY liczba_sprzedanych_samochodow DESC
LIMIT 1;


-- Pokaż średnią wartość rabatu udzielanego klientom
SELECT AVG(rabat) AS sredni_rabat
FROM faktura;

--  Pokaż średnią cenę sprzedaży samochodów
SELECT AVG(f.kwota) AS srednia_cena_sprzedazy
FROM faktura f
JOIN kartoteka_zlecen kz ON f.id_faktura = kz.id_faktura;






