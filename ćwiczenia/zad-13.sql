-- wymień pary zamówień pochodzących od tego samego klienta
SELECT Z1.nr AS zam1, Z2.nr AS zam2, Z2.klient_nr
FROM zamowienie AS Z1, zamowienie Z2
WHERE Z1.klient_nr=Z2.klient_nr
      AND z1.nr<z2.nr;

--moje bardziej czytelne
/*
SELECT 
	Z1.nr AS zam1
	, Z2.nr AS zam2
	, Z2.klient_nr
FROM zamowienie AS Z1, zamowienie AS Z2
WHERE Z1.klient_nr=Z2.klient_nr AND z1.nr<z2.nr;
*/

-- zad P13: wymień pary klientów mieszkających w tym samym mieście.
SELECT 
	CONCAT(k1.imie,' ',k1.nazwisko) AS klient_1
	, CONCAT(k2.imie,' ', k2.nazwisko) AS klient_2
	, k2.miasto AS wspolne_miasto
FROM klient AS k1, klient AS k2
WHERE k1.miasto=k2.miasto AND k1.nr<k2.nr;

-- Wymień pary towarów mających tę samą cenę oraz pary z tym samym kosztem.

-- ta sama cena
SELECT 
	t1.opis AS towar_1
	, t2.opis AS towar_2
	, t2.cena AS wspolna_cena
FROM towar AS t1, towar AS t2
WHERE t1.cena=t2.cena AND t1.nr<t2.nr
;

-- ten sam koszt
SELECT 
	t1.opis AS towar_1
	, t2.opis AS towar_2
	, t2.koszt AS wspolna_koszt_cena
FROM towar AS t1, towar AS t2
WHERE t1.koszt=t2.koszt AND t1.nr<t2.nr
;

--UNION
SELECT 
	t1.opis AS towar_1
	, t2.opis AS towar_2
	, t2.koszt AS wspolna_koszt_cena
FROM towar AS t1, towar AS t2
WHERE t1.koszt=t2.koszt AND t1.nr<t2.nr
UNION ALL
SELECT 
	t1.opis AS towar_1
	, t2.opis AS towar_2
	, t2.cena AS wspolna_cena
FROM towar AS t1, towar AS t2
WHERE t1.cena=t2.cena AND t1.nr<t2.nr;


