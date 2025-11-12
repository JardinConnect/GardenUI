# Structure du projet

## Vue d'ensemble

GardenUI suit une structure organisée et cohérente basée sur les principes de l'Atomic Design. Cette documentation détaille l'organisation complète du projet.

## Arborescence complète

```
GardenUI/
├── .cursor/                      # Configuration Cursor (règles)
├── .github/
│   └── workflows/                # CI/CD GitHub Actions
│       ├── analyze_and_test.yml
│       └── release.yml
├── android/                      # Configuration Android
├── assets/                       # Assets globaux du projet
│   └── images/
│       └── logo.png
├── build/                        # Fichiers de build (généré, ignoré)
├── docs/                         # Documentation DIATAXIS
│   ├── tutorials/
│   ├── how-to-guides/
│   ├── reference/
│   └── explanation/
├── ios/                          # Configuration iOS
├── lib/                          # Code source principal ⭐
│   ├── main.dart                 # Point d'entrée Widgetbook
│   ├── main.directories.g.dart   # Catalogue généré
│   └── ui/                       # Cœur de la librairie
│       ├── design_system.dart
│       ├── components.dart
│       ├── enums.dart
│       ├── assets/               # Assets de la librairie
│       ├── enums/                # Énumérations
│       ├── foundation/           # Design tokens
│       ├── internal/             # Code interne
│       ├── models/               # Modèles de données
│       └── widgets/              # Composants UI
│           ├── atoms/
│           ├── molecules/
│           └── organisms/
├── linux/                        # Configuration Linux
├── macos/                        # Configuration macOS
├── test/                         # Tests ⭐
│   ├── atoms/
│   ├── molecules/
│   ├── organisms/
│   └── widgets/
├── web/                          # Configuration Web
├── windows/                      # Configuration Windows
├── .gitignore
├── analysis_options.yaml         # Configuration du linter
├── CHANGELOG.md
├── LICENSE
├── pubspec.lock
├── pubspec.yaml                  # Dépendances et métadonnées
└── README.md
```

## Points d'entrée principaux

### 1. `main.dart`

Point d'entrée de l'application Widgetbook.

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      directories: directories,  // Généré par build_runner
      addons: [
        // Addons Widgetbook
      ],
    );
  }
}
```

**Responsabilité :** Lancer le catalogue interactif Widgetbook pour visualiser tous les composants.

### 2. `pubspec.yaml`

Métadonnées et dépendances du projet.

```yaml
name: garden_ui
description: "Garden Connect UI library"
version: 0.1.0
repository: https://github.com/JardinConnect/GardenUI

environment:
  sdk: ^3.8.1

dependencies:
  flutter:
    sdk: flutter
  widgetbook: ^3.14.3
  widgetbook_annotation: ^3.5.0
  google_fonts: ^6.2.1
  flutter_svg: ^2.0.10

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  widgetbook_generator: ^3.13.0
  build_runner: ^2.5.4
```

### 3. `analysis_options.yaml`

Configuration du linter et des règles d'analyse statique.

```yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    # Règles personnalisées
```

---

## Dossier `lib/ui/` (Cœur de la librairie)

### `design_system.dart`

Export principal regroupant TOUT le nécessaire.

```dart
// Foundation
export 'foundation/color/color_design_system.dart';
export 'foundation/padding/space_design_system.dart';
export 'foundation/radius/radius_design_system.dart';
export 'foundation/shadow/shadow_design_system.dart';
export 'foundation/typography/typography_design_system.dart';

// Composants
export 'components.dart';

// Enums
export 'enums.dart';
```

**Usage :**
```dart
import 'package:garden_ui/ui/design_system.dart';
// Accès à GardenButton, GardenColors, GardenSpace, etc.
```

### `components.dart`

Export de tous les composants UI.

```dart
// Atoms
export 'widgets/atoms/Button/button.dart';
export 'widgets/atoms/Card/card.dart';
export 'widgets/atoms/GardenIcon/garden_icon.dart';
export 'widgets/atoms/MenuIcon/menu_icon.dart';
export 'widgets/atoms/NotificationIcon/notification_icon.dart';
export 'widgets/atoms/AlertIndicator/alert_indicator.dart';
export 'widgets/atoms/LevelIndicator/level_indicator.dart';
export 'widgets/atoms/TabItem/tab_item.dart';

// Molecules
export 'widgets/molecules/MenuItem/menu_item.dart';
export 'widgets/molecules/HierarchicalMenuItem/hierarchical_menu_item.dart';
export 'widgets/molecules/Notification/notification_toast.dart';
export 'widgets/molecules/TabMenu/tab_menu.dart';

// Organisms
export 'widgets/organisms/Menu/menu.dart';
export 'widgets/organisms/HierarchicalMenu/hierarchical_menu.dart';

// Models
export 'models/menu_item_data.dart';
// ... autres modèles
```

### `enums.dart`

Export des énumérations.

```dart
export 'enums/notification_type.dart';
export 'enums/alert_severity.dart';
// ... autres enums
```

---

## `lib/ui/foundation/` (Design Tokens)

### Structure

```
foundation/
├── color/
│   ├── color_design_system.dart      # Palettes de couleurs
│   ├── color_preview.dart            # Preview Widgetbook
│   └── color_usecase.dart            # Use cases
├── padding/
│   ├── space_design_system.dart      # Espacements
│   ├── space_preview.dart
│   └── space_usecase.dart
├── radius/
│   ├── radius_design_system.dart     # Rayons de bordure
│   ├── radius_preview.dart
│   └── radius_usecase.dart
├── shadow/
│   ├── shadow_design_system.dart     # Ombres
│   ├── shadow_preview.dart
│   └── shadow_usecase.dart
└── typography/
    ├── typography_design_system.dart # Typographie
    ├── typography_preview.dart
    └── typography_usecase.dart
```

### Responsabilité

Centraliser toutes les valeurs de style réutilisables :
- Couleurs
- Espacements (padding/gap)
- Rayons de bordure
- Ombres et élévation
- Styles typographiques

---

## `lib/ui/widgets/` (Composants UI)

### Structure par niveau atomique

```
widgets/
├── atoms/
│   ├── AlertIndicator/
│   │   ├── alert_indicator.dart
│   │   └── alert_indicator_usecase.dart
│   ├── Button/
│   │   ├── button.dart
│   │   └── button_usecase.dart
│   ├── Card/
│   │   ├── card.dart
│   │   └── card_usecase.dart
│   ├── GardenIcon/
│   ├── LevelIndicator/
│   ├── MenuIcon/
│   ├── NotificationIcon/
│   └── TabItem/
├── molecules/
│   ├── HierarchicalMenuItem/
│   │   ├── hierarchical_menu_item.dart
│   │   └── hierarchical_menu_item_usecase.dart
│   ├── MenuItem/
│   ├── Notification/
│   └── TabMenu/
└── organisms/
    ├── HierarchicalMenu/
    │   ├── hierarchical_menu.dart
    │   └── hierarchical_menu_usecase.dart
    └── Menu/
```

### Convention

Chaque composant a son propre dossier contenant :
1. **`{nom}.dart`** : Implémentation du composant
2. **`{nom}_usecase.dart`** : Use cases pour Widgetbook

---

## `lib/ui/models/` (Modèles de données)

Structures de données utilisées par les composants.

```
models/
├── menu_item_data.dart
├── hierarchical_menu_item_data.dart
└── ... autres modèles
```

**Exemple :**
```dart
// menu_item_data.dart
class MenuItemData {
  const MenuItemData({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}
```

---

## `lib/ui/enums/` (Énumérations)

Types et états utilisés dans les composants.

```
enums/
├── notification_type.dart
├── alert_severity.dart
└── ... autres enums
```

**Exemple :**
```dart
// notification_type.dart
enum NotificationType {
  success,
  error,
  warning,
  info,
}
```

---

## `lib/ui/assets/` (Assets de la librairie)

Ressources intégrées à la librairie.

```
assets/
└── icons/
    ├── logo.svg
    ├── menu_icon.svg
    └── ...
```

**Déclaration dans `pubspec.yaml` :**
```yaml
flutter:
  assets:
    - lib/ui/assets/icons/
```

---

## Dossier `test/` (Tests)

Structure miroir de `lib/ui/widgets/`.

```
test/
├── atoms/
│   ├── alert_indicator_test.dart
│   ├── button_test.dart
│   ├── card_test.dart
│   ├── level_indicator_test.dart
│   ├── menu_icon_test.dart
│   ├── notification_icon_test.dart
│   └── tab_item_test.dart
├── molecules/
│   ├── menu_item_test.dart
│   ├── notification_toast_test.dart
│   └── tab_menu_test.dart
└── organisms/
    ├── hierarchical_menu_test.dart
    └── menu_test.dart
```

**Convention :** `{composant}_test.dart` teste `{composant}.dart`

---

## Dossier `docs/` (Documentation DIATAXIS)

Documentation structurée selon le modèle DIATAXIS.

```
docs/
├── index.md                     # Page d'accueil
├── tutorials/                   # Learning-oriented
│   ├── getting-started.md
│   ├── creating-first-component.md
│   └── building-form.md
├── how-to-guides/               # Problem-oriented
│   ├── how-to-use-library.md
│   ├── how-to-create-atom.md
│   ├── how-to-create-molecule.md
│   ├── how-to-create-organism.md
│   ├── how-to-run-tests.md
│   ├── how-to-publish-release.md
│   └── how-to-generate-code.md
├── reference/                   # Information-oriented
│   ├── components-catalog.md
│   ├── design-tokens.md
│   ├── ci-cd-workflows.md
│   ├── changelog.md
│   ├── coding-standards.md
│   └── testing-standards.md
└── explanation/                 # Understanding-oriented
    ├── architecture.md
    ├── atomic-design.md
    ├── design-system-philosophy.md
    ├── component-guidelines.md
    └── project-structure.md (ce fichier)
```

---

## Dossier `.github/workflows/` (CI/CD)

Workflows GitHub Actions pour l'automatisation.

```
.github/workflows/
├── analyze_and_test.yml    # Tests et analyse à chaque push/PR
└── release.yml             # Validation à la création de release
```

---

## Commandes importantes

### Installation

```bash
flutter pub get
```

### Génération de code

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Lancement Widgetbook

```bash
flutter run -d chrome
flutter run -d windows
flutter run -d macos
```

### Tests

```bash
flutter test                     # Tous les tests
flutter test test/atoms/         # Tests d'un dossier
flutter test --coverage          # Avec couverture
```

### Analyse statique

```bash
flutter analyze
```

### Formatage

```bash
dart format .
```

---

## Fichiers générés

### À versionner

- ✅ `lib/main.directories.g.dart` - Nécessaire au fonctionnement

### À ignorer (`.gitignore`)

- ❌ `build/` - Fichiers de build
- ❌ `*.g.dart` (autres que main.directories) - Régénérables
- ❌ `.dart_tool/` - Cache Dart
- ❌ `coverage/` - Rapports de couverture

---

## Organisation visuelle

### Par responsabilité

```
GardenUI
├── 📦 Foundation (Design Tokens)
│   └── Couleurs, Espacements, Typographie, etc.
├── 🔹 Atoms (Composants de base)
│   └── Button, Icon, Card, etc.
├── 🔹🔹 Molecules (Compositions)
│   └── MenuItem, SearchField, Toast, etc.
├── 🔹🔹🔹 Organisms (Complexes)
│   └── Menu, Form, Header, etc.
├── 🧪 Tests
│   └── Tests miroirs des composants
└── 📚 Documentation
    └── Tutorials, Guides, Reference, Explanation
```

---

## Voir aussi

- [Architecture du projet](architecture.md)
- [Atomic Design](atomic-design.md)
- [Guidelines de composants](component-guidelines.md)
- [Comment contribuer](../how-to-guides/how-to-create-atom.md)

