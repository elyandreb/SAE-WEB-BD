#  SAE 3.02 Dev et WEB 
## Informations projet

- Date de création du projet : 16/09/2024
- Membres du projet : Elyandre BURET; Loris GRANDCHAMP; Dan COQUERANT

## Documents utiles

Pour la gestion de notre travail nous avons utilisé plusieurs outils tels que <a href="https://trello.com/invite/b/66e84b61c9e3645db671c2d0/ATTIe2a64062e9a118a43e849aa5165b04b0ADD686AF/302-sae-web-bd-2024-2025">Trello</a> pour la gestion et la répartition des tâches et un 
<a href="https://docs.google.com/document/d/1QOKi6AJ1f7ixYgi4_V4HSCbfHmSv0v1zCaBToUGGEPk/edit?pli=1&addon_store"> Google Docs</a> pour le brainstorming et le partage des données de base du projet, <a href="https://www.figma.com/design/SrcZYuSWxSrsRGlv7qquiy/Grand-galop?node-id=0-1&t=e4VgvLPyFRquz97s-1">Figma</a> pour les maquettes.


## Historique des séances :

### Séance du 16/09/2024 (3h) :
#### Loris :
- Réflexion MLD/MCD ensemble
- Scripts de création des tables de la BD
- CU avec Elyandre mais Dan apportait son avis régulièrement

#### Elyandre :
- Création du dépôt GitHub 
- Création du README 
- Création du CU avec Loris 
- Analyse des contraintes et création du MCD avec Loris et Dan 

#### Dan : 
- Réflexion MCD
- Création des outils de gestion de projets (Trello, Google Docs)
- Ajout des premier documents important au README
- Don d'avis pour cas d'utilisation

### Séance du 23/09/2024 (3h) :
#### Loris :
- Ajout de l'historique des séances dans le README
- Réflexion sur quelles pages mettre avec la consultation des autres et ajout des idées dans un google doc commun
- Création des insertions pour PONEY et PERSONNE
- début du trigger pasDeCheuvauchement avec Dan

#### Elyandre :
- Création d'un groupe sur Figma pour réaliser les maquettes de l'application web
- Réalisation de la maquette de la page de connexion (fini)
- Réalisation de la maquette d'une des pages d'accueil (en cours)

#### Dan : 
- Création du trigger pour vérifier que le poid du cavalier est inférieur à la charge max du poney
- Création du trigger qui vérifie que le nombre d'inscrit à un cour est inférieur au nombre max de participants à ce cours
- Ajout de quelque inserts pour tester les triggers

### Séance du 12/11/2024 (1h30) :
#### Loris :
- Réflexion supplémentaire sur les maquettes ajoutées sur le Gdoc commun
- Création du squelette des pages sur Figma
- Création de la maquette "S'inscrire"

#### Elyandre :
- Mise à jour du Trello avec Loris
- Création de la maquette emploie du temps pour un moniteur
- Mise à jour de la maquette Connexion.

#### Dan : 

### Séance du 18/11/2024 (3h) :
#### Loris :
- Maquette "emploi du temps adhérent" (avec pour base celle du moniteur réalisé par Elyandre)
- Maquette "control panel admin"
- Maquette "Accueil adhérent"
- Maquette "Accueil moniteur"

#### Elyandre :
- Changement de la charte graphique
- Ajout d'un logo dans la navbar
- Création de la page profil
  

#### Dan : 
- Absent

### Séance du 21/11/2024 (1h30) :
#### Loris :
- Création du rendu
- Ajout de tous les éléments nécessaires dans le rendu

#### Elyandre :
- Ajustements sur les maquettes
  

#### Dan : 
- Absent

### Séance du 06/01/2025 (3h) :
#### Loris :
- Réfléxion structuration avec Elyandre
- Création du model en SQLAlchemy
- Modifications de la BD, ajout de mdp pour les adhérents et les moniteurs
- Début de l'implémentation pour la connexion et l'inscription

#### Elyandre :
- 
  
#### Dan : 
- Absent

### Séance du 09/01/2025 (1h30) :
#### Loris :
- Réflexion avec Elyandre sur la BD
- Restructuration de la BD : tables ADHERENT et MONITEUR supprimées au profit d'une table UTILISATEUR
- Modification des tables, des insertions et des triggers en conséquence des changements de BD
- Début de modification du back-end de connexion et d'inscription

#### Elyandre :
- 

#### Dan : 
- Absent

### Travail supplémentaire hors créneaux SAE :
#### Loris :
- Modification MCD pour ajouter la cotisation
- Création tables COTISER et COTISATION
- Insertions pour les tables COTISER et COTISATION
- Création de tous les fichiers pour le rendu (sauf les maquettes)
- Triggers pour empêcher le chevauchement pour un moniteur et celui pour l'update du poney
- Correction des insertions afin que tout fonctionne
- Avancée sur l'authentification et l'inscription
- Création et implémentation (sommaire) des templates de connexion et d'inscription
- Fin de l'implémentation finale de connexion et d'inscription
- Ajout de SHA2 pour la sécurité des mdp
- Implémentation du back-end de la page profil
- Implémentation du front-end de la page de profil
- Implémentation du front-end de connexion et d'inscription
- Migration des triggers dans models.py et finalisation de syncdb 

#### Elyandre :
  - création du fichier pour le rendu des maquettes
  - Assemblage des différents travaux pour le rendu intermédiaire avec Loris

#### Dan : 
