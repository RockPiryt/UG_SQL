-- grupowanie i warunki dotyczące grup, funkcje agregujące,
-- zapytania zagnieżdżone (zagnieżdżenia nieskorelowane) cz.1:

--nazwiska z powórzeniami
SELECT nazwisko FROM klient
SELECT count(nazwisko) FROM klient
;
-- nazwiska unikalne
SELECT DISTINCT nazwisko FROM klient
SELECT count(DISTINCT nazwisko) FROM klient
;
-- sprawdź czy nazwiska powtarzają się - podaje ilosć powtóek w oddzielnej kolumnie
SELECT nazwisko,count (nazwisko) FROM klient GROUP BY nazwisko
;
-- sprawdź czy nazwiska powtarzają się - wypisz nazwiska które się powtarzają
SELECT nazwisko FROM klient GROUP BY nazwisko HAVING count (nazwisko) > 1
;
--wypisz dane klientów o powtarzających się nazwiskach
SELECT imie, nazwisko, miasto FROM klient 
   WHERE nazwisko IN (
      SELECT nazwisko FROM klient 
      GROUP BY nazwisko HAVING count (nazwisko) > 1
      )
;

-- zad P6: sprawdź czy ceny towarów powtarzają się; 
SELECT  
	cena
    ,count(cena) 
FROM towar
GROUP BY cena


-- wypisz opis i ceny towarów o powtarzających się cenach;
-- w nawiasie waunek żeby liczna wystąpień ceny była większa od 1 
SELECT 
	opis 
	,cena 
FROM towar
WHERE cena IN (SELECT cena FROM towar GROUP BY cena HAVING count (cena) > 1)

-- to samo dla kosztu.
SELECT 
	opis 
	,cena 
FROM towar
WHERE koszt IN
(SELECT 
	koszt 
FROM towar 
GROUP BY koszt 
HAVING count (koszt) > 1)


---wyświetla powtarzający się koszt
SELECT 
	koszt 
FROM towar 
GROUP BY koszt 
HAVING count (koszt) > 1

