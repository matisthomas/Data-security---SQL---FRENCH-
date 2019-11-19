-- interdit l'access aux informations personnelles pour les comptes viewer et NoRight
use [examenJuin]
GO
DENY SELECT ON [dbo].[Joueur] ([DateNaissance]) TO [NoRight]
DENY SELECT ON [dbo].[Joueur] ([DateNaissance]) TO [Viewer]
DENY SELECT ON [dbo].[Joueur] ([Height]) TO [NoRight]
DENY SELECT ON [dbo].[Joueur] ([Height]) TO [Viewer]
DENY SELECT ON [dbo].[Joueur] ([Weight]) TO [NoRight]
DENY SELECT ON [dbo].[Joueur] ([Weight]) TO [Viewer]
GO
