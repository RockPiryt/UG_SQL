--CREATE DATABASE komis_projekt;
-----------------------------------------------------------------------------
CREATE TABLE komis 
(
    id_komis                serial               PRIMARY KEY,
    nip                     int                  not null,
    nazwa                   varchar(30)          not null,
    panstwo                 varchar(30)          not null,
    miasto                  varchar(30)          not null,
    ulica                   varchar(30)          not null,
    nr_budynku              int                  not null,
    nr_lokalu               varchar(10),
    kod_pocztowy            varchar(10)          not null,
    telefon                 varchar(15),
    e_mail                  varchar(50),
    UNIQUE(nip)
);
-------------------------------------------------------------------------------
CREATE TABLE plac 
(
    id_plac                 serial          PRIMARY KEY,
    kraj                    varchar(30)     not null        DEFAULT 'Polska',
    miejscowosc             varchar(30)     not null,
    ulica                   varchar(30)     not null,
    nr_dzialki              varchar(20)     not null,
    id_komis                int,
    -- klucz obcy - powiazanie placu z komisem
    CONSTRAINT              fk_komis FOREIGN KEY(id_komis)
                            REFERENCES komis(id_komis)
                            ON UPDATE CASCADE ON DELETE CASCADE
);
--------------------------------------------------------------------------------
CREATE TABLE samochod 
(
    id_samochod             serial          PRIMARY KEY,
    nr_rejestracyjny        varchar(7),
    nr_vin                  char(17)     not null,
    marka                   varchar(30)     not null,
    model                   varchar(30)     not null,
    rocznik                 int             not null,
    przebieg                decimal(12,2)   not null,
    silnik                  decimal(4,2)    not null,
    paliwo                  varchar(30)     not null,
    moc                     int             not null,
    kolor                   varchar(30)     not null,
    rodzaj_pojazdu          varchar(30)     not null,
    ladownosc               decimal(4,2),
    gotowy_do_sprzedaży     bool            not null,
    cena                    decimal(20,2)   not null,
    opis                    text,
    id_plac                 int,
    -- klucz obcy - powiazanie samocodu z placem
    CONSTRAINT              fk_plac_samochod FOREIGN KEY(id_plac)
                            REFERENCES plac(id_plac)
                            ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE(nr_rejestracyjny, nr_vin)
);

------------------------------------------------------------------
CREATE TABLE dostawa
(
    id_dostawa            serial                PRIMARY KEY,
    data_dostawy          date                  not null,
    kraj_pochodzenia      varchar(50)           not null, 
    czy_zarejestrowany    bool                  not null,
    czy_uszkodzony        bool                  not null,
    id_plac               int,
    id_samochod           int,
    -- klucz obcy - powiazanie dostawy z samochodem
    CONSTRAINT              fk_samochod_dostawa FOREIGN KEY(id_samochod)
                            REFERENCES samochod(id_samochod)
                            ON UPDATE CASCADE ON DELETE CASCADE,
    -- klucz obcy - powiazanie dostawy z placem
    CONSTRAINT              fk_plac_dostawa FOREIGN KEY(id_plac)
                            REFERENCES plac(id_plac)
                            ON UPDATE CASCADE ON DELETE CASCADE
);

-----------------------------------------------------------------------
CREATE TABLE sprzedawca 
(
    id_sprzedawca           serial              PRIMARY KEY,
    imie                    varchar(30)         not null,
    nazwisko                varchar(30)         not null,
    nr_telefonu             varchar(15),
    e_mail                  varchar(50),
    id_komis                int,
    id_plac                 int,
    -- klucz obcy - powiazanie sprzedawcy z komisem
    CONSTRAINT              fk_komis_sprzedawca FOREIGN KEY(id_komis)
                            REFERENCES komis(id_komis)
                            ON UPDATE CASCADE ON DELETE CASCADE,
    -- klucz obcy - powiazanie sprzedawcy z placem
    CONSTRAINT              fk_plac_sprzedawca FOREIGN KEY(id_plac)
                            REFERENCES plac(id_plac)
                            ON UPDATE CASCADE ON DELETE CASCADE
);
------------------------------------------------------------------
CREATE TABLE faktura
(
    id_faktura              serial                  PRIMARY KEY,
    nr_faktury              varchar(10)             not null, 
    rabat                   smallint,
    sposob_zaplaty          varchar(30)             not null,
    czy_zaplacono           bool                    not null,
    UNIQUE(nr_faktury)
);
------------------------------------------------------------------------
CREATE TABLE klient 
(
    id_klient               serial               PRIMARY KEY,
    imie                    varchar(30)          not null,
    nazwisko                varchar(30)          not null,
    pesel_nip               varchar(11)          not null,
    rodzaj_dokumentu        varchar(50)          not null,
    nr_dokumentu            varchar(30)          not null,
    panstwo                 varchar(30),
    miasto                  varchar(50),
    ulica                   varchar(50),
    nr_domu                 int,
    nr_mieszkania           varchar(10),
    kod                     varchar(10),
    telefon                 varchar(15),
    UNIQUE(pesel_nip)
);
-----------------------------------------------------------------------
CREATE TABLE kartoteka_transakcji
(
    id_transakcja           serial                 PRIMARY KEY,
    rodzaj                  varchar(15)            not null,
    data_transakcji         date                   not null,
    samochod_w_rozliczeniu  bool                   not null,
    uwagi                   text,
    id_samochod             int,
    id_klient               int,
    id_sprzedawca           int,
    id_plac					int,
    id_faktura              int,
    -- klucz obcy - powiazanie transakcji z zakupionym/sprzedanym samochodem
    CONSTRAINT              fk_samochod_transakcja FOREIGN KEY(id_samochod)
                            REFERENCES samochod(id_samochod)
                            ON UPDATE CASCADE ON DELETE CASCADE,
    -- klucz obcy - powiazanie transakcji z klientem
    CONSTRAINT              fk_klient_transakcja FOREIGN KEY(id_klient)
                            REFERENCES klient(id_klient)
                            ON UPDATE CASCADE ON DELETE CASCADE,
    -- klucz obcy - powiazanie transakcji z placem
    CONSTRAINT              fk_plac_transakcja FOREIGN KEY(id_plac)
                            REFERENCES plac(id_plac)
                            ON UPDATE CASCADE ON DELETE CASCADE,
    -- klucz obcy - powiazanie transakcji ze sprzedajacym
    CONSTRAINT              fk_sprzedawca_transakcja FOREIGN KEY(id_sprzedawca)
                            REFERENCES sprzedawca(id_sprzedawca)
                            ON UPDATE CASCADE ON DELETE CASCADE,
    -- klucz obcy - powiazanie transakcji z faktura
    CONSTRAINT              fk_faktura_transakcja FOREIGN KEY(id_faktura)
                            REFERENCES faktura(id_faktura)
                            ON UPDATE CASCADE ON DELETE CASCADE
);
---------------------------------------------------------------------------------
-- Wstawienie rekordow do tabeli komis
INSERT INTO komis(nip, nazwa, panstwo, miasto, ulica, nr_budynku, nr_lokalu, kod_pocztowy, telefon, e_mail)
VALUES 
(7780213857, 'AutoKomis', 'Polska', 'Warszawa', 'Ul. Przykladowa', 1, 'A', '00-001', '123456789', 'kontakt@autokomis.pl'),
(1234567890, 'KomisCar', 'Polska', 'Kraków', 'Ul. Samochodowa', 2, 'B', '30-002', '987654321', 'info@komiscar.pl');

-- Wstawienie rekordow do tabeli plac
INSERT INTO plac(kraj, miejscowosc, ulica, nr_dzialki, id_komis)
VALUES
('Polska', 'Warszawa', 'Ul. Przykladowa', '100A', 1),
('Polska', 'Kraków', 'Ul. Samochodowa', '200B', 2);

-- Wstawienie rekordow do tabeli samochod
INSERT INTO samochod(nr_rejestracyjny, nr_vin, marka, model, rocznik, przebieg, silnik, paliwo, moc, kolor, rodzaj_pojazdu, ladownosc, gotowy_do_sprzedaży, cena, opis, id_plac)
VALUES 
('WAW1234', '1HGBH41JXMN109186', 'Toyota', 'Corolla', 2020, 50000, 1.8, 'Benzyna', 140, 'Czarny', 'Osobowy', NULL, true, 55000.00, 'Samochod w bardzo dobrym stanie', 1),
('KRK5678', '2HGBH41JXMN109187', 'Ford', 'Focus', 2019, 60000, 2.0, 'Diesel', 150, 'Biały', 'Osobowy', NULL, true, 60000.00, 'Małe uszkodzenie z tyłu', 2);

-- Wstawienie rekordow do tabeli dostawa
INSERT INTO dostawa(data_dostawy, kraj_pochodzenia, czy_zarejestrowany, czy_uszkodzony, id_plac, id_samochod)
VALUES
('2023-01-01', 'Niemcy', true, false, 1, 1),
('2023-02-01', 'Francja', false, true, 2, 2);

-- Wstawienie rekordow do tabeli sprzedawca
INSERT INTO sprzedawca(imie, nazwisko, nr_telefonu, e_mail, id_komis, id_plac)
VALUES 
('Jan', 'Kowalski', '123456789', 'jan.kowalski@autokomis.pl', 1, 1),
('Adam', 'Nowak', '987654321', 'adam.nowak@komiscar.pl', 2, 2);

-- Wstawienie rekordow do tabeli faktura
INSERT INTO faktura(nr_faktury, rabat, sposob_zaplaty, czy_zaplacono)
VALUES 
('F12345', 10, 'Przelew', true),
('F67890', 5, 'Gotówka', false);

-- Wstawienie rekordow do tabeli klient
INSERT INTO klient(imie, nazwisko, pesel_nip, rodzaj_dokumentu, nr_dokumentu, panstwo, miasto, ulica, nr_domu, nr_mieszkania, kod, telefon)
VALUES 
('Anna', 'Nowak', '12345678901', 'Dowód osobisty', 'ABC123456', 'Polska', 'Warszawa', 'Ul. Przykładowa', 1, 'A', '00-001', '123456789'),
('Piotr', 'Kowalski', '98765432109', 'Paszport', 'XYZ987654', 'Polska', 'Kraków', 'Ul. Samochodowa', 2, 'B', '30-002', '987654321');

-- Wstawienie rekordow do tabeli kartoteka_transakcji
INSERT INTO kartoteka_transakcji(rodzaj, data_transakcji, samochod_w_rozliczeniu, uwagi, id_samochod, id_klient, id_sprzedawca, id_plac, id_faktura)
VALUES 
('Sprzedaż', '2023-05-01', false, 'Brak uwag', 1, 1, 1, 1, 1),
('Kupno', '2023-06-01', true, 'Brak uwag', 2, 2, 2, 2, 2);
