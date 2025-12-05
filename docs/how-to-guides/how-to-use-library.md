# Comment utiliser GardenUI dans votre projet

## Vue d'ensemble

Ce guide vous explique comment intégrer GardenUI dans un projet Flutter existant ou nouveau.

## Ajouter la dépendance

Comme GardenUI n'est pas publié sur [pub.dev](https://pub.dev), la librairie est auto-hébergée sur GitHub.

### Option 1 : Utiliser une version spécifique (recommandé)

Ajoutez cette dépendance dans votre `pubspec.yaml` :

```yaml
dependencies:
  garden_ui:
    git:
      url: git@github.com:JardinConnect/GardenUI.git
      ref: v0.2.0 # Remplacez par le tag de version souhaité
```

### Option 2 : Utiliser la dernière version de la branche main

```yaml
dependencies:
  garden_ui:
    git:
      url: git@github.com:JardinConnect/GardenUI.git
      ref: master
```

### Option 3 : Utiliser un commit spécifique

```yaml
dependencies:
  garden_ui:
    git:
      url: git@github.com:JardinConnect/GardenUI.git
      ref: abc123def # Hash du commit
```

## Installer les dépendances

Après avoir modifié le `pubspec.yaml`, installez les dépendances :

```bash
flutter pub get
```

## Importer la librairie

### Import complet du design system

Pour accéder à tous les composants et design tokens :

```dart
import 'package:garden_ui/ui/design_system.dart';
```

### Imports spécifiques

Pour n'importer que ce dont vous avez besoin :

```dart
// Importer uniquement les composants
import 'package:garden_ui/ui/components.dart';

// Importer uniquement un composant spécifique
import 'package:garden_ui/ui/widgets/atoms/Button/button.dart';

// Importer les design tokens
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';
import 'package:garden_ui/ui/foundation/padding/space_design_system.dart';
```

## Utiliser les composants

### Exemple basique

```dart
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GardenButton(
          label: 'Mon bouton',
          onPressed: () {
            print('Bouton cliqué !');
          },
        ),
      ),
    );
  }
}
```

### Utiliser le menu hiérarchique avec interactions

```dart
HierarchicalMenu(
  items: [
    HierarchicalMenuItem(
      id: 'serre1',
      title: 'Serre principale',
      subtitle: '24°C - 65%',
      icon: Icons.home,
      level: 1,
      onTap: () {
        // Action personnalisée lors du tap sur l'item
        print('Navigation vers la serre principale');
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => SerreDetailPage(id: 'serre1'),
        ));
      },
      children: [
        HierarchicalMenuItem(
          id: 'zone1',
          title: 'Zone A',
          level: 2,
          onTap: () {
            print('Navigation vers la zone A');
            // Votre logique métier ici
          },
        ),
      ],
    ),
  ],
  onItemSelected: (item) {
    // Callback global pour tous les taps d'items
    print('Item sélectionné: ${item.id}');
  },
)
```

### Utiliser les design tokens

```dart
Container(
  padding: const EdgeInsets.all(GardenSpace.m),
  decoration: BoxDecoration(
    color: GardenColors.primary,
    borderRadius: BorderRadius.circular(GardenRadius.m),
  ),
  child: Text(
    'Texte stylisé',
    style: GardenTypography.bodyMedium.copyWith(
      color: GardenColors.onPrimary,
    ),
  ),
)
```

## Gérer les mises à jour

### Mettre à jour vers une nouvelle version

1. Modifiez le `ref` dans votre `pubspec.yaml` avec la nouvelle version
2. Exécutez `flutter pub get` ou `flutter pub upgrade`

```yaml
dependencies:
  garden_ui:
    git:
      url: git@github.com:JardinConnect/GardenUI.git
      ref: v0.2.0 # Nouvelle version
```

### Forcer la mise à jour du cache

Si les changements ne sont pas appliqués, nettoyez le cache :

```bash
flutter pub cache repair
flutter pub get
```

## Résolution de problèmes

### Erreur : "Could not find a file named pubspec.yaml"

Assurez-vous que l'URL du dépôt est correcte et que vous avez accès au repository.

### Erreur d'authentification Git

Si vous utilisez SSH (`git@github.com`), assurez-vous que vos clés SSH sont configurées. Sinon, utilisez HTTPS :

```yaml
dependencies:
  garden_ui:
    git:
      url: https://github.com/JardinConnect/GardenUI.git
      ref: v0.1.0
```

### Conflits de dépendances

Si vous avez des conflits avec d'autres packages, vérifiez la compatibilité dans le [CHANGELOG](../reference/changelog.md).

## Bonnes pratiques

1. **Versions fixes** : Utilisez toujours un tag de version spécifique en production
2. **Import groupé** : Préférez importer `design_system.dart` pour un code plus propre
3. **Design tokens** : Utilisez systématiquement les constantes GardenUI au lieu de valeurs hardcodées
4. **Documentation** : Consultez le [catalogue de composants](../reference/components-catalog.md) pour découvrir toutes les fonctionnalités

## Voir aussi

- [Premiers pas avec GardenUI](../tutorials/getting-started.md)
- [Catalogue des composants](../reference/components-catalog.md)
- [Workflows CI/CD](../reference/ci-cd-workflows.md)
