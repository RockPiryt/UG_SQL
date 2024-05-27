-- obliczenia na podstawie atrybutów, nazwy dla wyświetlanych atrybutów:
-- wyświetl dane o zysku dla towarów
SELECT *,cena-koszt AS zysk FROM towar
;
SELECT *,cena-koszt AS zysk FROM towar ORDER BY zysk DESC
;

-- zad P3: wyświetl dane o procentowym zysku w stosunku do kosztów 
SELECT 
	*
    ,cena-koszt AS zysk 
    ,ROUND((cena-koszt)/ koszt, 2)*100 AS procent
FROM towar
;
-- wyświetl dane o czasie realizacji zamówień (różnica dat złożenia i wysyłki
-- zamówienia).
SELECT 
	*
	,AGE(z.data_wysylki, z.data_zlozenia) AS czas_realizacji
FROM zamowienie AS z
;

SELECT 
	*
--	,EXTRACT('days' FROM AGE(z.data_wysylki, z.data_zlozenia)) AS czas_realizacji
    ,COALESCE(CAST(z.data_wysylki AS CHAR(10)), 'UNKNOWN') AS data_bez_null
    ,CASE
       WHEN EXTRACT('days' FROM AGE(z.data_wysylki, z.data_zlozenia)) IS NULL THEN 'nie_wyslane'
       ELSE CAST(EXTRACT('days' FROM AGE(z.data_wysylki, z.data_zlozenia)) AS CHAR(10))
     END AS czas_bez_null
FROM zamowienie AS z
;






