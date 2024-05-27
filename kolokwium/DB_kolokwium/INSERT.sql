INSERT INTO czytelnik(nr_karty,imię,nazwisko,data_rejestracji)
VALUES (1234,'John','Dolittle','2018-10-07');
INSERT INTO czytelnik(nr_karty,imię,nazwisko,data_rejestracji)
VALUES (2345,'Ignacy','Dziewierski','2013-05-15');
INSERT INTO czytelnik(nr_karty,imię,nazwisko,data_rejestracji)
VALUES (3456,'Eugeniusz','Oniegin','2018-12-13');
INSERT INTO czytelnik(nr_karty,imię,nazwisko,data_rejestracji)
VALUES (4567,'Tadeusz','Soplica','2023-12-18');
INSERT INTO czytelnik(nr_karty,imię,nazwisko,data_rejestracji)
VALUES (5678,'Ebenezer','Scrooge','2007-03-12');
INSERT INTO czytelnik(nr_karty,imię,nazwisko,data_rejestracji)
VALUES (6789,'Jan Onufry','Zagłoba','2011-11-11');

INSERT INTO autor(imię,nazwisko)
VALUES ('Hugh','Lofting');
INSERT INTO autor(imię,nazwisko)
VALUES ('Julian','Tuwim');
INSERT INTO autor(imię,nazwisko)
VALUES ('Aleksander','Puszkin');
INSERT INTO autor(imię,nazwisko)
VALUES ('Adam','Mickiewicz');
INSERT INTO autor(imię,nazwisko)
VALUES ('Charles','Dickens');
INSERT INTO autor(imię,nazwisko)
VALUES ('Henryk','Sienkiewicz');
INSERT INTO autor(pseudonim)
VALUES ('Anonim');

InSERT INTO ksiazka(isbn,nazwa,wydanie,wydawnictwo,autor)
VALUES ('9788310133984','Doktor Dolittle i jego zwierzęta','2019','Nasza Księgarnia',1);
InSERT INTO ksiazka(isbn,nazwa,wydanie,wydawnictwo,autor)
VALUES ('9788324234561','Lokomotywa','2020','Universitas',2);
InSERT INTO ksiazka(isbn,nazwa,wydanie,wydawnictwo,autor)
VALUES ('9788389052162','Dyzio marzyciel','2004','LIWONA',2);
InSERT INTO ksiazka(isbn,nazwa,wydanie,wydawnictwo,autor)
VALUES ('9788380084964','Bajka o rybaku i rybce','2019','Media Rodzina',3);
InSERT INTO ksiazka(isbn,nazwa,wydanie,wydawnictwo,autor)
VALUES ('9788372724083','Pan Tadeusz','2022','G&P',4);

INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788310133984','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788310133984','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788310133984','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788310133984','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788310133984','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788324234561','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788324234561','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788324234561','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788324234561','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788389052162','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788389052162','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788389052162','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788389052162','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788380084964','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788380084964','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788380084964','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788380084964','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788380084964','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788380084964','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2000-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2014-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788380084964','2010-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788380084964','2010-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2010-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2010-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2010-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2010-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2010-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2010-01-01');
INSERT INTO egzemplarz(książka,data_zakupu)
VALUES ('9788372724083','2010-01-01');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788372724083','2020-01-01',1234,'2024-05-25','2024-06-25');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788372724083','2020-01-01',2345,'2024-05-25','2024-06-25');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788372724083','2020-01-01',3456,'2024-05-25','2024-06-25');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788380084964','2020-01-01',1234,'2024-04-27','2024-05-27');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788380084964','2020-01-01',2345,'2024-04-27','2024-05-27');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788380084964','2020-01-01',3456,'2024-04-27','2024-05-27');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788324234561','2020-01-01',1234,'2024-04-21','2024-05-21');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788324234561','2020-01-01',2345,'2024-04-21','2024-05-21');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788324234561','2020-01-01',3456,'2024-04-21','2024-05-21');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788324234561','2020-01-01',4567,'2024-04-21','2024-05-21');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788324234561','2020-01-01',5678,'2024-04-21','2024-05-21');
INSERT INTO egzemplarz(książka,data_zakupu,aktualne_wypożyczenie,data_wyp,przewidywana_data_zwr)
VALUES ('9788324234561','2020-01-01',6789,'2024-04-21','2024-05-21');

INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (1234,1,'2023-05-30','2023-06-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (1234,8,'2023-05-30','2023-06-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (2345,34,'2023-06-25','2023-06-28');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (2345,47,'2023-06-25','2023-07-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (3456,29,'2023-04-30','2023-06-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (3456,39,'2023-04-30','2023-05-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (3456,42,'2023-04-30','2023-05-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (4567,1,'2023-06-30','2023-07-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (4567,2,'2023-06-30','2023-07-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (4567,3,'2023-06-30','2023-07-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (5678,1,'2024-04-30','2024-05-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (5678,2,'2024-04-30','2024-05-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (5678,3,'2024-04-30','2024-05-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (6789,1,'2023-05-30','2023-06-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (6789,1,'2023-06-30','2023-07-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (6789,1,'2023-08-30','2023-09-12');
INSERT INTO wypozyczenia_archiwalne(czytelnik,egzemplarz,data_wyp,data_zwr)
VALUES (6789,1,'2023-09-30','2023-10-12');
