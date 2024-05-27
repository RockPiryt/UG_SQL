CREATE TABLE komis 
(
    id_komis                int                  PRIMARY KEY,
    nip                     int                  not null,
    nazwa                   varchar(30)          not null,
    panstwo                 varchar(30)          not null,
    miasto                  varchar(30)          not null,
    ulica                   varchar(30)          not null,
    nr_budynku              varchar(50)          not null,
    nr_lokalu               varchar(30),
    kod_pocztowy            varchar(30)          not null,
    telefon                 int,
    e_mail                  varchar(30),
    UNIQUE(id_komis,nip)
);

CREATE TABLE plac 
(
    id_plac                 int             PRIMARY KEY,
    kraj                    varchar(30)     not null,
    miejscowosc             varchar(30)     not null,
    ulica                   varchar(30)     not null,
    nr_działki              int             not null,
    id_komis                int,
    -- klucz obcy - powiazanie placu z komisem
    CONSTRAINT              fk_komis FOREIGN KEY(id_komis)
                            REFERENCES komis(id_komis)
                            ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE samochod 
(
    id_samochod             int             PRIMARY KEY,
    nr_rejestracyjny        varchar(10),
    marka                   varchar(30)     not null,
    model                   varchar(30)     not null,
    rocznik                 int             not null,
    przebieg                float           not null,
    silnik                  float           not null,
    paliwo                  varchar(30)     not null,
    moc                     int             not null,
    kolor                   varchar(30)     not null,
    rodzaj_pojazdu          varchar(30)     not null,
    ladownosc               float,
    gotowy_do_sprzedaży     bool            not null,
    id_plac                 int,
    -- klucz obcy - powiazanie samocodu z placem
    CONSTRAINT              fk_plac FOREIGN KEY(id_plac)
                            REFERENCES plac(id_plac)
                            ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE sprzedawca 
(
    id_sprzedawca           int                 PRIMARY KEY,
    imie                    varchar(30)         not null,
    nazwisko                varchar(30)         not null,
    nr_telefonu             int,
    e_mail                  varchar(50),
    id_komis                int,
    UNIQUE(id_sprzedawca, id_komis),
    -- klucz obcy - powiazanie sprzedawcy z komisem
    CONSTRAINT              fk_komis FOREIGN KEY(id_komis)
                            REFERENCES komis(id_komis)
                            ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE faktura
(
    id_faktura              int                  PRIMARY KEY,
    kwota                   float                not null,
    waluta                  varchar(10)          not null,
    rabat                   int,
    sposob_zaplaty          varchar(30),
    czy_zaplacono           bool
);


CREATE TABLE kartoteka_zlecen
(
    id_transakcja           int                  PRIMARY KEY,
    rodzaj                  varchar(15)          not null,
    data_sprzedaży          date                 not null,
    samochod_w_rozliczeniu  bool,
    uwagi                   varchar(50),
    id_samochod             int,
    id_sprzedawca           int,
    id_faktura              int,
    UNIQUE(id_transakcja),
    -- klucz obcy - powiazanie transakcji z zakupionym/sprzedanym samochodem
    CONSTRAINT              fk_samochod FOREIGN KEY(id_samochod)
                            REFERENCES samochod(id_samochod)
                            ON UPDATE CASCADE ON DELETE SET NULL,
    -- klucz obcy - powiazanie transakcji ze sprzedajacym
    CONSTRAINT              fk_sprzedawca FOREIGN KEY(id_sprzedawca)
                            REFERENCES sprzedawca(id_sprzedawca)
                            ON UPDATE CASCADE ON DELETE SET NULL,
    -- klucz obcy - powiazanie transakcji z faktura
    CONSTRAINT              fk_faktura FOREIGN KEY(id_faktura)
                            REFERENCES faktura(id_faktura)
                            ON UPDATE CASCADE ON DELETE SET NULL
    
);


CREATE TABLE klient 
(
    id_klient               int                  PRIMARY KEY,
    imie                    varchar(30)          not null,
    nazwisko                varchar(30)          not null,
    pesel                   int,
    nip                     int,
    rodzaj_dokumentu        varchar(50)          not null,
    nr_dokumentu            varchar(30)          not null,
    panstwo                 varchar(30),
    miasto                  varchar(50),
    ulica                   varchar(50),
    nr_domu                 int,
    nr_mieszkania           int,
    kod                     varchar(10),
    nr_telefonu             int,
    id_transakcja           int,
    UNIQUE(id_klient,pesel,id_transakcja),
    -- klucz obcy - powiazanie klienta z nr transakcji
    CONSTRAINT              fk_transakcja FOREIGN KEY(id_transakcja)
                            REFERENCES kartoteka_zlecen(id_transakcja)
                            ON UPDATE CASCADE ON DELETE SET NULL
);




