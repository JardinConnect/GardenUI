# Guidelines de développement de composants

## Vue d'ensemble

Ce document définit les guidelines pour créer des composants GardenUI cohérents, maintenables et de qualité.

## Hiérarchie Atomic Design

### Atoms (`lib/ui/widgets/atoms/`)

#### Définition

Éléments UI les plus simples et indivisibles.

#### Règles

- **Ne dépendent que de Foundation** (colors, space, radius, etc.)
- **Hautement réutilisables** et context-independent
- **Fonction unique** et claire
- ❌ **Ne composent PAS** d'autres molecules ou organisms
- ❌ **Pas de logique métier** complexe

#### Exemples

```dart
// ✅ Bon atom : Simple, réutilisable, indépendant
class GardenBadge extends StatelessWidget {
  const GardenBadge({
    super.key,
    required this.label,
    this.color,
  });

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(GardenSpace.paddingXs),
      decoration: BoxDecoration(
        color: color ?? GardenColors.primary,
        borderRadius: GardenRadius.radiusSm,
      ),
      child: Text(label),
    );
  }
}
```

#### Quand créer un Atom ?

- Boutons, icônes, labels, dividers
- Indicateurs visuels (badges, dots)
- Conteneurs simples (cards, panels)
- Inputs de base

---

### Molecules (`lib/ui/widgets/molecules/`)

#### Définition

Combinaisons d'atoms formant des unités fonctionnelles.

#### Règles

- **Composées de 2-5 atoms**
- **Peuvent dépendre d'atoms et foundation**
- **Restent simples et réutilisables**
- **Peuvent avoir un état interne** (StatefulWidget)
- ❌ **Ne dépendent PAS** d'autres molecules ou organisms

#### Exemples

```dart
// ✅ Bonne molecule : Combine atoms, fonction claire
class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    this.hintText = 'Rechercher...',
    this.onChanged,
  });

  final String hintText;
  final ValueChanged<String>? onChanged;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: GardenRadius.radiusMd,
        color: GardenColors.surface,
      ),
      child: Row(
        children: [
          const GardenIcon(icon: Icons.search),  // Atom
          Expanded(
            child: TextField(                     // Atom (Flutter)
              controller: _controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          if (_controller.text.isNotEmpty)
            IconButton(                           // Atom
              icon: const Icon(Icons.clear),
              onPressed: () => _controller.clear(),
            ),
        ],
      ),
    );
  }
}
```

#### Quand créer une Molecule ?

- Champ de recherche (input + icône)
- Menu item (icône + label)
- Labeled input (label + input + error)
- Toast notification (icône + message + close button)

---

### Organisms (`lib/ui/widgets/organisms/`)

#### Définition

Composants complexes combinant molecules et atoms.

#### Règles

- **Combinent atoms ET molecules**
- **Peuvent contenir de la logique métier**
- **Représentent une fonctionnalité complète**
- **Peuvent avoir un état complexe**
- **Peuvent être spécifiques à un contexte**

#### Exemples

```dart
// ✅ Bon organism : Fonctionnalité complète
class Menu extends StatefulWidget {
  const Menu({
    super.key,
    required this.items,
    this.selectedIndex,
    this.onItemSelected,
  });

  final List<MenuItemData> items;
  final int? selectedIndex;
  final ValueChanged<int>? onItemSelected;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _handleTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemSelected?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.items.length; i++)
          MenuItem(  // Molecule
            icon: widget.items[i].icon,
            label: widget.items[i].label,
            isSelected: _selectedIndex == i,
            onTap: () => _handleTap(i),
          ),
      ],
    );
  }
}
```

#### Quand créer un Organism ?

- Menus de navigation complets
- Formulaires multi-champs
- Cartes complexes avec plusieurs sections
- Listes avec filtres et actions

---

## Thématisation et Foundation

### Toujours utiliser les design tokens

**Règle d'or :** Jamais de valeurs hardcodées.

#### ✅ Bon

```dart
Container(
  padding: const EdgeInsets.all(GardenSpace.paddingMd),
  decoration: BoxDecoration(
    color: GardenColors.primary,
    borderRadius: GardenRadius.radiusMd,
  ),
)
```

#### ❌ Mauvais

```dart
Container(
  padding: const EdgeInsets.all(16),  // Hardcodé
  decoration: BoxDecoration(
    color: Color(0xFF037f8c),  // Hardcodé
    borderRadius: BorderRadius.circular(12),  // Hardcodé
  ),
)
```

### Rendre les composants theme-aware

Utilisez `Theme.of(context)` pour les styles contextuels.

```dart
Text(
  'Mon texte',
  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
    color: GardenColors.onSurface,
  ),
)
```

---

## Intégration Widgetbook

### Annotations obligatoires

Chaque composant doit avoir au moins **2 use cases** Widgetbook.

#### Structure

```
MonComposant/
├── mon_composant.dart        # Implémentation
└── mon_composant_usecase.dart # Use cases
```

#### Use cases minimaux

```dart
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// 1. Use case par défaut
@widgetbook.UseCase(name: 'Default', type: MonComposant)
Widget monComposantDefault(BuildContext context) {
  return const MonComposant(
    prop1: 'valeur par défaut',
  );
}

// 2. Use case avec variante
@widgetbook.UseCase(name: 'Custom', type: MonComposant)
Widget monComposantCustom(BuildContext context) {
  return const MonComposant(
    prop1: 'valeur personnalisée',
    prop2: CustomValue(),
  );
}

// 3. Use case montrant différents états
@widgetbook.UseCase(name: 'States', type: MonComposant)
Widget monComposantStates(BuildContext context) {
  return Column(
    children: const [
      MonComposant(state: State.active),
      MonComposant(state: State.disabled),
      MonComposant(state: State.loading),
    ],
  );
}
```

### Après création des use cases

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Tests

### Fichier de test obligatoire

**Convention :** `test/{niveau}/{composant}_test.dart`

```
lib/ui/widgets/atoms/Button/button.dart
→ test/atoms/button_test.dart
```

### Tests minimaux requis

```dart
void main() {
  group('MonComposant', () {
    // 1. Test de rendu
    testWidgets('affiche correctement', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MonComposant(prop: 'test'),
          ),
        ),
      );

      expect(find.byType(MonComposant), findsOneWidget);
    });

    // 2. Test des propriétés
    testWidgets('applique les props', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MonComposant(prop: 'test'),
          ),
        ),
      );

      expect(find.text('test'), findsOneWidget);
    });

    // 3. Test des interactions
    testWidgets('appelle le callback', (tester) async {
      bool called = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MonComposant(
              onTap: () => called = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(MonComposant));
      expect(called, isTrue);
    });

    // 4. Test des états
    testWidgets('affiche l\'état désactivé', (tester) async {
      // Test de l'état désactivé
    });

    // 5. Test des cas limites
    testWidgets('gère une valeur null', (tester) async {
      // Test avec valeur null
    });
  });
}
```

---

## Nommage des fichiers

### Convention snake_case

**Fichiers :** snake_case (`my_component.dart`)
**Classes :** PascalCase (`MyComponent`)

```
✅ lib/ui/widgets/atoms/MyButton/my_button.dart
   → class MyButton

❌ lib/ui/widgets/atoms/MyButton/MyButton.dart
   → Incohérent
```

### Un composant principal par fichier

Chaque fichier doit contenir **un seul composant public principal**.

```dart
// ✅ Bon : Un composant public
// my_button.dart
class MyButton extends StatelessWidget { }

// Helpers privés OK
class _MyButtonState extends State<MyButton> { }
Widget _buildIcon() { }

// ❌ Mauvais : Plusieurs composants publics
// buttons.dart
class PrimaryButton extends StatelessWidget { }
class SecondaryButton extends StatelessWidget { }
class TertiaryButton extends StatelessWidget { }
```

---

## Structure d'un composant

### Template recommandé

```dart
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';
import 'package:garden_ui/ui/foundation/padding/space_design_system.dart';

/// Description courte du composant.
///
/// Description détaillée expliquant le rôle, le comportement
/// et les cas d'usage du composant.
///
/// Exemple :
/// ```dart
/// MonComposant(
///   prop1: 'valeur',
///   prop2: () => print('Action'),
/// )
/// ```
class MonComposant extends StatelessWidget {
  /// Crée un [MonComposant].
  const MonComposant({
    super.key,
    required this.prop1,
    this.prop2,
  });

  /// Description de prop1.
  final String prop1;

  /// Description de prop2. Optionnelle.
  final VoidCallback? prop2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(GardenSpace.paddingMd),
      child: Text(prop1),
    );
  }
}
```

### Points clés

1. **Documentation dartdoc** (`///`)
2. **Imports organisés** (SDK → Flutter → External → Internal)
3. **Constructeur `const`** avec `super.key`
4. **Props documentées** avec `///`
5. **Design tokens** utilisés partout

---

## Exports

### Ajouter à `components.dart`

Après création d'un composant, l'exporter :

```dart
// lib/ui/components.dart

// Atoms
export 'widgets/atoms/Button/button.dart';
export 'widgets/atoms/MyNewAtom/my_new_atom.dart';  // ← Ajouter ici

// Molecules
export 'widgets/molecules/MenuItem/menu_item.dart';

// ...
```

---

## Checklist avant commit

### Pour chaque nouveau composant

- [ ] Niveau atomique correct (atom/molecule/organism)
- [ ] Utilise uniquement des design tokens
- [ ] Documentation dartdoc complète
- [ ] Au moins 2 use cases Widgetbook créés
- [ ] Code généré avec `build_runner`
- [ ] Tests unitaires créés (couverture > 80%)
- [ ] Tous les tests passent
- [ ] Exporté dans `components.dart`
- [ ] Vérifié visuellement dans Widgetbook
- [ ] Analyse statique sans erreurs

---

## Bonnes pratiques supplémentaires

### Performance

```dart
// ✅ Utiliser const
const GardenButton(label: 'OK', onPressed: null)

// ✅ Extraire les widgets statiques
const _Separator = Divider();

// ❌ Créer des widgets dans build
Widget build(context) {
  return Column(
    children: [
      Divider(),  // Recréé à chaque build
    ],
  );
}
```

### État

```dart
// ✅ Préférer StatelessWidget
class MyWidget extends StatelessWidget { }

// Utiliser StatefulWidget seulement si nécessaire
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}
```

### Null safety

```dart
// ✅ Typage strict
final String nonNullable;
final String? nullable;

// ✅ Valeurs par défaut plutôt que nullable
final Color color = Colors.blue;

// ❌ Éviter ! (force unwrap)
print(nullable!.length);
```

---

## Voir aussi

- [Atomic Design](atomic-design.md)
- [Architecture du projet](architecture.md)
- [Comment créer un atom](../how-to-guides/how-to-create-atom.md)
- [Comment créer une molecule](../how-to-guides/how-to-create-molecule.md)
- [Comment créer un organism](../how-to-guides/how-to-create-organism.md)
- [Standards de code](../reference/coding-standards.md)
- [Standards de tests](../reference/testing-standards.md)

