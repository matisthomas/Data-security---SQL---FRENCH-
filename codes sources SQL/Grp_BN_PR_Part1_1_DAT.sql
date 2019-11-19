-- Creation de la base de donnees
USE master
GO
IF NOT EXISTS (
	SELECT name
	FROM sys.databases
	WHERE name = N'examenJuin'
	)
CREATE DATABASE [examenJuin]
GO

-- Creation des tables --

USE examenJuin
GO

-- table Pays

CREATE TABLE dbo.Pays
(
	NomPays	[NVARCHAR](50)	NOT NULL	PRIMARY KEY
);
GO

-- table Personne

CREATE TABLE dbo.Personne
(
	PersonneId	INT 			NOT NULL	IDENTITY(1,1)  PRIMARY KEY,
	Nom 		[NVARCHAR](50)	NOT NULL,
	Prenom		[NVARCHAR](50)	NOT NULL,
	Team		[NVARCHAR](50)	NOT NULL	FOREIGN KEY REFERENCES dbo.Pays(NomPays)
);
GO

-- table Coach

CREATE TABLE dbo.Coach
(
    PersonneId  INT             NOT NULL    PRIMARY KEY FOREIGN KEY REFERENCES dbo.Personne(PersonneId),
    Nationalite [NVARCHAR](50)  NOT NULL    FOREIGN KEY REFERENCES dbo.Pays(NomPays)

);
GO
-- table Club

CREATE TABLE dbo.Club
(
    NomClub [NVARCHAR](50)  NOT NULL    PRIMARY KEY,
    Pays    [NVARCHAR](50)  NOT NULL    FOREIGN KEY REFERENCES dbo.Pays(NomPays)
);
GO
-- table Pos 

CREATE TABLE dbo.Pos
(
    NomPos [NVARCHAR](50)  NOT NULL    PRIMARY KEY
);
GO


-- table Joueur

CREATE TABLE dbo.Joueur
(
    Personne        INT  NOT NULL    PRIMARY KEY FOREIGN KEY REFERENCES dbo.Personne(PersonneId),
    Numero          INT             NOT NULL,
    Pos             [NVARCHAR](50)  NOT NULL    FOREIGN KEY REFERENCES dbo.Pos(NomPos),
    NomFifa         [NVARCHAR](50)  NOT NULL,
    DateNaissance   DATE            NOT NULL,
    ShirtName       [NVARCHAR](50),
    Club            [NVARCHAR](50)  NOT NULL    FOREIGN KEY REFERENCES dbo.Club(NomClub),
    Height          INT,
    Weight          INT

);
GO