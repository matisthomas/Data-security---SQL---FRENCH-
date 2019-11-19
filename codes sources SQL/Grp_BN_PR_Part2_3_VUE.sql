--Création de la troisième Query
USE examenJuin

GO

SELECT Club.Pays, COUNT (*) as 'Total Joueurs'
FROM Joueur
INNER JOIN Club ON Joueur.Club = Club.NomClub
WHERE Club.Pays = 'SPAIN' OR Club.Pays = 'ENGLAND' OR Club.Pays = 'GERMANY'
GROUP BY Club.Pays
