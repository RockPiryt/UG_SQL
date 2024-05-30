
--Przykładowe wywołanie dla tabeli faktura:

--Wstawienie nowej faktury, które uruchomi trigger before_insert_faktura 
--i automatycznie obliczy kwotę po uwzględnieniu rabatu:


INSERT INTO faktura (nr_faktury, kwota, waluta, przelicznik_waluty, rabat, sposob_zaplaty, czy_zaplacono)
VALUES ('F123456789', 10000.00, 'PLN', 1.0, 10, 'Przelew', TRUE);

-- Sprawdzenie, czy rabat został zastosowany
SELECT * FROM faktura WHERE nr_faktury = 'F123456789';

--Po wstawieniu powyższego rekordu, trigger automatycznie zmniejszy kwotę o 10%, 
--więc w tabeli faktura powinna być zapisana kwota 9000.00 PLN.

-----------------------------------------------------zablokowanie wstawienia rekordu -----------------------------------------------

--Przykładowe wywołanie dla tabeli kartoteka_transakcji:

--Wstawienie nowej transakcji, które uruchomi trigger before_insert_kartoteka_transakcji. 
--Zakładamy, że mamy samochód o id_samochod = 1, który nie jest gotowy do sprzedaży:

-- Ustawienie statusu gotowości samochodu na false
UPDATE samochod SET gotowy_do_sprzedaży = FALSE WHERE id_samochod = 1;

-- Próba wstawienia transakcji dla samochodu, który nie jest gotowy do sprzedaży
INSERT INTO kartoteka_transakcji (rodzaj, data_transakcji, samochod_w_rozliczeniu, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES ('Sprzedaż', '2024-05-01', FALSE, 1, 1, 1, 1, 1);

-- Sprawdzenie, czy transakcja została wstawiona
SELECT * FROM kartoteka_transakcji WHERE id_samochod = 1;

--Ponieważ samochód o id_samochod = 1 nie jest gotowy do sprzedaży, 
--trigger before_insert_kartoteka_transakcji zablokuje wstawienie rekordu 
--i zwróci błąd: Samochód nie jest gotowy do sprzedaży.

--------------------------------------wstawienie nowego rekordu transakcji do tabeli kartoteka_transakcji-----------------------------------

--Teraz ustawimy samochód jako gotowy do sprzedaży i spróbujemy ponownie:

-- Ustawienie statusu gotowości samochodu na true
UPDATE samochod SET gotowy_do_sprzedaży = TRUE WHERE id_samochod = 1;

-- Ponowna próba wstawienia transakcji dla samochodu, który jest gotowy do sprzedaży
INSERT INTO kartoteka_transakcji (rodzaj, data_transakcji, samochod_w_rozliczeniu, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES ('Sprzedaż', '2024-05-01', FALSE, 1, 1, 1, 1, 1);

-- Sprawdzenie, czy transakcja została wstawiona
SELECT * FROM kartoteka_transakcji WHERE id_samochod = 1;

--Po ustawieniu statusu samochodu na gotowy do sprzedaży, 
--trigger pozwoli na wstawienie nowego rekordu transakcji do tabeli kartoteka_transakcji.

