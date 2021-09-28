/*Le città da cui partono voli per roma in ordine alfabetico*/
SELECT DISTINCT *
FROM Volo v
WHERE v.CittaArrivo = 'Roma'
ORDER BY v.CittaPartenza

/*Città con aeroporto con numero di piste non noto*/
SELECT a.Citta
FROM Aeroporto a
WHERE a.NumPiste IS NULL 

/*Per ogni volo misto (sia merci che passeggeri): codice volo e dati di trasporto*/
SELECT v.IdVolo, a.QtaMerci, a.NumPasseggeri
FROM Aereo a, Volo v
WHERE a.TipoAereo = v.TipoAereo 
AND a.QtaMerci > 0 AND a.NumPasseggeri > 0

/**/

