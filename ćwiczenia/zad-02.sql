-- wyświetl listy różnych atrybutów z tabel
SELECT imie, nazwisko FROM klient
;
SELECT opis, koszt FROM towar
;
SELECT data_wysylki, koszt_wysylki FROM zamowienie
;

-- polecenie \d klient wyświetla dane o tablicy klientów, m.in.
-- nazwy atrybutów, może to być pożyteczne;
-- zad P2: wyświetl nazwiska i pełne adresy klientów;
SELECT imie, nazwisko, kod_pocztowy, miasto, ulica_dom FROM klient;
-- wyświetl numery i daty zamówień, zastosuj jakieś uporządkowanie.
SELECT nr, data_zlozenia FROM zamowienie;

