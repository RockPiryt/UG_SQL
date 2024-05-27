-- zapytania zagnieżdżone (zagnieżdżenia skorelowane)

-- sprawdź jacy klienci nie zamówili niczego
-- (nie złożyli zamówienia lub złozyli zamówienie puste t.j. bez pozycji)
SELECT --zapytanie zewnętrzne
imie, nazwisko 
FROM klient AS K
WHERE NOT EXISTS 
(
   SELECT * -- zapytanie wewnętrzne
     FROM zamowienie AS Z 
      INNER JOIN pozycja P ON  K.nr=Z.klient_nr AND P.zamowienie_nr=Z.nr 
)
;

-- zad P8: użyj INNER JOIN szukając klientów, którzy złożyli zamówienia, ---- ok odpowiada poprawnie
SELECT 
	DISTINCT kl.nr
	,kl.imie
	,kl.nazwisko
  --,zam.klient_nr
FROM klient AS kl
	INNER JOIN zamowienie AS zam ON zam.klient_nr=kl.nr
ORDER BY kl.nr



-- znajdź klientów, którzy złożyli puste zamówienia (tzn. bez pozycji).
-- tutaj muszę zamienić górne zapytanie

---------------------------------------------WERSJA z WHERE
/*SELECT --zapytanie zewnętrzne
imie, nazwisko 
FROM klient AS K
WHERE NOT EXISTS 
(
   SELECT * -- zapytanie wewnętrzne
     FROM zamowienie AS Z 
      INNER JOIN pozycja P ON  K.nr=Z.klient_nr AND P.zamowienie_nr=Z.nr 
)
;*/

-- muszę dołączyć takie same tabele - pozycja oraz zamówienie

----------------------------------------------WERSJA z JOIN
SELECT 
  imie, nazwisko 
FROM klient AS kl
  LEFT JOIN zamowienie AS zam ON zam.klient_nr= kl.nr
  LEFT JOIN pozycja AS pos ON pos.zamowienie_nr=zam.nr
WHERE zam.nr IS NULL AND pos.zamowienie_nr IS NULL
ORDER BY kl.nr























----------------------DODATKOWE ZAPYTANIA---------------
--skalar - liczba określająca ilosć unikalnych klientów krórzy złożyli zamówienie
SELECT COUNT(DISTINCT klient_nr) FROM zamowienie
;

-- to pokazuje ile każdy unikalny klient złożył zamowień, np klient o ir 4 złożył 2 zamowienia
SELECT 
	klient_nr 
	,count(klient_nr) AS ilosc_zam_klienta
FROM zamowienie 
GROUP By klient_nr --(grupuje klientów żeby policzyć, teraz na zamowieniu lient nr 3 zrobił 3 zamowienia)
ORDER BY klient_nr
;

--pokazuje klientów krórzy złożyli zamowienie (widnieja w tabeli zamowienie)--- bez sensu bo nie korzystam z inner join
SELECT 
	DISTINCT kl.nr
	,kl.imie
	,kl.nazwisko
FROM klient AS kl
	INNER JOIN zamowienie AS zam ON zam.klient_nr=kl.nr
ORDER BY kl.nr
;

--pokazuje klientów krórzy złożyli zamowienie - wykorzystanie ograniczenia ilości wierszy poprzez WHERE
SELECT 
	DISTINCT kl.nr aS id_klienta
	,kl.imie
	,kl.nazwisko
FROM klient AS kl, zamowienie as zam
WHERE zam.klient_nr=kl.nr
ORDER BY kl.nr