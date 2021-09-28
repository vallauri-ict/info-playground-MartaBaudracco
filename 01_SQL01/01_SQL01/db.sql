CREATE TABLE Impiegato(
	nome varchar(30) PRIMARY KEY,
	titolo varchar(50),
	eta int NOT NULL,
	salario decimal(12,2),
	dip char(1)
);
CREATE TABLE [dbo].[Cliente]
(
	[IdCliente] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Nome] VARCHAR(30) NOT NULL, 
    [Cognome] VARCHAR(50) NOT NULL, 
    [Citta] VARCHAR(50) NOT NULL, 
    [Stato] VARCHAR(3) NOT NULL
);
CREATE TABLE [dbo].[Acquisto]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdCliente] INT NOT NULL, 
    [DataDiOrdinazione] DATE NOT NULL, 
    [Item] INT NOT NULL, 
    [Quantita] INT NOT NULL, 
    [Prezzo] DECIMAL(12, 2) NOT NULL
);

INSERT INTO Cliente (Nome, Cognome, Citta,Stato)
VALUES('Alberto','Tomba','Pinerolo','IT'),
('Paperino','Pape','Fossano','IT'),
('Alberto','barbero','Mondovì','IT');

INSERT INTO Impiegato VALUES
('Edoardo','',18,1500,'s'),
('Ivan','',20,1200,'s'),
('Marta','',19,1300,'s');

INSERT INTO Acquisto(IdCliente,DataDiOrdinazione,Item,Quantita,Prezzo)
VALUES(1,'2000-12-20',1,3,50),
(1,'2020-01-13',2,4,60),
(2,'2020-02-10',2,10,55);