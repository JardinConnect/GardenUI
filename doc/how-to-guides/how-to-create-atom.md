# Comment créer un atom

## Vue d'ensemble

Ce guide vous montre comment créer un nouveau composant atom dans GardenUI.

## Qu'est-ce qu'un atom ?

Un **atom** est le composant le plus simple du design system :
- Indivisible et autonome
- Ne dépend pas d'autres composants (sauf foundation)
- Hautement réutilisable
- Exemples : boutons, icônes, labels, indicateurs

## Étapes de création

### 1. Créer la structure de dossiers

Créez un nouveau dossier dans `lib/ui/widgets/atoms/` avec le nom de votre composant en PascalCase :

```
lib/ui/widgets/atoms/MonComposant/
├── mon_composant.dart
└── mon_composant_usecase.dart
```

### 2. Créer le fichier du composant

**Fichier :** `lib/ui/widgets/atoms/MonComposant/mon_composant.dart`

```dart
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';
import 'package:garden_ui/ui/foundation/radius/radius_design_system.dart';
import 'package:garden_ui/ui/foundation/padding/space_design_system.dart';

/// Description concise du composant.
///
/// Documentation plus détaillée sur le comportement,
/// l'utilisation et les cas d'usage du composant.
class MonComposant extends StatelessWidget {
  const MonComposant({
    super.key,
    required this.proprieteRequise,
    this.proprieteOptionnelle,
  });

  /// Description de la propriété requise
  final String proprieteRequise;

  /// Description de la propriété optionnelle
  final Color? proprieteOptionnelle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(GardenSpace.m),
      decoration: BoxDecoration(
        color: proprieteOptionnelle ?? GardenColors.primary,
        borderRadius: BorderRadius.circular(GardenRadius.m),
      ),
      child: Text(
        proprieteRequise,
        style: const TextStyle(
          color: GardenColors.onPrimary,
        ),
      ),
    );
  }
}
```

### 3. Créer les use cases Widgetbook

**Fichier :** `lib/ui/widgets/atoms/MonComposant/mon_composant_usecase.dart`

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:garden_ui/ui/widgets/atoms/MonComposant/mon_composant.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';

/// Use case par défaut
@widgetbook.UseCase(name: 'Default', type: MonComposant)
Widget monComposantDefault(BuildContext context) {
  return const Center(
    child: MonComposant(
      proprieteRequise: 'Valeur par défaut',
    ),
  );
}

/// Use case avec des variantes
@widgetbook.UseCase(name: 'Custom Color', type: MonComposant)
Widget monComposantCustom(BuildContext context) {
  return const Center(
    child: MonComposant(
      proprieteRequise: 'Couleur personnalisée',
      proprieteOptionnelle: GardenColors.secondary,
    ),
  );
}

/// Use case pour montrer différents états
@widgetbook.UseCase(name: 'Various States', type: MonComposant)
Widget monComposantStates(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MonComposant(proprieteRequise: 'État 1'),
      SizedBox(height: GardenSpace.m),
      MonComposant(
        proprieteRequise: 'État 2',
        proprieteOptionnelle: GardenColors.error,
      ),
    ],
  );
}
```

### 4. Exporter le composant

Ajoutez l'export dans `lib/ui/components.dart` :

```dart
// Atoms
export 'widgets/atoms/MonComposant/mon_composant.dart';
```

### 5. Générer le code Widgetbook

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 6. Créer les tests

**Fichier :** `test/atoms/mon_composant_test.dart`

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/widgets/atoms/MonComposant/mon_composant.dart';

void main() {
  group('MonComposant', () {
    testWidgets('affiche la propriété requise', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MonComposant(
              proprieteRequise: 'Test',
            ),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('utilise la couleur par défaut', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MonComposant(
              proprieteRequise: 'Test',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      
      expect(decoration.color, GardenColors.primary);
    });

    testWidgets('applique la couleur personnalisée', (WidgetTester tester) async {
      const customColor = Colors.red;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MonComposant(
              proprieteRequise: 'Test',
              proprieteOptionnelle: customColor,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      
      expect(decoration.color, customColor);
    });
  });
}
```

### 7. Lancer les tests

```bash
flutter test test/atoms/mon_composant_test.dart
```

### 8. Visualiser dans Widgetbook

```bash
flutter run -d chrome
```

Naviguez vers **Atoms > MonComposant** dans Widgetbook.

## Règles à respecter

### ✅ Bonnes pratiques

- Utiliser les design tokens (`GardenColors`, `GardenSpace`, etc.)
- Documenter avec `///` (dartdoc)
- Créer au moins 2-3 use cases Widgetbook
- Tester tous les comportements et états
- Utiliser `const` partout où c'est possible
- Nommer les fichiers en snake_case

### ❌ À éviter

- Hardcoder des valeurs de couleurs ou d'espacement
- Dépendre d'autres composants (molecules/organisms)
- Créer des composants trop complexes (préférer une molecule)
- Omettre la documentation
- Ne pas créer de tests

## Checklist finale

Avant de considérer votre atom comme terminé :

- [ ] Fichier du composant créé avec documentation dartdoc
- [ ] Use cases Widgetbook créés (minimum 2)
- [ ] Code Widgetbook généré (`build_runner`)
- [ ] Tests unitaires créés et qui passent
- [ ] Composant exporté dans `components.dart`
- [ ] Design tokens utilisés (pas de valeurs hardcodées)
- [ ] Utilisation de `const` maximisée
- [ ] Vérifié visuellement dans Widgetbook

## Voir aussi

- [Guidelines de développement de composants](../explanation/component-guidelines.md)
- [Standards de code Dart](../reference/coding-standards.md)
- [Standards de tests](../reference/testing-standards.md)
- [Comment créer une molecule](how-to-create-molecule.md)

