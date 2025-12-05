# Premiers pas avec GardenUI

## Introduction

Bienvenue dans GardenUI ! Ce tutoriel vous guidera pas à pas dans l'installation de la librairie et l'utilisation de votre premier composant.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.8.1 ou supérieure)
- [Dart SDK](https://dart.dev/get-dart) (inclus avec Flutter)
- Un éditeur de code comme [VS Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio)

## Étape 1 : Ajouter GardenUI à votre projet

GardenUI n'est pas publié sur [pub.dev](https://pub.dev), il est auto-hébergé sur GitHub. Pour l'ajouter à votre projet, ouvrez le fichier `pubspec.yaml` et ajoutez la dépendance suivante :

```yaml
dependencies:
  garden_ui:
    git:
      url: git@github.com:JardinConnect/GardenUI.git
      ref: v0.2.0  # Utilisez la dernière version disponible
```

## Étape 2 : Installer les dépendances

Exécutez la commande suivante pour installer GardenUI et ses dépendances :

```bash
flutter pub get
```

## Étape 3 : Importer GardenUI

Dans votre fichier Dart, importez la librairie :

```dart
import 'package:garden_ui/ui/design_system.dart';
```

## Étape 4 : Utiliser votre premier composant

Créons une simple application avec un bouton GardenUI :

```dart
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GardenUI Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mon premier composant GardenUI'),
        ),
        body: Center(
          child: GardenButton(
            label: 'Cliquez-moi !',
            onPressed: () {
              print('Bouton cliqué !');
            },
          ),
        ),
      ),
    );
  }
}
```

## Étape 5 : Lancer l'application

Exécutez votre application :

```bash
flutter run
```

Choisissez votre plateforme cible :
- `flutter run -d chrome` pour le navigateur web
- `flutter run -d windows` pour Windows
- `flutter run -d macos` pour macOS

## Félicitations ! 🎉

Vous avez réussi à intégrer GardenUI dans votre projet et à utiliser votre premier composant ! 

## Prochaines étapes

- [Créer votre premier composant personnalisé](creating-first-component.md)
- [Construire un formulaire avec GardenUI](building-form.md)
- [Explorer le catalogue de composants](../reference/components-catalog.md)

