# Flutter Weather Application

## Description

Cette application de prévisions météorologiques utilise plusieurs packages pour fournir des fonctionnalités avancées, comme l'intégration de données météo, l'utilisation d'une base de données locale pour la gestion des villes et la récupération des coordonnées GPS pour fournir des prévisions précises en fonction de la localisation de l'utilisateur.

## UI
L'interface utilisateur a été inspirée par ce design Behance : [WeatherScope - Weather Forecast Mobile App](https://www.behance.net/gallery/188387009/WeatherScope-Weather-Forecast-Mobile-App?tracking_source=search_projects|weather+application+mobile+app&l=7).


## Packages Utilisés

Voici les principaux packages utilisés dans cette application, avec une brève description de leur utilité :

### 1. **flutter_svg: ^2.0.10+1**
   - **Description** : Ce package permet de charger et afficher des fichiers SVG (Scalable Vector Graphics). Les SVG sont utiles pour les icônes et les images vectorielles qui conservent une haute qualité, quelle que soit la taille de l'écran.
   - **Utilisation** : Affichage d'icônes ou d'images vectorielles dans l'interface utilisateur, notamment pour représenter des conditions météorologiques ou des éléments graphiques.

### 2. **weather: ^3.1.1**
   - **Description** : Ce package permet de récupérer les données météorologiques depuis différentes API, comme OpenWeatherMap. Il fournit les informations actuelles ainsi que les prévisions pour plusieurs jours.
   - **Utilisation** : Intégration des données météo (température, humidité, prévisions sur 7 jours, etc.) dans l'application.

### 3. **intl: ^0.19.0**
   - **Description** : Le package `intl` est utilisé pour la gestion de la localisation et la manipulation de dates, nombres et formats de texte en fonction des régions.
   - **Utilisation** : Affichage des dates et heures selon le format local de l'utilisateur et gestion de la localisation pour les unités (Celsius, Fahrenheit, etc.).

### 4. **auto_size_text: ^3.0.0**
   - **Description** : Ce package permet de redimensionner automatiquement les textes pour s'adapter à la taille de l'écran, sans dépasser les limites de conteneur.
   - **Utilisation** : Affichage de textes adaptatifs, notamment pour les prévisions météorologiques sur différents écrans sans écraser les interfaces utilisateur.

### 5. **geolocator: ^11.1.0**
   - **Description** : `geolocator` fournit des fonctionnalités pour récupérer la position GPS de l'utilisateur et accéder aux services de localisation.
   - **Utilisation** : Récupération des coordonnées GPS pour afficher la météo locale basée sur la position actuelle de l'utilisateur.

### 6. **drift: ^2.11.1**
   - **Description** : Drift (anciennement appelé `moor`) est un ORM (Object-Relational Mapping) pour Flutter permettant de travailler facilement avec une base de données SQLite.
   - **Utilisation** : Stockage des données locales comme les villes ajoutées par l'utilisateur et les dernières données météo récupérées pour un accès hors ligne.

### 7. **sqlite3_flutter_libs: ^0.5.16**
   - **Description** : Ce package fournit les bibliothèques natives SQLite pour les applications Flutter.
   - **Utilisation** : Utilisé avec Drift pour gérer les bases de données SQLite dans l'application Flutter.

### 8. **path: ^1.8.3**
   - **Description** : Ce package fournit des fonctions pour manipuler les chemins de fichiers dans le système de fichiers local.
   - **Utilisation** : Utilisé pour gérer les chemins des fichiers locaux, notamment pour le stockage de données dans la base de données ou dans des fichiers de configuration.

### 9. **path_provider: ^2.1.0**
   - **Description** : Ce package permet d'accéder à des répertoires spécifiques sur l'appareil, comme le répertoire des documents ou celui des fichiers temporaires.
   - **Utilisation** : Récupération des chemins d'accès pour le stockage de données locales sur l'appareil (par exemple, stockage des fichiers de la base de données SQLite).

### 10. **http: ^1.1.0**
   - **Description** : Le package `http` est utilisé pour effectuer des requêtes HTTP et obtenir des données depuis des API distantes.
   - **Utilisation** : Récupération des données météo en envoyant des requêtes à l'API de prévisions météorologiques.

## Installation

1. Clonez le projet depuis le dépôt GitHub.
   ```bash
   git clone <url_du_projet>
