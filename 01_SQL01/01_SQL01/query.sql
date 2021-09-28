/* 1 - Selezionare il nome, l'età e il salario degli impiegati con più di 50 anni */
SELECT nome,eta,salario
FROM Impiegato
WHERE eta>salario;

/* 2 - Selezionare le informazioni degli acquisti di item 2 */
SELECT *
FROM Acquisto
WHERE Item=2;

/* 3 - Selezionare nome, titolo e salario dei programmatori con salario > 1400 */
SELECT nome,titolo,salario
FROM Impiegato
WHERE salario>1400
AND titolo='Programmatore'

/* 4 - Selezionare nome di tutti i Programmatori e analisti */
SELECT nome
FROM Impiegato
WHERE titolo='Programmatore'
OR titolo='Analista'

/* 5 - Selezionare le diverse età degli impiegati */
SELECT DISTINCT eta
FROM Impiegato

/* 6 - Calcolare lo stipendio medio degli impiegati */
SELECT AVG(salario)
FROM Impiegato

/* 7 - Selezionare tutti i dati di impiegato ordinati per salario dal > al < */
SELECT *
FROM Impiegato
ORDER BY salario DESC

/* 8 - Selezionare tutti i dati di impiegato ordinati per salaro e per età dal > al < */
SELECT *
FROM Impiegato
ORDER BY salario DESC, eta DESC

/* 9 - Selezionare tutti i dati degli impiegati Marta, Fabio e Ivan */
SELECT *
FROM Impiegato
WHERE nome IN('Marta','Fabio','Ivan') /* = OR */

/* 10 - Selezionare tutti i dati degli impiegati tranne Marta, Fabio e Ivan */
SELECT *
FROM Impiegato
WHERE nome NOT IN('Marta','Fabio','Ivan')

/* 11 - Selezionare tutti i dati degli impiegati compresa tra 20 e 30 */
SELECT *
FROM Impiegato
WHERE eta BETWEEN 20 AND 30

/* 12 - Selezionare per ogni acquisto il nome del cliente e il prezzo del prodotto */
SELECT c.Nome,a.Prezzo
FROM Acquisto a, Cliente c
WHERE a.IdCliente=c.IdCliente

