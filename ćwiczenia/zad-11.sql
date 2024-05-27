-- sprawdź jacy klienci złożyli zamówienia na układanki
SELECT 
  DISTINCT kl.nr, kl.imie, kl.nazwisko
  , tow.opis
FROM ( ( klient AS kl INNER JOIN zamowienie AS zam ON kl.nr = zam.klient_nr) 
  INNER JOIN pozycja  AS poz ON zam.nr = poz.zamowienie_nr) 
  INNER JOIN towar AS tow ON poz.towar_nr = tow.nr
WHERE tow.opis LIKE 'układanka%'
;

-- zad P11: sprawdź zamówienia na chusteczki higieniczne, kto
-- zamawiał, ile, jaki jest średni czas oczekiwania na realizację
-- zamówienie na chusteczki.

SELECT 
  DISTINCT kl.nr, kl.imie, kl.nazwisko
  , tow.opis
  , ROUND(AVG(EXTRACT('day' FROM AGE(zam.data_wysylki, zam.data_zlozenia))),2) AS sredni_czas_oczekiwania --średni czas oczekiwania z tabeli zamówień
FROM ( ( klient AS kl INNER JOIN zamowienie AS zam ON kl.nr = zam.klient_nr) 
  INNER JOIN pozycja  AS poz ON zam.nr = poz.zamowienie_nr) 
  INNER JOIN towar AS tow ON poz.towar_nr = tow.nr
WHERE tow.opis LIKE '%chusteczki%'
GROUP BY kl.nr, kl.imie, kl.nazwisko, tow.opis
