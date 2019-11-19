-- 3 tables temporaires
-- La table SQLAll contient toutes les informations brutes des dataSet
-- La table SQLAllPlusClubsAvecPays contient les mêmes informations avec les clubs et les pays (ainsi que plus bah l'ajout de l'ID de chaque personne)
-- la table tempcoachpers contient la liste de tous les coachs (ID,Nom,Prenom,Team)

-- Remplissage de la table Pays avec toutes les équipes nationnales
INSERT INTO dbo.Pays (NomPays) SELECT DISTINCT Team FROM SQLAll
GO


-- Remplissage de la table des positions des joueurs avec les positions possibles.
INSERT INTO dbo.Pos (NomPos) SELECT DISTINCT Pos_ FROM SQLAll
GO


-- Remplissage de la table Club (Nom du club + pays)
INSERT INTO dbo.Club (NomClub, Pays)
SELECT DISTINCT Club, Nationalite_Club FROM dbo.SQLAllPlusClubsAvecPays
GO


-- Remplissage de la table Personne
-- Team = equipe nationnale
INSERT INTO dbo.Personne(Nom,Prenom,Team)
SELECT Nom,Prenom, Team FROM dbo.SQLAllPlusClubsAvecPays
WHERE Nom IS NOT NULL
GO


-- Ajout des coach dans la table Personne depuis la table temporaire "tempcoachpers"
INSERT INTO dbo.Personne(Nom,Prenom,Team)
SELECT Nom,Prenom,Team FROM tempcoachpers
GO


-- Remplissage de la table coach avec un T-SQL
-- on passe en revu la table tempcoachpers et pour chaque nom on compare avec la table Personne pour récupérer le PersonneID du coach.
DECLARE @Mycounter int;
SET @Mycounter = 0;
WHILE(@MyCounter < 32)
BEGIN;
    DECLARE @varNom nvarchar(50);
    DECLARE @varNatio nvarchar(50);
    DECLARE @varPersID int;
    SELECT @varNom = Nom FROM dbo.tempcoachpers WHERE ID=@MyCounter;
    SELECT @varNatio = Nationalite FROM dbo.tempcoachpers WHERE ID=@MyCounter;
    SELECT @varPersID = PersonneId FROM dbo.Personne WHERE Nom=@varNom;
    INSERT INTO dbo.Coach(PersonneId,Nationalite) VALUES (@varPersID,@varNatio);
    SET @MyCounter = @MyCounter +1;
END;
GO


-- Avant de remplir Joueur, on doit récupérer l'ID (qui a été généré par la DB dans la table Joueur) et l'ajouter à notre table temporaire
MERGE INTO dbo.SQLAllPlusClubsAvecPays T
	USING dbo.Personne S
	on T.prenom = S.prenom AND T.nom = S.nom
WHEN MATCHED THEN
	UPDATE
		SET T.PersonneID = S.PersonneId;
GO


-- En une requête il est maintenant possible de remplir la table Joueur.
INSERT INTO dbo.Joueur(Personne,Numero,Pos,NomFifa,DateNaissance,ShirtName,Club,Height,Weight)
SELECT PersonneID as Personne,
Num as Numero,
Pos,
FIFA_Popular_Name as NomFifa,
DateNaissance,
Shirt_Name as ShirtName,
Club,Height,Weight
FROM dbo.SQLAllPlusClubsAvecPays
WHERE DateNaissance IS NOT NULL;
GO