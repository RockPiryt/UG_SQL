------------------------------------------------KOMIS INSERT--------------------------------------------


INSERT INTO komis (nip, nazwa, panstwo, miasto, ulica, nr_budynku, nr_lokalu, kod_pocztowy, telefon, e_mail)
VALUES (1234567890, 'AutoKomis XYZ', 'Polska', 'Warszawa', 'Marszałkowska', '123', '4A', '00-001', '123-456-789', 'kontakt@autokomisxyz.pl');
------------------------------------------------PLACE INSERTY--------------------------------------------

-- Do komisu należą 3 place
INSERT INTO plac (kraj, miejscowosc, ulica, nr_działki, id_komis)
VALUES ('Polska', 'Kraków', 'Floriańska', '10', 1);

INSERT INTO plac (kraj, miejscowosc, ulica, nr_działki, id_komis)
VALUES ('Polska', 'Gdańsk', 'Długa', '25', 2);

INSERT INTO plac (kraj, miejscowosc, ulica, nr_działki, id_komis)
VALUES ('Polska', 'Poznań', 'Święty Marcin', '8', 3);

-------------------------------------------------SAMOCHODY INSERTY ----------------------------------------

-- Samochody rozmieszczone na 3 placach
INSERT INTO samochod (nr_rejestracyjny, nr_vin, marka, model, rocznik, przebieg, silnik, paliwo, moc, kolor, rodzaj_pojazdu, ladownosc, gotowy_do_sprzedaży, id_plac)
VALUES 
('ABC1234', '1HGCM82633A123456', 'Toyota', 'Corolla', 2015, 80000, 1.8, 'Benzyna', 140, 'Czarny', 'Sedan', 5.0, true, 1),
('DEF5678', '2HGCM82633A654321', 'Honda', 'Civic', 2018, 60000, 2.0, 'Benzyna', 158, 'Biały', 'Sedan', 4.5, false, 2),
('GHI9101', '3HGCM82633A987654', 'Ford', 'Focus', 2020, 30000, 1.5, 'Diesel', 120, 'Niebieski', 'Hatchback', 4.0, true, 1),
('JKL2345', '4HGCM82633A456789', 'Volkswagen', 'Golf', 2016, 90000, 1.6, 'Benzyna', 110, 'Srebrny', 'Hatchback', 4.3, false, 3),
('MNO6789', '5HGCM82633A112233', 'BMW', '3 Series', 2017, 70000, 2.0, 'Diesel', 190, 'Czerwony', 'Sedan', 4.8, true, 2),
('PQR1122', '6HGCM82633A332211', 'Audi', 'A4', 2019, 50000, 2.0, 'Benzyna', 200, 'Czarny', 'Sedan', 4.7, false, 3),
('STU3344', '7HGCM82633A223344', 'Mercedes', 'C-Class', 2018, 65000, 2.0, 'Diesel', 180, 'Biały', 'Sedan', 4.6, true, 1),
('VWX5566', '8HGCM82633A445566', 'Skoda', 'Octavia', 2021, 20000, 1.4, 'Benzyna', 150, 'Zielony', 'Hatchback', 4.2, false, 2),
('YZA7788', '9HGCM82633A667788', 'Volvo', 'S60', 2016, 85000, 2.0, 'Diesel', 190, 'Srebrny', 'Sedan', 4.9, true, 3),
('BCD9900', '0HGCM82633A889900', 'Mazda', '6', 2017, 75000, 2.2, 'Diesel', 175, 'Niebieski', 'Sedan', 4.5, false, 1),
('EFG1235', '1HGCM82633B112233', 'Opel', 'Astra', 2020, 25000, 1.6, 'Benzyna', 130, 'Czerwony', 'Hatchback', 4.1, true, 2),
('HIJ4567', '2HGCM82633B445566', 'Renault', 'Megane', 2019, 40000, 1.5, 'Diesel', 115, 'Biały', 'Hatchback', 4.0, false, 3),
('KLM7890', '3HGCM82633B778899', 'Peugeot', '308', 2018, 55000, 1.2, 'Benzyna', 130, 'Czarny', 'Hatchback', 4.2, true, 1),
('NOP1123', '4HGCM82633C112233', 'Hyundai', 'Elantra', 2021, 15000, 1.8, 'Benzyna', 147, 'Srebrny', 'Sedan', 4.5, false, 2),
('QRS4456', '5HGCM82633C445566', 'Kia', 'Ceed', 2017, 70000, 1.6, 'Diesel', 136, 'Niebieski', 'Hatchback', 4.3, true, 3);

--------------------------------------------DOSTAWA INSERTY---------------------------------------
INSERT INTO dostawa (data_dostawy, kraj_pochodzenia, czy_zarejestrowany, czy_uszkodzony, id_plac, id_samochod)
VALUES 
('2022-01-05', 'Polska', true, false, 1, 1),
('2022-02-12', 'Niemcy', false, true, 2, 2),
('2022-03-20', 'Polska', true, false, 3, 3),
('2022-04-15', 'Francja', false, true, 1, 4),
('2022-05-10', 'Polska', true, false, 2, 5),
('2022-06-25', 'Włochy', false, true, 3, 6),
('2022-07-08', 'Polska', true, false, 1, 7),
('2022-08-19', 'Hiszpania', false, true, 2, 8),
('2022-09-21', 'Polska', true, false, 3, 9),
('2022-10-03', 'Holandia', false, true, 1, 10),
('2022-11-14', 'Polska', true, false, 2, 11),
('2022-12-30', 'Belgia', false, true, 3, 12),
('2023-01-08', 'Polska', true, false, 1, 13),
('2023-02-17', 'Austria', false, true, 2, 14),
('2023-03-22', 'Polska', true, false, 3, 15);


--------------------------------------------SPRZEDAWCA INSERTY---------------------------------------
--Po 4 sprzedawców na każdy z 3 placów komisu 

-- Sprzedawcy dla pierwszego placu (id_plac = 1)
INSERT INTO sprzedawca (imie, nazwisko, nr_telefonu, e_mail, id_komis, id_plac)
VALUES 
('Jan', 'Kowalski', '123-456-789', 'jan.kowalski@example.com', 1, 1),
('Anna', 'Nowak', '234-567-890', 'anna.nowak@example.com', 1, 1),
('Piotr', 'Wiśniewski', '345-678-901', 'piotr.wisniewski@example.com', 1, 1),
('Katarzyna', 'Wójcik', '456-789-012', 'katarzyna.wojcik@example.com', 1, 1);

-- Sprzedawcy dla drugiego placu (id_plac = 2)
INSERT INTO sprzedawca (imie, nazwisko, nr_telefonu, e_mail, id_komis, id_plac)
VALUES 
('Marek', 'Kowalczyk', '567-890-123', 'marek.kowalczyk@example.com', 1, 2),
('Ewa', 'Kamińska', '678-901-234', 'ewa.kaminska@example.com', 1, 2),
('Tomasz', 'Lewandowski', '789-012-345', 'tomasz.lewandowski@example.com', 1, 2),
('Magdalena', 'Dąbrowska', '890-123-456', 'magdalena.dabrowska@example.com', 1, 2);

-- Sprzedawcy dla trzeciego placu (id_plac = 3)
INSERT INTO sprzedawca (imie, nazwisko, nr_telefonu, e_mail, id_komis, id_plac)
VALUES 
('Robert', 'Zieliński', '901-234-567', 'robert.zielinski@example.com', 1, 3),
('Agnieszka', 'Szymańska', '012-345-678', 'agnieszka.szymanska@example.com', 1, 3),
('Paweł', 'Woźniak', '123-456-789', 'pawel.wozniak@example.com', 1, 3),
('Zofia', 'Kozłowska', '234-567-890', 'zofia.kozlowska@example.com', 1, 3);

---------------------------------FAKTURA INSERTY---------------------------------------------
INSERT INTO faktura (nr_faktury, kwota, waluta, rabat, sposob_zaplaty, czy_zaplacono) 
VALUES 
('F/2024/001', 1500.00, 'PLN', 5, 'Przelew', true),
('F/2024/002', 2500.00, 'EUR', 8, 'Gotówka', true),
('F/2024/003', 1800.00, 'USD', 10, 'Karta kredytowa', true),
('F/2024/004', 3200.00, 'PLN', 7, 'Przelew', false),
('F/2024/005', 5000.00, 'GBP', 4, 'Gotówka', true),
('F/2024/006', 4200.00, 'PLN', null, 'Przelew', false),
('F/2024/007', 3500.00, 'EUR', 9, 'Przelew', true),
('F/2024/008', 2800.00, 'USD', 6, 'Karta kredytowa', true),
('F/2024/009', 1900.00, 'PLN', 2, 'Przelew', true),
('F/2024/010', 4000.00, 'PLN', 10, 'Gotówka', true);

--------------------------------------------KARTOTEKA ZLECEŃ INSERTY----------------------------------------

-- Sprzedaż na placu 1 przez sprzedawcę 1
INSERT INTO kartoteka_zlecen (rodzaj, data_sprzedaży, samochod_w_rozliczeniu, uwagi, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES 
('sprzedaż', '2024-01-10', false, 'Brak uwag', 1, 7, 1, 1, 1);

-- Sprzedaż na placu 1 przez sprzedawcę 2
INSERT INTO kartoteka_zlecen (rodzaj, data_sprzedaży, samochod_w_rozliczeniu, uwagi, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES 
('sprzedaż', '2024-01-15', true, 'Samochód w dobrym stanie', 2, 10, 2, 1, 2);

-- Sprzedaż na placu 1 przez sprzedawcę 3
INSERT INTO kartoteka_zlecen (rodzaj, data_sprzedaży, samochod_w_rozliczeniu, uwagi, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES 
('sprzedaż', '2024-02-05', false, 'Przebieg powyżej średniej', 3, 3, 3, 1, 3);

-- Kupno na placu 2 przez sprzedawcę 4
INSERT INTO kartoteka_zlecen (rodzaj, data_sprzedaży, samochod_w_rozliczeniu, uwagi, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES 
('kupno', '2024-02-20', false, 'Samochód kupiony z rabatem', 4, 6, 4, 2, 4);

-- Sprzedaż na placu 2 przez sprzedawcę 5
INSERT INTO kartoteka_zlecen (rodzaj, data_sprzedaży, samochod_w_rozliczeniu, uwagi, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES 
('sprzedaż', '2024-03-01', true, 'Auto wymaga naprawy', 5, 2, 5, 2, 5);

-- Sprzedaż na placu 2 przez sprzedawcę 6
INSERT INTO kartoteka_zlecen (rodzaj, data_sprzedaży, samochod_w_rozliczeniu, uwagi, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES 
('sprzedaż', '2024-03-15', false, 'Brak uwag', 6, 8, 6, 2, 6);

-- Kupno na placu 3 przez sprzedawcę 7
INSERT INTO kartoteka_zlecen (rodzaj, data_sprzedaży, samochod_w_rozliczeniu, uwagi, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES 
('kupno', '2024-04-01', true, 'Samochód kupiony z wymianą starego', 7, 9, 7, 3, 7);

-- Sprzedaż na placu 3 przez sprzedawcę 8
INSERT INTO kartoteka_zlecen (rodzaj, data_sprzedaży, samochod_w_rozliczeniu, uwagi, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES 
('sprzedaż', '2024-04-10', false, 'Brak uwag', 8, 5, 8, 3, 8);

-- Sprzedaż na placu 3 przez sprzedawcę 9
INSERT INTO kartoteka_zlecen (rodzaj, data_sprzedaży, samochod_w_rozliczeniu, uwagi, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES 
('sprzedaż', '2024-04-20', false, 'Samochód po jednym właścicielu', 9, 4, 9, 3, 9);

-- Kupno na placu 1 przez sprzedawcę 10
INSERT INTO kartoteka_zlecen (rodzaj, data_sprzedaży, samochod_w_rozliczeniu, uwagi, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES 
('kupno', '2024-05-01', true, 'Samochód w rozliczeniu', 10, 1, 10, 1, 10);

---------------------------------KLIENT INSERTY---------------------------------------------

INSERT INTO klient (imie, nazwisko, pesel_nip, rodzaj_dokumentu, nr_dokumentu, panstwo, miasto, ulica, nr_domu, nr_mieszkania, kod, nr_telefonu, id_transakcja)
VALUES 
('Jan', 'Kowalski', '12345678901234', 'Dowód osobisty', 'ABC123456', 'Polska', 'Warszawa', 'Krakowska', 10, 2, '00-001', 123456789, 1),
('Anna', 'Nowak', '98765432109876543', 'Dowód osobisty', 'DEF987654', 'Polska', 'Kraków', 'Piotrkowska', 5, NULL, '30-002', 987654321, NULL),
('Piotr', 'Wiśniewski', '34567890123456789', 'Paszport', 'GHI654321', 'Polska', 'Gdańsk', 'Słoneczna', 15, 4, '80-003', 654321987, 2),
('Maria', 'Dąbrowska', '45678901234', 'Dowód osobisty', 'JKL321654', 'Polska', 'Poznań', 'Leszczyńska', 20, NULL, '60-004', 456789012, NULL),
('Adam', 'Lis', '01234567890123456', 'Paszport', 'MNO987654', 'Polska', 'Łódź', 'Wschodnia', 30, 7, '90-005', 789012345, 3),
('Ewa', 'Kamińska', '11223344556', 'Dowód osobisty', 'PQR456789', 'Polska', 'Wrocław', 'Polna', 25, 1, '50-006', 321654987, 4),
('Tomasz', 'Zieliński', '12345678909876543', 'Paszport', 'STU654321', 'Polska', 'Szczecin', 'Rybacka', 8, NULL, '70-007', 654987321, NULL),
('Magdalena', 'Woźniak', '21314151617181920', 'Dowód osobisty', 'VWX123456', 'Polska', 'Katowice', 'Ogrodowa', 12, NULL, '40-008', 987321654, NULL),
('Katarzyna', 'Jaworska', '56789012345678901', 'Dowód osobisty', 'YZA987654', 'Polska', 'Gdynia', 'Moraska', 18, 3, '20-009', 741852963, 5),
('Grzegorz', 'Kaczmarek', '67890123456789012', 'Dowód osobisty', 'BCD654321', 'Polska', 'Kraków', 'Długa', 7, NULL, '30-010', 852963741, NULL);

