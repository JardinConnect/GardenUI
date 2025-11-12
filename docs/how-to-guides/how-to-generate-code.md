# Comment générer le code

## Vue d'ensemble

GardenUI utilise la génération de code pour automatiser certaines tâches, notamment l'intégration avec Widgetbook. Ce guide explique comment utiliser build_runner.

## Pourquoi générer du code ?

La génération de code automatique permet de :
- Créer le catalogue Widgetbook automatiquement à partir des annotations
- Générer des fichiers de configuration
- Éviter le code répétitif et les erreurs manuelles
- Maintenir la cohérence du projet

## Commande de génération

### Génération complète

Pour générer tous les fichiers nécessaires :

```bash
dart run build_runner build --delete-conflicting-outputs
```

Cette commande :
- Analyse tous les fichiers avec des annotations
- Génère les fichiers correspondants (`.g.dart`, `.directories.g.dart`)
- Supprime les fichiers obsolètes (`--delete-conflicting-outputs`)

### Génération en mode watch

Pour régénérer automatiquement lors de changements :

```bash
dart run build_runner watch --delete-conflicting-outputs
```

En mode watch, build_runner surveille les fichiers et régénère automatiquement quand vous sauvegardez.

### Nettoyer les fichiers générés

Pour supprimer tous les fichiers générés :

```bash
dart run build_runner clean
```

Puis régénérez :

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Annotations Widgetbook

### @UseCase

L'annotation `@UseCase` crée un cas d'usage dans le catalogue Widgetbook :

```dart
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:garden_ui/ui/widgets/atoms/Button/button.dart';

@widgetbook.UseCase(name: 'Default', type: GardenButton)
Widget gardenButtonDefault(BuildContext context) {
  return GardenButton(
    label: 'Mon bouton',
    onPressed: () {},
  );
}
```

**Paramètres :**
- `name` : Nom du cas d'usage affiché dans Widgetbook
- `type` : Type du composant (classe du widget)

### Plusieurs use cases

Créez plusieurs use cases pour montrer différents états :

```dart
@widgetbook.UseCase(name: 'Default', type: GardenButton)
Widget gardenButtonDefault(BuildContext context) {
  return GardenButton(label: 'Default', onPressed: () {});
}

@widgetbook.UseCase(name: 'Disabled', type: GardenButton)
Widget gardenButtonDisabled(BuildContext context) {
  return const GardenButton(label: 'Disabled', onPressed: null);
}

@widgetbook.UseCase(name: 'Long Text', type: GardenButton)
Widget gardenButtonLongText(BuildContext context) {
  return GardenButton(
    label: 'Ceci est un très long texte pour le bouton',
    onPressed: () {},
  );
}
```

## Fichiers générés

### main.directories.g.dart

Fichier principal généré contenant la structure du catalogue Widgetbook :

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

// ... imports automatiques ...

final directories = <WidgetbookNode>[
  WidgetbookCategory(
    name: 'Atoms',
    children: [
      WidgetbookComponent(
        name: 'GardenButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: gardenButtonDefault,
          ),
          // ... autres use cases
        ],
      ),
    ],
  ),
  // ... autres catégories
];
```

**⚠️ Ne modifiez jamais ce fichier manuellement** - il est écrasé à chaque génération.

## Résolution de problèmes

### Erreur : "Conflicting outputs"

**Problème :** Des fichiers générés sont en conflit.

**Solution :**
```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### Erreur : "No builders found"

**Problème :** Les dépendances de build ne sont pas installées.

**Solution :**
```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### Les use cases n'apparaissent pas dans Widgetbook

**Causes possibles :**

1. **Fichiers non générés**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

2. **Import incorrect**
   Vérifiez que vous importez bien `widgetbook_annotation` :
   ```dart
   import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
   ```

3. **Annotation incorrecte**
   Assurez-vous d'utiliser `@widgetbook.UseCase` avec un alias :
   ```dart
   @widgetbook.UseCase(name: 'Default', type: MonWidget)
   ```

4. **Hot reload insuffisant**
   Après génération, redémarrez complètement l'application :
   ```bash
   flutter run
   ```

### La génération est très lente

**Solution 1 : Mode watch**
Utilisez le mode watch au lieu de régénérer manuellement :
```bash
dart run build_runner watch
```

**Solution 2 : Ignorer certains dossiers**
Créez ou modifiez `build.yaml` à la racine :
```yaml
targets:
  $default:
    sources:
      - lib/**
      - test/**
      exclude:
        - lib/generated/**
        - test/fixtures/**
```

## Quand générer le code ?

### ✅ Générez après :

- Ajout d'une annotation `@UseCase`
- Modification d'un use case existant
- Suppression d'un composant
- Modification de la structure des dossiers
- Récupération du projet (`git clone` ou `git pull`)
- Installation de dépendances (`flutter pub get`)

### ❌ Pas besoin de générer si :

- Vous modifiez seulement l'implémentation d'un widget
- Vous modifiez les styles CSS
- Vous mettez à jour la documentation
- Vous écrivez des tests

## Intégration avec Git

### Fichiers à versionner

**À commiter (`.gitignore` n'ignore PAS) :**
```
lib/main.directories.g.dart
```

Ce fichier doit être versionné pour que le projet fonctionne immédiatement après un clone.

### Fichiers à ignorer

Autres fichiers générés peuvent être ignorés selon votre configuration.

## Workflow recommandé

### 1. Développement local

```bash
# Terminal 1 : Mode watch
dart run build_runner watch --delete-conflicting-outputs

# Terminal 2 : Application Widgetbook
flutter run -d chrome
```

Le code se régénère automatiquement pendant que vous développez.

### 2. Avant un commit

```bash
# Générer une dernière fois pour être sûr
dart run build_runner build --delete-conflicting-outputs

# Vérifier que tout compile
flutter analyze

# Lancer les tests
flutter test

# Commiter
git add .
git commit -m "feat: nouveau composant X"
```

### 3. Après un pull

```bash
# Installer les dépendances (peut avoir changé)
flutter pub get

# Régénérer le code
dart run build_runner build --delete-conflicting-outputs

# Relancer l'app
flutter run
```

## Bonnes pratiques

### ✅ À faire

- Générer le code avant chaque commit
- Utiliser le mode watch pendant le développement
- Versionner `main.directories.g.dart`
- Nettoyer régulièrement avec `build_runner clean`
- Ajouter les use cases dans des fichiers séparés (`*_usecase.dart`)

### ❌ À éviter

- Modifier manuellement les fichiers `.g.dart`
- Oublier de régénérer après un pull
- Commiter des fichiers générés obsolètes
- Ignorer les warnings de build_runner

## Configuration avancée

### build.yaml personnalisé

Créez `build.yaml` à la racine pour personnaliser :

```yaml
targets:
  $default:
    builders:
      widgetbook_generator|widgetbook_generator:
        enabled: true
        options:
          # Options personnalisées si nécessaire

global_options:
  widgetbook_generator:widgetbook_generator:
    # Configuration globale
```

## Voir aussi

- [Package build_runner](https://pub.dev/packages/build_runner)
- [Widgetbook annotations](https://docs.widgetbook.io/annotation/)
- [Comment créer un atom](how-to-create-atom.md)
- [Architecture du projet](../explanation/architecture.md)

