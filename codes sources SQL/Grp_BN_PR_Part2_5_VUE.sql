--Création de la cinquième Query
USE examenJuin

GO

SELECT Personne.Prenom + ' ' + Personne.Nom as 'Nom', Joueur.DateNaissance as 'Date de naissance'
FROM Joueur
INNER JOIN Personne ON Joueur.Personne = Personne.Personneid
WHERE (((DATEPART(month, Joueur.DateNaissance) = 2 AND DATEPART(day, Joueur.DateNaissance) >= 20 )
OR (DATEPART(month, Joueur.DateNaissance) =3 AND DATEPART(day,Joueur.DateNaissance) <= 20))
OR(
(DATEPART(month, Joueur.DateNaissance) = 12 AND DATEPART(day, Joueur.DateNaissance) >= 20 )
OR (DATEPART(month, Joueur.DateNaissance) =1 AND DATEPART(day,Joueur.DateNaissance) <= 20)))

ORDER BY Personne.Nom