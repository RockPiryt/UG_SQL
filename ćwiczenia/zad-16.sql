-- wstaw do tabeli klientów nowego klienta, nie podając jego telefonu.
insert into klient(tytul, nazwisko, imie, kod_pocztowy, miasto, ulica_dom, telefon)
   values('Pani','Szczęsna','Jadwiga','81-444','Gdynia','Bema 41a/12',NULL);
insert into klient(tytul, nazwisko, imie, kod_pocztowy, miasto, ulica_dom)
   values('Pan','Łukowski','Bernard','81-620','Gdynia','Górnicza 29');

-- wstaw do tabeli towarów towar, którego opis zawiera znak apostrofu.  
insert into towar(opis, koszt, cena) 
   values(E'ramka do fotografii 4\'x6\'', 7.54, 9.95);

-- wstaw do zamówienie, użyj "bezpiecznego" formatu daty ISO, 
-- tj. niezależnego od stylu daty
insert into zamowienie(klient_nr, data_zlozenia, data_wysylki, koszt_wysylki) 
       values(3,'2021-02-13',NULL, 2.99);

-- zad 16: wstaw nowy kod kreskowy dla jakiegoś towaru
insert into kod_kreskowy(kod, towar_nr) 
       values(1112255446699,20);
-- i dwa inne kody nie podając towaru, któremu odpowiadają.
insert into kod_kreskowy(kod, towar_nr) 
       values(1119988445566, NULL);

insert into kod_kreskowy(kod) 
       values(1117766445566);


-- Wstaw klienta o nazwisku O'Hara.
insert into klient(tytul, nazwisko, imie, kod_pocztowy, miasto, ulica_dom, telefon)
   values('Pan', E'O\'Hara', 'Tom', '81-210','Morag','Lema 12', '570-112-255')
   
';

-- Wstaw zamówienie, nie podając daty wysyłki, użyj formatu daty ISO
insert into zamowienie(klient_nr, data_zlozenia, data_wysylki, koszt_wysylki) 
       values(15,'2021-02-15',NULL, 5.99);
