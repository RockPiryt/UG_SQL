/* z tabel klientów, zamówienień i ich pozycji oblicz zysk 
   na poszczególnych towarach dla poszczególnych klientów
*/
SELECT 
	imie, nazwisko -- z tabeli klientów
	, opis -- z tabeli towar
	, sum(ilosc) -- z tabeli pozycja
	, sum(ilosc) * (cena - koszt) AS zysk -- z tabeli pozycja oraz towar
FROM  (( klient INNER JOIN zamowienie ON klient.nr = zamowienie.klient_nr) INNER JOIN pozycja ON zamowienie.nr = pozycja.zamowienie_nr) INNER JOIN towar ON pozycja.towar_nr = towar.nr
GROUP BY klient.nr, towar.nr
;

-- zad P9: uporządkuj powyższy wydruk w/g klientów

SELECT 
	kl.nr,kl.imie, kl.nazwisko -- z tabeli klientów
	, tow.opis -- z tabeli towar
	, sum(poz.ilosc) -- z tabeli pozycja
	, sum(poz.ilosc) * (tow.cena - tow.koszt) AS zysk -- z tabeli pozycja oraz towar
FROM  (( klient AS kl INNER JOIN zamowienie AS zam ON kl.nr = zam.klient_nr) INNER JOIN pozycja AS poz ON zam.nr = poz.zamowienie_nr) INNER JOIN towar AS tow ON poz.towar_nr = tow.nr
GROUP BY kl.nr, tow.nr
ORDER BY kl.nr


-- odrzuć wiersze, dla których nie da się określić zysku.(mają wartość NULL w tabeli zysk)

SELECT 
	kl.nr,kl.imie, kl.nazwisko -- z tabeli klientów
	, tow.opis -- z tabeli towar
	, sum(poz.ilosc) -- z tabeli pozycja
	, sum(poz.ilosc) * (tow.cena - tow.koszt) AS zysk -- z tabeli pozycja oraz towar
FROM  (( klient AS kl INNER JOIN zamowienie AS zam ON kl.nr = zam.klient_nr) INNER JOIN pozycja AS poz ON zam.nr = poz.zamowienie_nr) INNER JOIN towar AS tow ON poz.towar_nr = tow.nr
WHERE tow.cena IS NOT NULL
GROUP BY kl.nr, tow.nr
ORDER BY kl.nr

