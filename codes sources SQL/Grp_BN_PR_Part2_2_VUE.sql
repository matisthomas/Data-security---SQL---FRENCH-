-- Création de la seconde Query
USE examenJuin

GO

SELECT Personne.Nom, Personne.Team
FROM Joueur
INNER JOIN Personne ON Joueur.Personne = Personne.PersonneId
WHERE Joueur.Pos = 'GK'