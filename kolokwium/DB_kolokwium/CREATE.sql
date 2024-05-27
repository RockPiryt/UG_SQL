CREATE TABLE czytelnik ( 
  nr_karty INT PRIMARY KEY, 
  imię VARCHAR(20) NOT NULL, 
  nazwisko VARCHAR(20) NOT NULL, 
  data_rejestracji DATE 
); 

CREATE TABLE autor ( 
  id_aut SERIAL PRIMARY KEY, 
  imię VARCHAR(20), 
  nazwisko VARCHAR(20), 
  pseudonim VARCHAR(20) 
); 

CREATE TABLE ksiazka ( 
  ISBN VARCHAR(13) PRIMARY KEY, 
  nazwa VARCHAR(50) NOT NULL, 
  wydanie varchar(4), 
  wydawnictwo varchar(20), 
  autor INT REFERENCES autor(id_aut) 
); 

CREATE TABLE egzemplarz ( 
  id_egz SERIAL PRIMARY KEY, 
  książka VARCHAR(13) REFERENCES ksiazka(isbn), 
  data_zakupu DATE, 
  aktualne_wypożyczenie INT REFERENCES czytelnik(nr_karty), 
  data_wyp DATE, 
  przewidywana_data_zwr DATE 
); 

CREATE TABLE wypozyczenia_archiwalne ( 
  czytelnik INT REFERENCES czytelnik(nr_karty), 
  egzemplarz INT REFERENCES egzemplarz(id_egz), 
  data_wyp DATE, 
  data_zwr DATE, 
  PRIMARY KEY (czytelnik, egzemplarz, data_wyp) 
); 

 