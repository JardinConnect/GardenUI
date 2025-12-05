# Créer votre premier composant

## Introduction

Dans ce tutoriel, vous allez apprendre à créer un composant atom personnalisé pour GardenUI en suivant les principes du design system.

## Objectif

Nous allons créer un composant `GardenBadge` : un petit indicateur coloré pour afficher des compteurs ou des statuts.

## Étape 1 : Comprendre la hiérarchie atomique

GardenUI suit les principes de l'**Atomic Design** :
- **Atoms** : Composants simples et indivisibles (boutons, icônes, badges)
- **Molecules** : Combinaisons d'atoms (champ de saisie avec label)
- **Organisms** : Composants complexes (formulaires, menus)

Notre badge est un **atom** car c'est un composant simple et autonome.

## Étape 2 : Créer la structure de fichiers

Dans le projet GardenUI, créez la structure suivante :

```
lib/ui/widgets/atoms/Badge/
├── badge.dart
└── badge_usecase.dart
```

## Étape 3 : Créer le composant

Créez le fichier `lib/ui/widgets/atoms/Badge/badge.dart` :

```dart
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';
import 'package:garden_ui/ui/foundation/radius/radius_design_system.dart';
import 'package:garden_ui/ui/foundation/padding/space_design_system.dart';

/// Un badge pour afficher des compteurs ou des statuts.
///
/// Utilise les design tokens de GardenUI pour garantir
/// la cohérence visuelle avec le reste du design system.
class GardenBadge extends StatelessWidget {
  const GardenBadge({
    super.key,
    required this.label,
    this.backgroundColor,
    this.textColor,
  });

  /// Le texte affiché dans le badge
  final String label;

  /// La couleur de fond (utilise primary par défaut)
  final Color? backgroundColor;

  /// La couleur du texte (utilise onPrimary par défaut)
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GardenSpace.xs,
        vertical: GardenSpace.xxs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? GardenColors.primary,
        borderRadius: BorderRadius.circular(GardenRadius.full),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor ?? GardenColors.onPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
```

## Étape 4 : Créer les use cases pour Widgetbook

Créez le fichier `lib/ui/widgets/atoms/Badge/badge_usecase.dart` :

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:garden_ui/ui/widgets/atoms/Badge/badge.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';

/// Use case par défaut du badge
@widgetbook.UseCase(name: 'Default', type: GardenBadge)
Widget gardenBadgeDefault(BuildContext context) {
  return const Center(
    child: GardenBadge(
      label: '5',
    ),
  );
}

/// Badge avec texte long
@widgetbook.UseCase(name: 'Long Text', type: GardenBadge)
Widget gardenBadgeLongText(BuildContext context) {
  return const Center(
    child: GardenBadge(
      label: 'Nouveau',
    ),
  );
}

/// Badge avec couleurs personnalisées
@widgetbook.UseCase(name: 'Custom Colors', type: GardenBadge)
Widget gardenBadgeCustom(BuildContext context) {
  return const Center(
    child: GardenBadge(
      label: '99+',
      backgroundColor: GardenColors.error,
      textColor: GardenColors.onError,
    ),
  );
}
```

## Étape 5 : Générer le code Widgetbook

Exécutez la commande de génération :

```bash
dart run build_runner build --delete-conflicting-outputs
```

Cette commande génère automatiquement les fichiers nécessaires pour intégrer votre composant dans Widgetbook.

## Étape 6 : Tester le composant

Créez le fichier de test `test/atoms/badge_test.dart` :

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/widgets/atoms/Badge/badge.dart';

void main() {
  group('GardenBadge', () {
    testWidgets('affiche le label correctement', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenBadge(label: 'Test'),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('utilise les couleurs personnalisées', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenBadge(
              label: '5',
              backgroundColor: Colors.red,
              textColor: Colors.white,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      
      expect(decoration.color, Colors.red);
    });
  });
}
```

Lancez les tests :

```bash
flutter test test/atoms/badge_test.dart
```

## Étape 7 : Visualiser dans Widgetbook

Lancez Widgetbook pour voir votre composant en action :

```bash
flutter run -d chrome
```

Naviguez vers **Atoms > GardenBadge** dans l'interface Widgetbook pour voir tous vos use cases.

## Félicitations ! 🎉

Vous avez créé votre premier composant GardenUI en suivant toutes les bonnes pratiques :
- ✅ Utilisation des design tokens
- ✅ Documentation avec dartdoc
- ✅ Use cases Widgetbook
- ✅ Tests unitaires

## Prochaines étapes

- [Construire un formulaire avec plusieurs composants](building-form.md)
- [Comprendre l'Atomic Design en profondeur](../explanation/atomic-design.md)
- [Consulter les guidelines de développement](../explanation/component-guidelines.md)

