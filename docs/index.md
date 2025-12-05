# Documentation GardenUI

Bienvenue dans la documentation complète de GardenUI.

---

## 🎯 Navigation par besoin

Cette documentation est organisée selon le framework [DIATAXIS](https://diataxis.fr/), qui structure l'information selon vos besoins :

### 🎓 Vous voulez **apprendre** ?

→ Consultez les [**Tutorials**](tutorials/) pour des guides pas à pas qui vous enseignent les bases en pratiquant.

- [Premiers pas avec GardenUI](tutorials/getting-started.md) - Installation et premier composant
- [Créer votre premier composant](tutorials/creating-first-component.md) - Développer un atom personnalisé
- [Construire un formulaire](tutorials/building-form.md) - Composer molecules et organisms

### 🔧 Vous avez un **problème à résoudre** ?

→ Consultez les [**How-to Guides**](how-to-guides/) pour des solutions pratiques à des problèmes spécifiques.

- [Utiliser GardenUI dans un projet](how-to-guides/how-to-use-library.md)
- [Créer un atom](how-to-guides/how-to-create-atom.md) / [molecule](how-to-guides/how-to-create-molecule.md) / [organism](how-to-guides/how-to-create-organism.md)
- [Exécuter les tests](how-to-guides/how-to-run-tests.md)
- [Publier une release](how-to-guides/how-to-publish-release.md)
- [Générer le code Widgetbook](how-to-guides/how-to-generate-code.md)

### 📚 Vous cherchez une **information technique** ?

→ Consultez la [**Reference**](reference/) pour des informations détaillées et précises.

- [Catalogue des composants](reference/components-catalog.md) - Liste complète des composants disponibles
- [Design Tokens](reference/design-tokens.md) - Couleurs, espacements, typographie
- [Workflows CI/CD](reference/ci-cd-workflows.md) - Automatisation et validation
- [Standards de code](reference/coding-standards.md) - Règles de codage Dart/Flutter
- [Standards de tests](reference/testing-standards.md) - Comment tester correctement
- [Historique des versions](reference/changelog.md) - Changelog complet

### 💡 Vous voulez **comprendre** les concepts ?

→ Consultez les [**Explanations**](explanation/) pour des explications conceptuelles approfondies.

- [Architecture du projet](explanation/architecture.md) - Structure globale et organisation
- [Atomic Design](explanation/atomic-design.md) - Méthodologie et principes
- [Philosophie du design system](explanation/design-system-philosophy.md) - Principes fondamentaux
- [Guidelines de développement](explanation/component-guidelines.md) - Bonnes pratiques
- [Structure du projet](explanation/project-structure.md) - Organisation des fichiers

---

## 🚀 Démarrage rapide

### Installation

```yaml
dependencies:
  garden_ui:
    git:
      url: git@github.com:JardinConnect/GardenUI.git
      ref: v0.2.0
```

### Premier composant

```dart
import 'package:garden_ui/ui/design_system.dart';

GardenButton(
  label: 'Mon bouton',
  onPressed: () => print('Cliqué !'),
)
```

👉 [Guide complet de démarrage](tutorials/getting-started.md)

---

## 🎨 Composants

GardenUI fournit une bibliothèque de composants organisée en 3 niveaux :

### Atoms (8 composants)
Les composants de base : `GardenButton`, `GardenCard`, `GardenIcon`, `MenuIcon`, `NotificationIcon`, `AlertIndicator`, `LevelIndicator`, `TabItem`

### Molecules (4 composants)
Compositions d'atoms : `MenuItem`, `HierarchicalMenuItem`, `NotificationToast`, `TabMenu`

### Organisms (2 composants)
Composants complexes : `Menu`, `HierarchicalMenu`

👉 [Catalogue complet avec exemples](reference/components-catalog.md)

---

## 📐 Design Tokens

GardenUI utilise des design tokens pour garantir la cohérence :

```dart
// Couleurs
GardenColors.primary
GardenColors.secondary
GardenColors.error

// Espacements
GardenSpace.paddingMd
GardenSpace.gapLg

// Rayons
GardenRadius.radiusMd
```

👉 [Documentation complète des tokens](reference/design-tokens.md)

---

## 🧪 Widgetbook

Visualisez tous les composants dans un catalogue interactif :

```bash
dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome
```

---

## 🤝 Contribuer

Vous voulez contribuer à GardenUI ? Consultez nos guides :

1. [Comment créer un atom](how-to-guides/how-to-create-atom.md)
2. [Comment créer une molecule](how-to-guides/how-to-create-molecule.md)
3. [Comment créer un organism](how-to-guides/how-to-create-organism.md)
4. [Standards de code](reference/coding-standards.md)
5. [Standards de tests](reference/testing-standards.md)

---

## 🔍 Recherche rapide

### Par tâche

- Installer GardenUI → [Getting Started](tutorials/getting-started.md)
- Créer un composant → [How-to Guides](how-to-guides/)
- Lancer les tests → [How to run tests](how-to-guides/how-to-run-tests.md)
- Publier une version → [How to publish release](how-to-guides/how-to-publish-release.md)

### Par concept

- Architecture → [Architecture](explanation/architecture.md)
- Atomic Design → [Atomic Design](explanation/atomic-design.md)
- Design System → [Philosophy](explanation/design-system-philosophy.md)

### Par référence

- Composants → [Components Catalog](reference/components-catalog.md)
- Couleurs et tokens → [Design Tokens](reference/design-tokens.md)
- CI/CD → [Workflows](reference/ci-cd-workflows.md)

---

## 📞 Support

- **Issues GitHub** : [github.com/JardinConnect/GardenUI/issues](https://github.com/JardinConnect/GardenUI/issues)
- **Documentation** : Vous êtes au bon endroit !
- **Widgetbook** : Lancez `flutter run -d chrome` pour explorer interactivement

---

**💚 GardenUI - Design System pour GardenConnect**

