# Comment exécuter et écrire des tests

## Vue d'ensemble

Ce guide explique comment exécuter les tests dans GardenUI et comment en écrire de nouveaux.

## Exécuter tous les tests

Pour lancer tous les tests du projet :

```bash
flutter test
```

## Exécuter des tests spécifiques

### Tester un seul fichier

```bash
flutter test test/atoms/button_test.dart
```

### Tester un dossier

```bash
flutter test test/atoms/
```

### Tester avec un pattern

```bash
flutter test test/**/*_test.dart
```

## Exécuter les tests en mode verbose

Pour voir plus de détails sur l'exécution :

```bash
flutter test --verbose
```

## Exécuter les tests en mode watch

Pour relancer automatiquement les tests lors de changements :

```bash
flutter test --watch
```

## Vérifier la couverture de code

### Générer un rapport de couverture

```bash
flutter test --coverage
```

Cela génère un fichier `coverage/lcov.info`.

### Voir le rapport HTML

Installez `lcov` si nécessaire :

**Sur macOS :**
```bash
brew install lcov
```

**Sur Ubuntu/Debian :**
```bash
sudo apt-get install lcov
```

Puis générez le rapport HTML :

```bash
genhtml coverage/lcov.info -o coverage/html
```

Ouvrez le rapport :

```bash
open coverage/html/index.html  # macOS
xdg-open coverage/html/index.html  # Linux
start coverage/html/index.html  # Windows
```

## Structure d'un test

### Test basique d'un widget

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/widgets/atoms/Button/button.dart';

void main() {
  group('GardenButton', () {
    testWidgets('affiche le label', (WidgetTester tester) async {
      // Arrange : Préparer le test
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenButton(
              label: 'Mon bouton',
              onPressed: () {},
            ),
          ),
        ),
      );

      // Act & Assert : Vérifier le résultat
      expect(find.text('Mon bouton'), findsOneWidget);
    });
  });
}
```

### Test d'interaction

```dart
testWidgets('appelle onPressed au tap', (WidgetTester tester) async {
  bool pressed = false;
  
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: GardenButton(
          label: 'Cliquez',
          onPressed: () {
            pressed = true;
          },
        ),
      ),
    ),
  );

  // Simuler un tap
  await tester.tap(find.text('Cliquez'));
  await tester.pump();

  expect(pressed, isTrue);
});
```

### Test avec différents états

```dart
group('GardenButton - États', () {
  testWidgets('état actif', (WidgetTester tester) async {
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

  testWidgets('état désactivé', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GardenButton(
            label: 'Désactivé',
            onPressed: null,  // null = disabled
          ),
        ),
      ),
    );

    final button = tester.widget<GardenButton>(find.byType(GardenButton));
    expect(button.onPressed, isNull);
  });
});
```

### Test avec setup commun

```dart
void main() {
  group('MonComposant', () {
    late Widget testWidget;

    setUp(() {
      // Configuration commune à tous les tests
      testWidget = MaterialApp(
        home: Scaffold(
          body: MonComposant(),
        ),
      );
    });

    testWidgets('test 1', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      // assertions...
    });

    testWidgets('test 2', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      // assertions...
    });
  });
}
```

## Finders courants

### Trouver par texte

```dart
expect(find.text('Mon texte'), findsOneWidget);
```

### Trouver par type

```dart
expect(find.byType(GardenButton), findsOneWidget);
```

### Trouver par key

```dart
await tester.pumpWidget(
  GardenButton(
    key: const Key('my-button'),
    label: 'Test',
    onPressed: () {},
  ),
);

expect(find.byKey(const Key('my-button')), findsOneWidget);
```

### Trouver par icône

```dart
expect(find.byIcon(Icons.search), findsOneWidget);
```

### Matchers de quantité

```dart
expect(find.text('Item'), findsNothing);
expect(find.text('Item'), findsOneWidget);
expect(find.text('Item'), findsNWidgets(3));
expect(find.text('Item'), findsAtLeastNWidgets(1));
expect(find.text('Item'), findsWidgets);  // Au moins un
```

## Tester les animations

```dart
testWidgets('animation fonctionne', (WidgetTester tester) async {
  await tester.pumpWidget(MonWidgetAnimé());
  
  // État initial
  expect(find.text('Fermé'), findsOneWidget);
  
  // Déclencher l'animation
  await tester.tap(find.text('Ouvrir'));
  await tester.pump();  // Commence l'animation
  await tester.pump(const Duration(milliseconds: 500));  // Milieu
  await tester.pumpAndSettle();  // Termine l'animation
  
  // État final
  expect(find.text('Ouvert'), findsOneWidget);
});
```

## Golden tests (tests visuels)

### Créer un golden test

```dart
testWidgets('golden test - apparence par défaut', (WidgetTester tester) async {
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

### Générer/mettre à jour les goldens

```bash
flutter test --update-goldens
```

## Mocker des dépendances

Pour les composants avec des dépendances externes, utilisez des mocks :

```dart
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([MonService])
void main() {
  testWidgets('avec mock', (WidgetTester tester) async {
    final mockService = MockMonService();
    
    when(mockService.getData()).thenAnswer((_) async => 'données mockées');
    
    await tester.pumpWidget(
      MaterialApp(
        home: MonWidget(service: mockService),
      ),
    );
    
    await tester.pumpAndSettle();
    
    expect(find.text('données mockées'), findsOneWidget);
    verify(mockService.getData()).called(1);
  });
}
```

## Bonnes pratiques

### ✅ À faire

- Utiliser `group()` pour organiser les tests
- Écrire des noms de tests descriptifs
- Tester les cas limites (valeurs null, vides, extrêmes)
- Tester les interactions utilisateur
- Utiliser `setUp()` et `tearDown()` pour le code commun
- Viser une couverture > 80%

### ❌ À éviter

- Tester l'implémentation plutôt que le comportement
- Dépendre de l'ordre d'exécution des tests
- Tester plusieurs choses dans un seul test
- Ignorer les warnings des tests
- Ne pas tester les cas d'erreur

## Tests obligatoires pour chaque composant

Pour chaque composant GardenUI, testez au minimum :

1. **Rendu** : Le composant s'affiche correctement
2. **Propriétés** : Toutes les props sont appliquées
3. **Interactions** : Les callbacks sont appelés
4. **États** : Tous les états visuels différents
5. **Cas limites** : Valeurs nulles, chaînes vides, etc.

## Déboguer des tests qui échouent

### Afficher la structure du widget

```dart
debugDumpApp();  // Affiche l'arbre des widgets
```

### Prendre un screenshot

```dart
await tester.pumpWidget(monWidget);
await tester.takeException();  // Capture les exceptions
```

### Mode verbose

```bash
flutter test --verbose test/mon_test.dart
```

## Intégration continue

Les tests sont automatiquement exécutés via GitHub Actions sur chaque push et pull request. Voir [Workflows CI/CD](../reference/ci-cd-workflows.md) pour plus de détails.

## Voir aussi

- [Standards de tests](../reference/testing-standards.md)
- [Guidelines de composants](../explanation/component-guidelines.md)
- [Workflows CI/CD](../reference/ci-cd-workflows.md)

