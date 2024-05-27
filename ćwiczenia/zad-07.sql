-- zapytania zagnieżdżone (zagnieżdżenia nieskorelowane)
-- vs. złączenia:

-- sprawdź jacy klienci złożyli zamówienia
-- rozwiązanie ze złączeniem
SELECT imie, nazwisko
   FROM klient K, zamowienie Z
   WHERE K.nr=Z.klient_nr
   GROUP BY K.nr, imie, nazwisko
;
-- rozwiązanie z zagnieżdżeniem(skolerowane,podzayptanie sklarane z WHERE -lek.29)
SELECT imie, nazwisko FROM klient 
  WHERE nr IN (
    SELECT klient_nr FROM zamowienie Z 
    )
      ORDER BY nazwisko
;
-- znajdź klientów którzy nie złożyli zamówień
SELECT imie, nazwisko FROM klient 
  WHERE nr NOT IN (
    SELECT klient_nr FROM zamowienie Z
    )
      ORDER BY nazwisko
;
-- uwaga pierwsze rozwiązanie nie daje możliwości adaptacji do kolejnego pytania

-- zad P7: wypisz 



-- daty złożenia zamówień nie mających żadnych pozycji, 
-- w tabeli pozycja brakuje towarów dla zamówień 7 i 13
SELECT 
	zam.nr
	,zam.data_zlozenia 
FROM zamowienie AS zam
WHERE zam.nr not IN (SELECT zamowienie_nr FROM pozycja)--chce wyświetlić daty złożenia dla zamowień które maja pozycje (maja towary)

--WHERE jak chcę ograniczyć ilość rekordów/wieszy!!


-- opisy towarów niezamawianych, 
-- wyświetla nie zamowione towary
SELECT 
	tow.opis
    ,tow.nr
FROM towar AS tow
WHERE tow.nr NOT IN 
        (
            SELECT 
              poz.towar_nr
            FROM pozycja AS poz
                JOIN towar as tw ON poz.towar_nr=tw.nr
        )
    


-- opisy towarów nie posiadających kodu kreskowego(połączeniem jest towar_nr)------------------------------------

--opisy towarów nie posiadających kodu kreskowego
SELECT 
	tow.opis
    --,tow.nr
FROM towar AS tow
WHERE tow.nr not IN 
(
 SELECT
      kk.towar_nr
  FROM kod_kreskowy AS kk
  WHERE kk.towar_nr IS NOT NULL
)
-------------------------------------DODATKOWE ZAPYTANIA-------------------------------
-- WYSWIETLA NR TOWAU, OPSI TOWARU, NR ZAMOWIENIA ORAZ DATE ZAMOWIENIA
-- DUŻO JOIN KTÓRE WYŚWIETLAJĄ INFOMACJE Z RÓŻNYCH TABEL
/*
SELECT 
	tw.nr AS numer_towaru
    ,tw.opis AS opis_towaru
    ,poz.zamowienie_nr AS nr_zamowienia_towaru
    , zam.data_zlozenia AS data_zamowienia_towaru
FROM towar AS tw
--szukam informacji w innej tabeli-> pozycja(towar_nr tam jest i na jego podstawie wyciągne zamówienie_nr)
JOIN pozycja as poz ON poz.towar_nr=tw.nr
--mając nr zamówienia - grzebie w tabeli zamowienie żeby odczytać date zamówieniaklient
JOIN zamowienie as zam ON zam.nr=poz.zamowienie_nr*/




/*
--to wyswietla opis i nr towaru które ma kod kreskowy
SELECT 
	tow.opis
    ,tow.nr
FROM towar AS tow
WHERE tow.nr IN 
	(
    SELECT
      kk.towar_nr
      FROM kod_kreskowy AS kk
    )

--wyswietla kody z towar_nr=NULL
 SELECT
      kk.kod
  FROM kod_kreskowy AS kk
  WHERE kk.towar_nr IS NULL

--wyswietla kody z towar_nr=NOT NULL, czyli towary z kodami
 SELECT
      kk.kod
  FROM kod_kreskowy AS kk
  WHERE kk.towar_nr IS NOT NULL

  -- wyświetla id_owarów które mają kody
   SELECT
      kk.towar_nr
  FROM kod_kreskowy AS kk
  WHERE kk.towar_nr IS NOT NULL*/



-- (uwaga: są takie towary, to zapytanie może dawać nieoczekiwany wynik, 
-- należy zachować ostrożność)

--najpier opisy towarów zamawianych (id_owaru musi być na zamówieniu - tabela pozycja łączy obie te informacje)
-- lekcja 29 werjsa z podzapytaniem
--tworze najpierw male zapytanie wewnętrzne
