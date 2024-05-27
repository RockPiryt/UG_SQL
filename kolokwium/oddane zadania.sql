--Zadanie 1 
--Dodaj do tabeli relację wiele do wielu między encjami autor i czytelnik, 
--relacja informuje o czytelnikach zapisanych na wydarzenie 'Spotkanie z autorem' i  
--powinna zawierać informacje o dacie spotkania. 
--Dodatkowo zapisz dwie osoby na spotkania z dwoma autorami (te same osoby z tymi samymi autorami)  

Zadanie 2 
--Podaj zapytanie, które wyświetli imiona i nazwiska osób obecnie wypożyczających książkę 'Lokomotywa'  

SELECT 
	C.imię, C.nazwisko
    --,C.nr_karty
    --,ks.nazwa
FROM czytelnik as c 
JOIN egzemplarz AS eg ON eg.aktualne_wypożyczenie=C.nr_karty -- dołączam tabl. egzemplarz
JOIN ksiazka AS ks ON ks.isbn=eg.książka --dołaczam tabele ksiażka
WHERE c.nr_karty IN (SELECT aktualne_wypożyczenie FROM egzemplarz) AND ks.nazwa LIKE 'Lokomotywa%'

--Zadanie 3 
--Podaj zapytanie, które dla każdej książki wyświetli imię i nazwisko autora, tytuł książki i liczbę egzemplarzy w bazie  

SELECT 
	DISTINCT ks.nazwa AS tytul
    , au.imię AS imie_autora
    , au.nazwisko nazwisko_autora
    --, eg.id_egz
    --, SUM(eg.id_egz) AS ilosc_egzemplarzy
    --, SELECT Count(*)  FROM egzemplarz count(eg.id_egz) AS ilosc_egzemplarzy
from ksiazka AS ks
JOIN autor AS au ON au.id_aut=ks.autor
JOIN egzemplarz AS eg ON eg.książka= ks.isbn
GROUP BY ks.nazwa, au.imię, au.nazwisko, eg.id_egz
ORDER BY ks.nazwa

--Zadanie 4 
--Podaj zapytanie, które wyświetli książki o nazwie zawierającej więcej niż 2 słowa  
SELECT
*
FROM ksiazka
WHERE nazwa LIKE '% %'


--Zadanie 5 
--Podaj zapytanie zwracające id_egz dla egzemplarzy, które nigdy nie były wypożyczone     
SELECT 
	eg.id_egz
    --, eg.data_wyp
FROM egzemplarz AS eg
WHERE eg.aktualne_wypożyczenie IS NULL 

Zadanie 6 
--Podaj zapytanie które wypisze imiona i nazwiska osób, które aktualnie wypożyczają książkę i  
--przewidywana data zwrotu jest wcześniejsza niż dziś      

SELECT 
	cz.imię
    ,cz.nazwisko
    ,cz.nr_karty
    ,eg.przewidywana_data_zwr
FROM czytelnik AS cz
JOIN egzemplarz AS eg ON eg.aktualne_wypożyczenie=cz.nr_karty
WHERE eg.przewidywana_data_zwr > '2024-05-26'

--Zadanie 7 
--Podaj zapytanie, które dla każdej aktualnie wypożyczonej książki wyświetli sumę wypożyczeń jej egzemplarzy (bieżące + archiwalne)      

Zadanie 8 
--Podaj zapytanie które wypisze nazwy książek, posiadających egzemplarz zwrócony w ciągu tygodnia od wypożyczenia  
SELECT 
	ks.nazwa
    ,eg.książka AS isbn_ks
FROM ksiazka AS ks 
JOIN egzemplarz AS eg ON eg.książka=ks.isbn
JOIN wypozyczenia_archiwalne AS w On w.egzemplarz=eg.id_egz
WHERE EXTRACT('day' FROM AGE(w.data_zwr,w.data_wyp)) < 7

Zadanie 9 
--Podaj zapytanie, które wypisze imiona i nazwiska osób, które wypożyczyły dowolną książkę  
--(niekoniecznie ten sam egzemplarz) więcej niż jeden raz  
SELECT
cz.imię
,cz.nazwisko
FROM czytelnik AS cz
JOIN egzemplarz AS eg ON eg.aktualne_wypożyczenie=cz.nr_karty
GROUP by cz.nr_karty
HAVING COUNT(*) > 1

Zadanie 10 
--Opisz typ każdej relacji w bazie  

Relacja 1 do N (relacja 1 do wielu) np. 1 książka ma wielu autorów
Relacja 1 do 1 (relacja 1 do 1) np. 1 dziecko ma 1 mamę
Relacja N-N (relacja wiele do wielu) np. film może należeć do wielu kategorii filmowych a katergorie filmowe mają wiele filmów
, w PostgreSQL stosuje się dodatkową tabelę pośrednią która zawiera 2 klucze obce