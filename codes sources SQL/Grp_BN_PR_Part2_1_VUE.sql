-- Première Query
USE examenJuin

GO

SELECT Personne.Nom, Personne.Team 
FROM Joueur
INNER JOIN Personne ON Joueur.Personne = Personne.PersonneId
ORDER BY Joueur.Height, Personne.Team