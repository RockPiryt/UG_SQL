-- wypisz liczbę pozycji zamówionych towarów przez poszczególnych klientów
SELECT 
   klient.nr, imie, nazwisko
   , count(*) AS pozycji_ilosc
   FROM ( (klient 
            INNER JOIN zamowienie ON klient.nr = zamowienie.klient_nr)
            INNER JOIN pozycja ON zamowienie.nr = pozycja.zamowienie_nr)
GROUP BY klient.nr, imie, nazwisko
ORDER BY nazwisko
;

/*   zmodyfikuj poprzednie zapytanie tak by pokazywało
     liczbę różnych zamówionych towarów, a nie pozycji
*/
SELECT 
   q.imie, q.nazwisko
   , count(*) AS towarów_ilosc
FROM 
   (SELECT 
         kl.imie, kl.nazwisko
      FROM (( klient AS kl INNER JOIN zamowienie AS zam ON kl.nr = zam.klient_nr) 
      INNER JOIN pozycja As poz ON zam.nr = poz.zamowienie_nr)
   GROUP BY kl.nr, kl.imie, kl.nazwisko, poz.towar_nr) AS q -----------------wersja z podzapytaniem(subquery)
GROUP BY q.imie, q.nazwisko
ORDER BY q.nazwisko
;

/* wypisz liczbę różnych pozycji zamówionych towarów oraz wartości 
   zamówień i osiągniętego zysku w rozbiciu na klientów
*/

-- pokazuje ile zarobiliśmy na poszczególnym kliencie
SELECT 
	kl.imie, kl.nazwisko
    , count(*) AS pozycji_ilosc
    , sum(poz.ilosc * tow.cena) AS suma
    , sum(poz.ilosc * (tow.cena - tow.koszt)) AS zysk
FROM (((klient AS kl
             INNER JOIN zamowienie AS zam ON kl.nr = zam.klient_nr)
           INNER JOIN pozycja AS poz ON zam.nr = poz.zamowienie_nr)
        INNER JOIN towar AS tow ON poz.towar_nr = tow.nr)
GROUP BY kl.nr, kl.imie, kl.nazwisko
ORDER BY kl.nazwisko
;

-- zad P12: zmodyfikuj podobnie zapytanie tak, by dotyczyło towarów
-- zamiast pozycji.

----wersja z JOIN
SELECT 
    kl.imie, 
    kl.nazwisko,
    SUM(poz.ilosc) AS towary_ilosc,
    SUM(poz.ilosc * tow.cena) AS suma,
    SUM(poz.ilosc * (tow.cena - tow.koszt)) AS zysk
FROM 
    klient AS kl
INNER JOIN zamowienie AS zam ON kl.nr = zam.klient_nr
INNER JOIN pozycja AS poz ON zam.nr = poz.zamowienie_nr
INNER JOIN towar AS tow ON poz.towar_nr = tow.nr
GROUP BY kl.nr, kl.imie, kl.nazwisko
ORDER BY kl.nazwisko;





-------------wersja z podzapytaniem
SELECT 
    subquery.imie, 
    subquery.nazwisko,
    SUM(subquery.towary_ilosc) AS towary_ilosc,
    SUM(subquery.suma) AS suma,
    SUM(subquery.zysk) AS zysk
FROM (
    SELECT 
        kl.nr,kl.imie, kl.nazwisko,
        poz.ilosc AS towary_ilosc,
        poz.ilosc * tow.cena AS suma,
        poz.ilosc * (tow.cena - tow.koszt) AS zysk
    FROM 
        klient AS kl
    INNER JOIN zamowienie AS zam ON kl.nr = zam.klient_nr
    INNER JOIN pozycja AS poz ON zam.nr = poz.zamowienie_nr
    INNER JOIN towar AS tow ON poz.towar_nr = tow.nr) AS subquery
GROUP BY subquery.nr, subquery.imie, subquery.nazwisko
ORDER BY subquery.nazwisko;



----DODATKOWE
--zapytanie wewnętrzne wyświetla imie, nazwisko, nr_zamówienia klientów który coś zamówili
SELECT 
         kl.imie, kl.nazwisko
         ,poz.zamowienie_nr
      FROM (( klient AS kl INNER JOIN zamowienie AS zam ON kl.nr = zam.klient_nr) 
      INNER JOIN pozycja As poz ON zam.nr = poz.zamowienie_nr)
   GROUP BY kl.nr, kl.imie, kl.nazwisko, poz.towar_nr,poz.zamowienie_nr