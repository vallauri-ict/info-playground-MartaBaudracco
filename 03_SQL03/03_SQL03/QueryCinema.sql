/*2- Il titolo dei film di F. Fellini prodotti dopo il 1960.*/
SELECT Titolo
FROM Film
WHERE Regista = 'F. Fellini' AND AnnoProduzione > 1960

/*3- Il titolo e la durata dei film di fantascienza giapponesi o francesi prodotti dopo il 1990*/
SELECT f.Titolo, f.Durata
FROM Film f
WHERE f.Genere = 'fantascienza' AND f.Nazionalità = 'JP' OR f.Nazionalità = 'FR'  AND f.AnnoProduzione > 1990

/*4- Il titolo dei film di fantascienza giapponesi prodotti dopo il 1990 oppure francesi*/
SELECT Titolo
FROM Film
WHERE Genere = 'fantascienza' AND ((Nazionalità = 'JP' AND AnnoProduzione > 1990)
	  OR Nazionalità = 'FR')

/*5- I titolo dei film dello stesso regista di “Casablanca”*/
SELECT f.Titolo
FROM Film f
WHERE f.Regista = (SELECT f1.Regista FROM Fil f1 WHERE f1.Titolo = 'Casablanca')

/*6- Il titolo ed il genere dei film proiettati il giorno di Natale 2004*/
SELECT DISTINCT f.Titolo, f.Genere
FROM Film f 
INNER JOIN Proiezioni p
ON f.CodFil=p.CodFilm
WHERE p.DataProiezioni = '25/12/2004'

/*7- Il titolo ed il genere dei film proiettati a Napoli il giorno di Natale 2004*/
SELECT f.Titolo, f.Genere
FROM Film f 
INNER JOIN Proiezioni p
ON f.CodFil=p.CodFilm
INNER JOIN Sale s
ON p.CodSala = s.CodSala
WHERE p.DataProiezioni = '20041225' AND s.Città = 'Napoli'

/*8- I nomi delle sale di Napoli in cui il giorno di Natale 2004 è stato proiettato un film con R.Williams*/
SELECT s.Nome
FROM Sale s
INNER JOIN Proiezioni p
ON s.CodSala = p.CodSala
INNER JOIN Recita r
ON p.CodFilm = r.CodFilm
INNER JOIN Attori a
ON r.CodAttore = a.CodAttore
WHERE a.Nome = 'R.Williams' AND s.Città = 'Napoli' AND p.DataProiezioni = '20041225'

/*9- Il titolo dei film in cui recita M. Mastroianni oppure S.Loren*/
SELECT f.Titolo
FROM Film f
INNER JOIN Recita
ON r.CodFilm = f.CodFilm
INNER JOIN Attori a
ON a.CodAttore = r.CodAttore
WHERE a.Nome = 'M. Mastroianni' OR a.Nome = 'S. Loren'

/*10- Il titolo dei film in cui recitano M. Mastroianni e S.Loren*/
SELECT f.Titolo
FROM Film f
INNER JOIN Recita
ON r.CodFilm = f.CodFilm
INNER JOIN Attori a
ON a.CodAttore = r.CodAttore
WHERE f.CodFilm IN
(SELECT f.CodFilm
FROM Film f
INNER JOIN Recita
ON r.CodFilm = f.CodFilm
INNER JOIN Attori a
ON a.CodAttore = r.CodAttore
WHERE a.Nome = 'M. Mastroianni') AND a.Nome = 'S.Loren'

/*11- Per ogni film in cui recita un attore francese, il titolo del film e il nome dell’attore*/
SELECT f.Titolo, a.Nome
FROM Film f
INNER JOIN Recita r
ON r.CodFilm = f.CodFilm
INNER JOIN Attori a
ON a.CodAttore = r.CodAttore
WHERE a.Nazionalità = 'FR'

/*12- Per ogni film che è stato proiettato a Pisa nel gennaio 2005, il titolo del film e il nome della sala.*/
SELECT f.Titolo, s.Nome
FROM Film f
INNER JOIN Proiezioni p
ON p.CodFilm = f.CodFilm
INNER JOIN Sale s
ON s.CodSala = p.CodSala
WHERE s.Città = 'Pisa' AND p.DataProiezioni between '20050101' and p.DataProiezioni

/*13- Il numero di sale di Pisa con più di 60 posti*/
SELECT COUNT (*)
FROM Sale s
WHERE s.Posti > '60' AND s.Città = 'Pisa'

/*14- Il numero totale di posti nelle sale di Pisa*/
SELECT SUM (s.Posti)
FROM Sale s
WHERE s.Città = 'Pisa'

/*15- Per ogni città, il numero di sale*/
SELECT SUM (s.Posti), s.Città
FROM Sale s
GROUP BY s.Città


/*16- Per ogni città, il numero di sale con più di 60 posti
17- Per ogni regista, il numero di film diretti dopo il 1990
18- Per ogni regista, l’incasso totale di tutte le proiezioni dei suoi film
19- Per ogni film di S.Spielberg, il titolo del film, il numero totale di proiezioni a Pisa e l’incasso
totale
20- Per ogni regista e per ogni attore, il numero di film del regista con l’attore
21 - Il regista ed il titolo dei film in cui recitano meno di 6 attori
22- Per ogni film prodotto dopo il 2000, il codice, il titolo e l’incasso totale di tutte le sue proiezioni
23 - Il numero di attori dei film in cui appaiono solo attori nati prima del 1970
24- Per ogni film di fantascienza, il titolo e l’incasso totale di tutte le sue proiezioni
25- Per ogni film di fantascienza il titolo e l’incasso totale di tutte le sue proiezioni successive al
1/1/01
26- Per ogni film di fantascienza che non è mai stato proiettato prima del 1/1/01 il titolo e l’incasso
totale di tutte le sue proiezioni
27- Per ogni sala di Pisa, che nel mese di gennaio 2005 ha incassato più di 20000 €, il nome della sala
e l’incasso totale (sempre del mese di gennaio 2005)
28- I titoli dei film che non sono mai stati proiettati a Pisa
29- I titoli dei film che sono stati proiettati solo a Pisa
30- I titoli dei film dei quali non vi è mai stata una proiezione con incasso superiore a 500 €
31- I titoli dei film le cui proiezioni hanno sempre ottenuto un incasso superiore a 500 €
32- Il nome degli attori italiani che non hanno mai recitato in film di Fellini
33- Il titolo dei film di Fellini in cui non recitano attori italiani
34- Il titolo dei film senza attori
35- Gli attori che prima del 1960 hanno recitato solo nei film di Fellini
36- Gli attori che hanno recitato in film di Fellini solo prima del 1960*/