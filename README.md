# Documentation de l'Architecture de la Librairie GardenUI

## Introduction

La librairie de composants Flutter est structurée selon les principes du **design system** et de l'**atomic design**. Elle est pensée pour faciliter la collaboration entre développeurs et designers tout en garantissant une **évolutivité optimale**.

La section `ui/` constitue le **cœur de la librairie**. Elle regroupe les éléments fondamentaux et les composants visuels organisés selon une hiérarchie claire : `atoms`, `molecules`, et `organisms`.

## Structure de l'Architecture

### `features/`

Ce dossier contient les **fonctionnalités spécifiques** de l'application ou du projet.

### `ui/`

Le dossier `ui/` regroupe tous les **éléments visuels** et **fondamentaux** du design system.  
Il est organisé en sous-dossiers pour refléter les principes de l'**atomic design** :

#### `foundation/`

Définit les **bases du design system**, telles que :

- les **couleurs**
- les **typographies**
- les **thèmes**
- et autres **styles globaux**

#### `widgets/`

Ce dossier est subdivisé en trois niveaux de composants :

##### `atoms/`

- **Rôle** : Contient les **composants UI les plus simples** et fondamentaux.
- **Exemples** : Boutons, icônes, textes, etc.

##### `molecules/`

- **Rôle** : Combine plusieurs atomes pour créer des composants **légèrement plus complexes**.
- **Exemple** : Champ de saisie avec un label.

##### `organisms/`

- **Rôle** : Regroupe plusieurs molécules et atomes pour créer des composants **complexes et réutilisables**.
- **Exemple** : Formulaire de connexion.

## Mise en route

### Prérequis

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version recommandée : dernière stable)
- [Dart SDK](https://dart.dev/get-dart) (inclus avec Flutter)
- Un éditeur de code comme [VS Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio)

### Installation et configuration

1. Clonez le dépôt sur votre machine locale
2. Naviguez dans le répertoire du projet
3. Exécutez `flutter pub get` pour installer les dépendances

### Génération des fichiers

Le projet utilise la génération de code pour certaines fonctionnalités. Avant de lancer l'application, vous devez générer ces fichiers :

```bash
dart run build_runner build --delete-conflicting-outputs
```

Cette commande génère les fichiers nécessaires pour Widgetbook et d'autres fonctionnalités basées sur des annotations.

### Lancement de l'application

Pour lancer l'application Widgetbook, exécutez :

```bash
flutter run
```

Vous pouvez spécifier la plateforme cible si nécessaire :

```bash
flutter run -d chrome  # Pour exécuter dans le navigateur
flutter run -d windows # Pour exécuter sur Windows
flutter run -d macos   # Pour exécuter sur macOS
```

Le Widgetbook vous permettra de visualiser et d'interagir avec tous les composants UI disponibles dans la bibliothèque.
