# GardenUI

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-3.8.1+-02569B.svg?logo=flutter)](https://flutter.dev)
[![Widgetbook](https://img.shields.io/badge/Widgetbook-Enabled-9C27B0.svg)](https://widgetbook.io)

**GardenUI** est une librairie de composants construite selon les principes de l'**Atomic Design** pour le projet ESP Garden Connect.

---

## ✨ Caractéristiques principales

- 🎨 **Design System complet** avec design tokens (couleurs, espacements, typographie)
- 🔹 **Atomic Design** : Architecture en 3 niveaux (Atoms, Molecules, Organisms)
- 📚 **Catalogue Widgetbook** interactif pour visualiser tous les composants
- 🧪 **Tests complets** : Couverture > 80%
- 🚀 **CI/CD intégré** avec GitHub Actions
- 📖 **Documentation DIATAXIS** complète et structurée

---

## 🚀 Installation rapide

Ajoutez GardenUI dans votre `pubspec.yaml` :

```yaml
dependencies:
  garden_ui:
    git:
      url: git@github.com:JardinConnect/GardenUI.git
      ref: v0.2.0  # Utilisez la dernière version
```

Installez les dépendances :

```bash
flutter pub get
```

---

## 💡 Utilisation

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
      home: Scaffold(
        body: Center(
          child: GardenButton(
            label: 'Bienvenue dans GardenUI !',
            onPressed: () => print('Bouton cliqué'),
          ),
        ),
      ),
    );
  }
}
```

---

## 📖 Documentation

La documentation complète est organisée selon le modèle [DIATAXIS](https://diataxis.fr/) :

### 🎓 [Tutorials](doc/tutorials/) - Apprendre en pratiquant

Guides pas à pas pour démarrer avec GardenUI :

- [Premiers pas avec GardenUI](doc/tutorials/getting-started.md)
- [Créer votre premier composant](doc/tutorials/creating-first-component.md)
- [Construire un formulaire complet](doc/tutorials/building-form.md)

### 🔧 [How-to Guides](doc/how-to-guides/) - Résoudre des problèmes

Solutions pratiques pour des tâches courantes :

- [Utiliser GardenUI dans un projet](doc/how-to-guides/how-to-use-library.md)
- [Créer un atom / molecule / organism](doc/how-to-guides/)
- [Exécuter les tests](doc/how-to-guides/how-to-run-tests.md)
- [Publier une release](doc/how-to-guides/how-to-publish-release.md)
- [Générer le code Widgetbook](doc/how-to-guides/how-to-generate-code.md)

### 📚 [Reference](doc/reference/) - Informations techniques

Documentation de référence détaillée :

- [Catalogue des composants](doc/reference/components-catalog.md)
- [Design Tokens](doc/reference/design-tokens.md)
- [Workflows CI/CD](doc/reference/ci-cd-workflows.md)
- [Standards de code](doc/reference/coding-standards.md)
- [Standards de tests](doc/reference/testing-standards.md)
- [Historique des versions](doc/reference/changelog.md)

### 💡 [Explanation](doc/explanation/) - Comprendre les concepts

Explications conceptuelles et architecture :

- [Architecture du projet](doc/explanation/architecture.md)
- [Atomic Design expliqué](doc/explanation/atomic-design.md)
- [Philosophie du design system](doc/explanation/design-system-philosophy.md)
- [Guidelines de développement](doc/explanation/component-guidelines.md)
- [Structure du projet](doc/explanation/project-structure.md)

---

## 🎨 Composants disponibles

### Atoms
`GardenButton` · `GardenCard` · `GardenIcon` · `MenuIcon` · `NotificationIcon` · `AlertIndicator` · `LevelIndicator` · `TabItem`

### Molecules
`MenuItem` · `HierarchicalMenuItem` · `NotificationToast` · `TabMenu`

### Organisms
`Menu` · `HierarchicalMenu`

👉 [Voir le catalogue complet](doc/reference/components-catalog.md)

---

## 🛠️ Développement

### Prérequis

- Flutter SDK 3.8.1+
- Dart SDK (inclus avec Flutter)

### Lancer Widgetbook

```bash
# Générer le code
dart run build_runner build --delete-conflicting-outputs

# Lancer Widgetbook
flutter run -d chrome  # ou -d windows, -d macos
```

### Exécuter les tests

```bash
flutter test
```

### Analyse statique

```bash
flutter analyze
```

---

## 📦 Architecture

GardenUI suit une architecture en couches basée sur l'Atomic Design :

```
Foundation (Design Tokens)
    ↓
Atoms (Composants de base)
    ↓
Molecules (Compositions d'atoms)
    ↓
Organisms (Composants complexes)
```

Chaque couche ne dépend que des couches inférieures, garantissant une architecture propre et maintenable.

👉 [En savoir plus sur l'architecture](doc/explanation/architecture.md)

---

## 🤝 Contribuer

Les contributions sont les bienvenues ! Veuillez consulter nos guidelines :

- [Comment créer un atom](doc/how-to-guides/how-to-create-atom.md)
- [Comment créer une molecule](doc/how-to-guides/how-to-create-molecule.md)
- [Standards de code](doc/reference/coding-standards.md)
- [Standards de tests](doc/reference/testing-standards.md)

---

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

---

## 🔗 Liens utiles

- [Documentation complète](doc/)
- [Repository GitHub](https://github.com/JardinConnect/GardenUI)
- [Widgetbook](https://widgetbook.io)
- [Atomic Design](https://atomicdesign.bradfrost.com)
- [DIATAXIS](https://diataxis.fr)

---

**Développé avec ❤️ par l'équipe Garden Connect**
