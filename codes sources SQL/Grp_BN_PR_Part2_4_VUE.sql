--Création de la quatrième Query
USE examenJuin

GO

SELECT Personne.Nom, Personne.Prenom, Personne.Team as 'Pays', Joueur.Height as 'Taille', Joueur.Weight as 'Poids', Joueur.Club
FROM Joueur
INNER JOIN Personne ON Joueur.Personne = Personne.Personneid
WHERE Joueur.Numero = 10
ORDER BY CASE Personne.Team
WHEN 'FRANCE' THEN 5 
WHEN 'CROATIA' THEN 4
WHEN 'BELGIUM' THEN 3
WHEN 'ENGLAND' THEN 2 END DESC