# Comment créer une molecule

## Vue d'ensemble

Ce guide vous montre comment créer un nouveau composant molecule dans GardenUI.

## Qu'est-ce qu'une molecule ?

Une **molecule** est une combinaison d'atoms qui forme une unité fonctionnelle :
- Composée de 2 à 5 atoms
- Peut dépendre d'atoms et de foundation
- Reste relativement simple et réutilisable
- Exemples : champ de recherche (input + icône), menu item (icône + texte), carte avec badge

## Étapes de création

### 1. Identifier les atoms nécessaires

Avant de créer une molecule, listez les atoms dont vous aurez besoin.

**Exemple :** Pour un `SearchField`, nous avons besoin de :
- Un champ de texte (Flutter natif)
- Une icône de recherche (`GardenIcon`)
- Optionnellement un bouton de suppression (`GardenButton` ou icône)

### 2. Créer la structure de dossiers

```
lib/ui/widgets/molecules/SearchField/
├── search_field.dart
└── search_field_usecase.dart
```

### 3. Créer le fichier du composant

**Fichier :** `lib/ui/widgets/molecules/SearchField/search_field.dart`

```dart
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';
import 'package:garden_ui/ui/foundation/padding/space_design_system.dart';
import 'package:garden_ui/ui/foundation/radius/radius_design_system.dart';
import 'package:garden_ui/ui/widgets/atoms/GardenIcon/garden_icon.dart';

/// Un champ de recherche avec icône intégrée.
///
/// Combine un TextField et une icône de recherche pour créer
/// une interface de recherche cohérente et réutilisable.
class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    this.hintText = 'Rechercher...',
    this.onChanged,
    this.controller,
  });

  /// Le texte indicatif affiché dans le champ vide
  final String hintText;

  /// Callback appelé à chaque changement de texte
  final ValueChanged<String>? onChanged;

  /// Contrôleur optionnel pour gérer le texte
  final TextEditingController? controller;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _handleTextChange() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
    widget.onChanged?.call(_controller.text);
  }

  void _clearText() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GardenColors.surface,
        borderRadius: BorderRadius.circular(GardenRadius.m),
        border: Border.all(color: GardenColors.outline),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(GardenSpace.s),
            child: GardenIcon(
              icon: Icons.search,
              color: GardenColors.onSurfaceVariant,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: GardenSpace.s,
                ),
              ),
            ),
          ),
          if (_hasText)
            IconButton(
              icon: const GardenIcon(
                icon: Icons.clear,
                color: GardenColors.onSurfaceVariant,
              ),
              onPressed: _clearText,
            ),
          const SizedBox(width: GardenSpace.xs),
        ],
      ),
    );
  }
}
```

### 4. Créer les use cases Widgetbook

**Fichier :** `lib/ui/widgets/molecules/SearchField/search_field_usecase.dart`

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:garden_ui/ui/widgets/molecules/SearchField/search_field.dart';

@widgetbook.UseCase(name: 'Default', type: SearchField)
Widget searchFieldDefault(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: SearchField(),
  );
}

@widgetbook.UseCase(name: 'Custom Hint', type: SearchField)
Widget searchFieldCustomHint(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: SearchField(
      hintText: 'Rechercher un produit...',
    ),
  );
}

@widgetbook.UseCase(name: 'With Callback', type: SearchField)
Widget searchFieldWithCallback(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SearchField(
      onChanged: (value) {
        debugPrint('Recherche: $value');
      },
    ),
  );
}
```

### 5. Exporter le composant

Dans `lib/ui/components.dart` :

```dart
// Molecules
export 'widgets/molecules/SearchField/search_field.dart';
```

### 6. Générer le code Widgetbook

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 7. Créer les tests

**Fichier :** `test/molecules/search_field_test.dart`

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/widgets/molecules/SearchField/search_field.dart';

void main() {
  group('SearchField', () {
    testWidgets('affiche le hint text par défaut', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SearchField(),
          ),
        ),
      );

      expect(find.text('Rechercher...'), findsOneWidget);
    });

    testWidgets('affiche un hint text personnalisé', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SearchField(hintText: 'Custom hint'),
          ),
        ),
      );

      expect(find.text('Custom hint'), findsOneWidget);
    });

    testWidgets('affiche le bouton de suppression quand il y a du texte', 
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SearchField(),
          ),
        ),
      );

      // Au début, pas de bouton clear
      expect(find.byIcon(Icons.clear), findsNothing);

      // Saisir du texte
      await tester.enterText(find.byType(TextField), 'test');
      await tester.pump();

      // Le bouton clear apparaît
      expect(find.byIcon(Icons.clear), findsOneWidget);
    });

    testWidgets('efface le texte quand on clique sur clear', 
        (WidgetTester tester) async {
      final controller = TextEditingController();
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchField(controller: controller),
          ),
        ),
      );

      // Saisir du texte
      await tester.enterText(find.byType(TextField), 'test');
      await tester.pump();

      expect(controller.text, 'test');

      // Cliquer sur le bouton clear
      await tester.tap(find.byIcon(Icons.clear));
      await tester.pump();

      expect(controller.text, '');
    });

    testWidgets('appelle onChanged avec le texte saisi', 
        (WidgetTester tester) async {
      String? capturedValue;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchField(
              onChanged: (value) {
                capturedValue = value;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'test');
      await tester.pump();

      expect(capturedValue, 'test');
    });
  });
}
```

### 8. Lancer les tests

```bash
flutter test test/molecules/search_field_test.dart
```

## Règles à respecter

### ✅ Bonnes pratiques pour les molecules

- Composer 2 à 5 atoms maximum
- Gérer l'état interne si nécessaire (`StatefulWidget`)
- Exposer des callbacks pour les interactions
- Utiliser les design tokens
- Rester focalisé sur une fonctionnalité précise
- Documenter les dépendances aux atoms utilisés

### ❌ À éviter

- Créer des molecules trop complexes (utiliser un organism à la place)
- Dépendre d'autres molecules ou organisms
- Dupliquer la logique métier (garder ça dans l'application)
- Mélanger trop de responsabilités

## Quand créer une molecule vs un organism ?

| Molecule | Organism |
|----------|----------|
| 2-5 atoms | 5+ composants (atoms + molecules) |
| Fonctionnalité simple | Logique complexe |
| Réutilisable partout | Peut être spécifique à un contexte |
| Exemple : SearchField | Exemple : CompleteSearchBar avec filtres |

## Checklist finale

- [ ] Composant créé avec 2-5 atoms maximum
- [ ] Documentation dartdoc complète
- [ ] Use cases Widgetbook (minimum 3)
- [ ] Tests unitaires complets
- [ ] État géré correctement (si StatefulWidget)
- [ ] Callbacks exposés pour les interactions
- [ ] Design tokens utilisés
- [ ] Exporté dans `components.dart`
- [ ] Validé visuellement dans Widgetbook

## Voir aussi

- [Comment créer un atom](how-to-create-atom.md)
- [Comment créer un organism](how-to-create-organism.md)
- [Guidelines de développement](../explanation/component-guidelines.md)
- [Comprendre l'Atomic Design](../explanation/atomic-design.md)

