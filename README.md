#  SAE 3.02 Dev et WEB 
## Informations projet

- Date de création du projet : 16/09/2024
- Membres du projet : Elyandre BURET; Loris GRANDCHAMP; Dan COQUERANT

## Documents utiles

Pour la gestion de notre travail nous avons utilisé plusieurs outils tels que <a href="https://trello.com/invite/b/66e84b61c9e3645db671c2d0/ATTIe2a64062e9a118a43e849aa5165b04b0ADD686AF/302-sae-web-bd-2024-2025">Trello</a> pour la gestion et la répartition des tâches et un 
<a href="https://docs.google.com/document/d/1QOKi6AJ1f7ixYgi4_V4HSCbfHmSv0v1zCaBToUGGEPk/edit?pli=1&addon_store"> Google Docs</a> pour le brainstorming et le partage des données de base du projet, <a href="https://www.figma.com/design/SrcZYuSWxSrsRGlv7qquiy/Grand-galop?node-id=0-1&t=e4VgvLPyFRquz97s-1">Figma</a> pour les maquettes.


## Installation de l'application

### Prérequis
- Python 3.8 ou supérieur

### Étapes d'installation

1. **Cloner le dépôt** :
```bash
git clone https://github.com/elyandreb/SAE-WEB-BD
```

2. **Créer et activer un environnement virtuel** (recommandé)
```bash
# Création
python -m venv venv

# Activation
    # Pour Windows
.\venv\Scripts\activate
    # Pour Linux
source venv/bin/activate
```

3. **Installer les dépendances**
```bash
pip install -r requirements.txt
```
4. **Créer son fichier auth.py**
- Il est nécessaire d'avoir une base de donnée mysql nommée "DBvotrenom" (votrenom étant à modifié selon votre nom) afin de synchroniser la base de données
- Créez un fichier auth.py dans le dossier project sous cette forme :
```python
nom = 'votre nom' # à modifier
mdp = 'votre mdp' # à modifier
db = 'localhost'
```

## Lancement de l'application
1. Initier la base de données (avant le premier lancement)
```bash
flask syncdb
```

2. Lancer l'application
```bash
flask run
```
##### L'application sera accessible localement à l'adresse `http://127.0.0.1:5000`

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
- Réfléxion structuration avec Loris
- Configuration et structuration de l'architecture du projet 
- Création de l'accueil pour les adhérents
- Création du header et du footer 
  
#### Dan : 
- Absent

### Séance du 09/01/2025 (1h30) :
#### Loris :
- Réflexion avec Elyandre sur la BD
- Restructuration de la BD : tables ADHERENT et MONITEUR supprimées au profit d'une table UTILISATEUR
- Modification des tables, des insertions et des triggers en conséquence des changements de BD
- Début de modification du back-end de connexion et d'inscription

#### Elyandre :
- Création de l'accueil pour les moniteurs et les administrateurs
- Mise à jour du model (ajout du loginManager)
#### Dan : 
- Absent

### Travail supplémentaire hors créneaux SAE :
#### Loris :
#### Avant Présentation
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
- Implémentation du back-end pour l'admin de poney, moniteur et reserver
#### Après Présentation
- Légères modifications d'affichage
- Refactoring du code

#### Elyandre :
  #### Avant Présentation
  - Création du fichier pour le rendu des maquettes
  - Assemblage des différents travaux pour le rendu intermédiaire avec Loris
  - Mise à jour du header avec intégration des logos (logo du club, logo FFE)
  - Mise à jour du model
  - Création du back-end et front-end de l'emploi du temps des adhérents
  - Création du back-end et front-end de l'emploi du temps des moniteurs
  - Ajouts des redirections pour simplifier la navigation
  - Création d'un modal pour s'inscrire à un cours pour les adhérents
  - Création d'un modal pour se désinscrire à un cours pour les adhérents
  #### Après Présentation
  - Ajouts de modals d'informations pour les cours
  - Ajouts de messages flash
  - Gestion des cours passés
  - Ajouts des informations concernant les cours réservés d'un adherent (poney attribué)
  - Ajouts des informations concernant les cours d'un moniteur (liste des adhérents inscrits)
  - Implémentation du front-end et liaison avec le back-end pour les pages admin (gestion poneys, moniteur, adherent, cours)

#### Dan : 

# Fonctionnalités implémentées
## Système de connexion, déconnexion et d'inscription
- Gestion des rôles : **Adhérents**, **Moniteurs**, **Admins**
- Authentification sécurisée :
  - Hashage des mots de passe avec SHA256
  - Vérification des informations de connexion
- Inscription pour chaque rôle avec validation des données
  
## Création d'une page d'accueil :
### Adhérents :
- **Affichage du prochain cours réservé** :
  - Date, heure, durée
  - Poney attribué
  - Moniteur en charge
- **Bouton d'inscription rapide** :
  - Redirection vers l'emploi du temps pour s'inscrire à un cours

### Moniteurs :
- **Affichage des 3 prochains cours** :
  - Nombre de participants
  - Date, heure, durée
  - Liste des participants avec poneys attribués

### Admin :
- **Dashboard de gestion** :
  - Boutons pour accéder aux sections : `Gérer poneys`, `Gérer adhérents`, `Gérer moniteurs`, `Gérer cours`


## Accès à l'emploi du temps (Calendrier hebdomadaire)
### Adhérents :
- Consultation des **cours passés et futurs**
- Bouton **`i`** pour afficher les informations détaillées d’un cours (date, durée, moniteur, poney attribué)
- **Inscription** à un cours disponible (si cotisation payée) via un bouton `S'inscrire`
- **Désinscription** d’un cours réservé via un bouton `Se désinscrire`

### Moniteurs :
- Consultation des **cours passés et futurs**
- Bouton **`i`** pour afficher les informations détaillées d’un cours (participants inscrits, poneys attribués, etc.)

## Gestion des profils :
### Adhérents :
- **Modification des informations personnelles** :
  - Nom, prénom, date de naissance, poids, email, mot de passe
- **Statut de cotisation** : Indication si la cotisation est payée ou non

### Moniteurs :
- **Modification des informations personnelles** :
  - Nom, prénom, date de naissance, poids, email, mot de passe

### Admin :
- **Modification des informations personnelles** :
  - Nom, prénom, date de naissance, poids, email, mot de passe

## Gestion Admin
### Gestion des Moniteurs
- **Liste des moniteurs** :
  - Affichage de tous les moniteurs avec leur nom et prénom sous forme de cartes.
- **Ajout d'un moniteur** :
  - Modal d'ajout avec les champs suivants :
    - Nom.
    - Prénom.
    - Date de naissance.
    - Email.
    - Poids.
    - Mot de passe.

- **Modification d'un moniteur** :
  - Modal permettant de modifier les informations d'un moniteur existant.

- **Suppression d'un moniteur** :
  - Possibilité de supprimer un moniteur et les réservations et cours associés.

- **Recherche de moniteurs** :
  - Barre de recherche non implémentée.

### Gestion des Adhérents
- **Liste des adhérents** :
  - Affichage de tous les adhérents avec leur nom et prénom sous forme de cartes.

- **Ajout d'un adhérent** :
  - Modal d'ajout avec les champs suivants :
    - Nom.
    - Prénom.
    - Date de naissance.
    - Email.
    - Poids.
    - Mot de passe.

- **Modification d'un adhérent** :
  - Modal permettant de modifier les informations d'un adhérent existant.

- **Suppression d'un adhérent** :
  - Suppression d'un adhérent avec les réservations et cotisations associées.

- **Recherche d'adhérents** :
  - Barre de recherche non implémentée.

### Gestion des Poneys
- **Liste des poneys** :
  - Affichage de tous les poneys avec leur nom et charge maximale.

- **Ajout d'un poney** :
  - Modal d'ajout avec les champs suivants :
    - Nom du poney.
    - Charge maximale.

- **Modification d'un poney** :
  - Modal permettant de mettre à jour les informations d'un poney.

- **Suppression d'un poney** :
  - Suppression d'un poney avec les réservations associées.

- **Recherche de poneys** :
  - Barre de recherche non implémentée.

### Gestion des Cours
  - **Affichage sous forme de calendrier défilable**
  - **Possibilité d'ajouter un cours via un bouton dans chaque case du calendrier**
  - **Modal de suppression pour supprimer un cours et toutes les réservations associés**
  - **Modal de modification du cours avec toutes les informations du cours modifiables**

## Fonctionnalités supplémentaires 
-  **Messages flash pour informer l'utilisateur des actions réussies ou des erreurs (ex : ajout, suppression, etc.)**

# Fonctionnalités rajoutées après la séance
- **Ajouts de modals d'informations pour les cours**
- **Ajouts de messages flash pour informer l'utilisateur**
- **Affichage des cours passés et suppression de possibilité de s'inscrire aux cours terminés**
- **Ajouts de nouvelles informations concernant les cours réservés d'un adherent (poney attribué)**
- **Ajouts de nouvelles informations concernant les cours d'un moniteur (liste des adhérents inscrits)**
- **Toutes les fonctionnalités pour la gestion des poneys, moniteurs, adherents et cours implémentés (ajout, suppression, modification) avec un affichage** 
