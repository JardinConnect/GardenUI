# Standards de tests

## Vue d'ensemble

Ce document définit les standards de tests pour GardenUI. Des tests de qualité garantissent la stabilité et la maintenabilité du code.

## Structure des tests

### Organisation des fichiers

Les tests doivent refléter la structure des widgets :

```
lib/ui/widgets/
├── atoms/Button/button.dart
├── molecules/MenuItem/menu_item.dart
└── organisms/Menu/menu.dart

test/
├── atoms/button_test.dart
├── molecules/menu_item_test.dart
└── organisms/menu_test.dart
```

### Nommage des fichiers

**Convention :** `{nom_du_composant}_test.dart`

**Exemples :**
- `button_test.dart` pour `button.dart`
- `menu_item_test.dart` pour `menu_item.dart`
- `hierarchical_menu_test.dart` pour `hierarchical_menu.dart`

---

## Structure d'un fichier de test

### Template de base

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/widgets/atoms/Button/button.dart';

void main() {
  group('GardenButton', () {
    testWidgets('description du test', (WidgetTester tester) async {
      // Arrange : Préparer le test
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenButton(
              label: 'Test',
              onPressed: null,
            ),
          ),
        ),
      );

      // Act : Effectuer l'action
      // (si nécessaire)

      // Assert : Vérifier le résultat
      expect(find.text('Test'), findsOneWidget);
    });
  });
}
```

### Groupement des tests

Utilisez `group()` pour organiser les tests par fonctionnalité :

```dart
void main() {
  group('GardenButton', () {
    group('Rendu', () {
      testWidgets('affiche le label', (tester) async { });
      testWidgets('affiche avec la couleur par défaut', (tester) async { });
    });

    group('Interactions', () {
      testWidgets('appelle onPressed au tap', (tester) async { });
      testWidgets('n\'appelle pas onPressed si désactivé', (tester) async { });
    });

    group('États', () {
      testWidgets('affiche l\'état actif', (tester) async { });
      testWidgets('affiche l\'état désactivé', (tester) async { });
    });
  });
}
```

---

## Ce qu'il faut tester

### 1. Rendu du composant

Vérifiez que le composant s'affiche correctement.

```dart
testWidgets('affiche le label correctement', (WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: Scaffold(
        body: GardenButton(
          label: 'Mon bouton',
          onPressed: null,
        ),
      ),
    ),
  );

  expect(find.text('Mon bouton'), findsOneWidget);
});
```

### 2. Propriétés du composant

Testez que toutes les propriétés sont correctement appliquées.

```dart
testWidgets('applique la couleur personnalisée', (WidgetTester tester) async {
  const customColor = Colors.red;
  
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: MonWidget(color: customColor),
      ),
    ),
  );

  final widget = tester.widget<Container>(find.byType(Container));
  final decoration = widget.decoration as BoxDecoration;
  
  expect(decoration.color, customColor);
});
```

### 3. Interactions utilisateur

Testez les callbacks et les interactions.

```dart
testWidgets('appelle onPressed au tap', (WidgetTester tester) async {
  bool pressed = false;
  
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: GardenButton(
          label: 'Test',
          onPressed: () {
            pressed = true;
          },
        ),
      ),
    ),
  );

  await tester.tap(find.text('Test'));
  await tester.pump();

  expect(pressed, isTrue);
});
```

### 4. États différents

Testez tous les états visuels possibles.

```dart
group('États', () {
  testWidgets('état actif avec onPressed non-null', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GardenButton(
            label: 'Actif',
            onPressed: () {},
          ),
        ),
      ),
    );

    final button = tester.widget<GardenButton>(find.byType(GardenButton));
    expect(button.onPressed, isNotNull);
  });

  testWidgets('état désactivé avec onPressed null', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GardenButton(
            label: 'Désactivé',
            onPressed: null,
          ),
        ),
      ),
    );

    final button = tester.widget<GardenButton>(find.byType(GardenButton));
    expect(button.onPressed, isNull);
  });
});
```

### 5. Cas limites

Testez les valeurs nulles, vides, extrêmes.

```dart
group('Cas limites', () {
  testWidgets('gère une chaîne vide', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GardenButton(
            label: '',
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text(''), findsOneWidget);
  });

  testWidgets('gère un texte très long', (tester) async {
    const longText = 'A' * 1000;
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GardenButton(
            label: longText,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text(longText), findsOneWidget);
  });
});
```

---

## Helpers de tests

### Setup commun

Utilisez `setUp()` pour le code répétitif :

```dart
void main() {
  group('MonComposant', () {
    late Widget testWidget;

    setUp(() {
      testWidget = const MaterialApp(
        home: Scaffold(
          body: MonComposant(),
        ),
      );
    });

    testWidgets('test 1', (tester) async {
      await tester.pumpWidget(testWidget);
      // ...
    });

    testWidgets('test 2', (tester) async {
      await tester.pumpWidget(testWidget);
      // ...
    });
  });
}
```

### Tear down

Nettoyez les ressources après les tests :

```dart
void main() {
  late MyController controller;

  setUp(() {
    controller = MyController();
  });

  tearDown(() {
    controller.dispose();
  });

  test('test avec controller', () {
    // Utiliser controller
  });
}
```

---

## Finders

### Finders courants

```dart
// Par texte
find.text('Mon texte')

// Par type
find.byType(GardenButton)

// Par key
find.byKey(const Key('my-key'))

// Par icône
find.byIcon(Icons.search)

// Par widget
find.byWidget(myWidget)

// Descendants
find.descendant(
  of: find.byType(Container),
  matching: find.text('Child'),
)

// Ancêtres
find.ancestor(
  of: find.text('Child'),
  matching: find.byType(Container),
)
```

### Matchers de quantité

```dart
expect(find.text('Item'), findsNothing);          // 0
expect(find.text('Item'), findsOneWidget);        // 1
expect(find.text('Item'), findsNWidgets(3));      // Exactement 3
expect(find.text('Item'), findsAtLeastNWidgets(1)); // Au moins 1
expect(find.text('Item'), findsWidgets);          // Au moins 1
```

---

## Interactions

### Taps et gestures

```dart
// Tap
await tester.tap(find.text('Button'));
await tester.pump();

// Long press
await tester.longPress(find.text('Button'));
await tester.pump();

// Drag
await tester.drag(find.byType(ListView), const Offset(0, -200));
await tester.pump();

// Scroll
await tester.fling(find.byType(ListView), const Offset(0, -200), 1000);
await tester.pumpAndSettle();
```

### Saisie de texte

```dart
await tester.enterText(find.byType(TextField), 'Mon texte');
await tester.pump();

expect(find.text('Mon texte'), findsOneWidget);
```

---

## Pumping

### Types de pump

```dart
// Pump : Déclenche un frame unique
await tester.pump();

// Pump avec durée : Avance le temps
await tester.pump(const Duration(milliseconds: 500));

// PumpAndSettle : Attend la fin de toutes les animations
await tester.pumpAndSettle();

// PumpWidget : Render initial
await tester.pumpWidget(myWidget);
```

### Quand utiliser chaque type

```dart
// Après une interaction
await tester.tap(find.text('Button'));
await tester.pump();  // ✅

// Pendant une animation
await tester.tap(find.text('Animate'));
await tester.pump(const Duration(milliseconds: 250));  // Milieu d'animation
await tester.pumpAndSettle();  // Fin d'animation

// Changement d'état
setState(() { value = newValue; });
await tester.pump();  // Rebuilds le widget
```

---

## Couverture de tests

### Exigences minimales

Pour chaque composant, testez au minimum :

- [ ] **Rendu** : Le composant s'affiche
- [ ] **Props** : Les propriétés sont appliquées
- [ ] **Interactions** : Les callbacks fonctionnent
- [ ] **États** : Tous les états visuels
- [ ] **Cas limites** : Null, vide, valeurs extrêmes

### Objectif de couverture

**Cible : > 80% de couverture de code**

```bash
# Générer le rapport de couverture
flutter test --coverage

# Voir les fichiers non couverts
lcov --list coverage/lcov.info
```

---

## Bonnes pratiques

### ✅ À faire

- **Un test = une assertion principale** (sauf cas complexes)
- **Noms descriptifs** : Le nom doit expliquer ce qui est testé
- **Tests indépendants** : Chaque test doit pouvoir s'exécuter seul
- **Toujours wrapper dans MaterialApp** : Pour le contexte Theme
- **Tester le comportement, pas l'implémentation**
- **Grouper les tests liés** avec `group()`

### ❌ À éviter

- Tests qui dépendent les uns des autres
- Tests qui testent Flutter lui-même
- Tests sans assertions
- Ignorer les tests (`skip: true`) sans raison valable
- Tester des détails d'implémentation privés
- Tests trop longs (> 10 secondes)

---

## Golden tests

### Créer un golden test

```dart
testWidgets('golden test - apparence par défaut', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: GardenButton(
          label: 'Test',
          onPressed: () {},
        ),
      ),
    ),
  );

  await expectLater(
    find.byType(GardenButton),
    matchesGoldenFile('goldens/button_default.png'),
  );
});
```

### Générer les goldens

```bash
flutter test --update-goldens
```

### Quand utiliser les golden tests

**✅ Utilisez pour :**
- Vérifier l'apparence visuelle
- Détecter les régressions visuelles
- Documenter l'apparence attendue

**❌ N'utilisez pas pour :**
- Tester la logique métier
- Tester les interactions
- Sur des widgets avec contenu dynamique

---

## Debugging

### Afficher l'arbre des widgets

```dart
debugDumpApp();  // Affiche dans la console
```

### Prendre des screenshots

```dart
await tester.takeException();  // Capture les exceptions
```

### Exécuter un seul test

```bash
flutter test test/atoms/button_test.dart
```

### Mode verbose

```bash
flutter test --verbose
```

---

## Intégration continue

Les tests s'exécutent automatiquement sur chaque PR via GitHub Actions.

**Workflow :** `.github/workflows/analyze_and_test.yml`

### Faire passer les tests en CI

1. Tous les tests doivent passer localement
2. Pas de `skip: true` sans justification
3. Pas de tests flaky (qui échouent aléatoirement)
4. Temps d'exécution raisonnable (< 5 minutes total)

---

## Checklist avant de commiter

- [ ] Tous les nouveaux composants ont des tests
- [ ] Tous les tests passent : `flutter test`
- [ ] Couverture > 80% : `flutter test --coverage`
- [ ] Pas de tests ignorés sans raison
- [ ] Tests bien organisés avec `group()`
- [ ] Noms de tests descriptifs

---

## Voir aussi

- [Comment exécuter les tests](../how-to-guides/how-to-run-tests.md)
- [Standards de code](coding-standards.md)
- [Workflows CI/CD](ci-cd-workflows.md)
- [Flutter Testing Documentation](https://docs.flutter.dev/testing)

