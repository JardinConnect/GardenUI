# Standards de code Dart/Flutter

## Vue d'ensemble

Ce document définit les standards de code à respecter pour contribuer à GardenUI. Ces règles garantissent un code cohérent, maintenable et de qualité.

## Principes généraux

### Suivre flutter_lints

Le projet utilise [flutter_lints](https://pub.dev/packages/flutter_lints) qui applique les règles recommandées par l'équipe Flutter.

**Configuration :** `analysis_options.yaml`

### Utiliser `const` autant que possible

Les constructeurs `const` améliorent les performances en évitant les reconstructions inutiles.

**✅ Bon :**
```dart
const Text('Hello')
const SizedBox(height: 16)
const EdgeInsets.all(8)
```

**❌ Mauvais :**
```dart
Text('Hello')
SizedBox(height: 16)
EdgeInsets.all(8)
```

### Préférer `final` à `var`

Pour les variables immutables, utilisez `final`.

**✅ Bon :**
```dart
final userName = 'John';
final users = <User>[];
```

**❌ Mauvais :**
```dart
var userName = 'John';  // Si non réassigné
var users = <User>[];   // Si non réassigné
```

---

## Organisation des imports

### Ordre des imports

1. Imports Dart SDK (`dart:xxx`)
2. Imports Flutter (`package:flutter/xxx`)
3. Imports de packages externes (`package:xxx`)
4. Imports internes du projet (relatifs)

Séparez chaque groupe par une ligne vide.

**✅ Bon :**
```dart
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../foundation/color/color_design_system.dart';
import '../foundation/padding/space_design_system.dart';
```

**❌ Mauvais :**
```dart
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../foundation/color/color_design_system.dart';
import 'package:flutter/material.dart';
```

### Éviter les imports relatifs profonds

Utilisez des exports regroupés quand c'est possible.

**✅ Bon :**
```dart
import 'package:garden_ui/ui/design_system.dart';
```

**❌ Mauvais :**
```dart
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';
import 'package:garden_ui/ui/foundation/padding/space_design_system.dart';
import 'package:garden_ui/ui/foundation/radius/radius_design_system.dart';
// ... 10 autres imports
```

---

## Développement de widgets

### Toujours inclure le paramètre `key`

```dart
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});  // ✅

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

### Préférer StatelessWidget

Utilisez `StatelessWidget` quand l'état n'est pas nécessaire.

**✅ Bon :**
```dart
class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.label});
  
  final String label;
  
  @override
  Widget build(BuildContext context) {
    return Text(label);
  }
}
```

**❌ Mauvais :**
```dart
class MyButton extends StatefulWidget {  // Pas besoin de State ici
  const MyButton({super.key, required this.label});
  
  final String label;
  
  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.label);
  }
}
```

### Extraire les widgets complexes

Divisez les arbres de widgets complexes en widgets ou méthodes séparés.

**✅ Bon :**
```dart
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      _buildHeader(),
      _buildContent(),
      _buildFooter(),
    ],
  );
}

Widget _buildHeader() {
  return Container(...);
}
```

**❌ Mauvais :**
```dart
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        child: Row(
          children: [
            // 50 lignes de widgets imbriqués...
          ],
        ),
      ),
      // 100 lignes supplémentaires...
    ],
  );
}
```

### Noms descriptifs

Utilisez des noms qui indiquent clairement le rôle du widget.

**✅ Bon :**
```dart
class UserProfileCard extends StatelessWidget { }
class SearchField extends StatelessWidget { }
class NotificationBadge extends StatelessWidget { }
```

**❌ Mauvais :**
```dart
class MyWidget extends StatelessWidget { }
class Widget1 extends StatelessWidget { }
class Temp extends StatelessWidget { }
```

---

## Documentation

### Documentation dartdoc

Ajoutez des commentaires `///` pour toutes les APIs publiques.

**✅ Bon :**
```dart
/// Un bouton stylisé suivant le design system GardenUI.
///
/// Ce bouton supporte les états actif et désactivé.
/// Utilisez [onPressed] null pour désactiver le bouton.
///
/// Exemple :
/// ```dart
/// GardenButton(
///   label: 'Cliquez-moi',
///   onPressed: () => print('Cliqué'),
/// )
/// ```
class GardenButton extends StatelessWidget {
  /// Crée un [GardenButton].
  const GardenButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  /// Le texte affiché sur le bouton.
  final String label;

  /// Callback appelé au tap. Si null, le bouton est désactivé.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // ...
  }
}
```

### Commentaires dans le code

Utilisez des commentaires pour expliquer le "pourquoi", pas le "quoi".

**✅ Bon :**
```dart
// Workaround pour un bug Flutter : https://github.com/flutter/flutter/issues/12345
await Future.delayed(Duration.zero);
```

**❌ Mauvais :**
```dart
// Créer une variable x
final x = 10;

// Additionner x et y
final result = x + y;
```

---

## Null Safety

### Exploiter le système de types

Dart a une null safety robuste. Utilisez-la correctement.

**✅ Bon :**
```dart
String? nullableString;
String nonNullableString = 'Hello';

// Vérification explicite
if (nullableString != null) {
  print(nullableString.length);  // Safe
}

// Opérateur ??
final value = nullableString ?? 'default';
```

**❌ Mauvais :**
```dart
String? nullableString;

// Force unwrap dangereux
print(nullableString!.length);  // ❌ Peut crasher
```

### Éviter `!` (force unwrap)

N'utilisez l'opérateur `!` que si vous êtes **absolument certain** que la valeur n'est pas null.

**✅ Acceptable :**
```dart
final user = users.firstWhere((u) => u.id == id);
// On sait que user existe grâce à la logique métier
print(user!.name);
```

**✅ Meilleur :**
```dart
final user = users.firstWhere(
  (u) => u.id == id,
  orElse: () => throw UserNotFoundException(),
);
print(user.name);  // Pas de ! nécessaire
```

### Paramètres optionnels avec valeurs par défaut

Préférez les valeurs par défaut aux paramètres nullables.

**✅ Bon :**
```dart
class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    this.color = Colors.blue,  // Valeur par défaut
    this.size = 24.0,
  });

  final Color color;
  final double size;
}
```

**❌ Mauvais :**
```dart
class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    this.color,  // Nullable
    this.size,
  });

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    // Gestion manuelle des nulls partout
    final actualColor = color ?? Colors.blue;
    final actualSize = size ?? 24.0;
  }
}
```

---

## Performance

### Utiliser `const` pour les widgets statiques

Les widgets `const` ne sont pas reconstruits lors des rebuilds.

**✅ Bon :**
```dart
Column(
  children: [
    const Text('Titre'),  // const = pas de rebuild
    DynamicWidget(data: state.data),  // Seul ce widget se reconstruit
  ],
)
```

### Éviter les builds inutiles

```dart
// ✅ Bon : Extraction en widget const
class _Title extends StatelessWidget {
  const _Title();
  
  @override
  Widget build(BuildContext context) {
    return const Text('Titre');
  }
}

// ❌ Mauvais : Recréé à chaque build
Widget _buildTitle() {
  return const Text('Titre');
}
```

### Keys pour les listes

Utilisez des keys pour les listes dynamiques.

**✅ Bon :**
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    final item = items[index];
    return MyItem(
      key: ValueKey(item.id),  // ✅
      item: item,
    );
  },
)
```

---

## Nommage

### Conventions

- **Classes** : PascalCase (`GardenButton`, `MenuItemData`)
- **Fichiers** : snake_case (`garden_button.dart`, `menu_item_data.dart`)
- **Variables/Fonctions** : camelCase (`userName`, `calculateTotal`)
- **Constantes** : camelCase (`defaultPadding`, `maxLength`)
- **Privé** : Préfixe `_` (`_privateMethod`, `_MyPrivateWidget`)

### Noms significatifs

**✅ Bon :**
```dart
final userName = getUserName();
final totalPrice = calculateTotalPrice(items);
void submitForm() { }
```

**❌ Mauvais :**
```dart
final x = getUN();
final tp = calc(items);
void sub() { }
```

---

## Bonnes pratiques spécifiques à GardenUI

### Utiliser les design tokens

**✅ Bon :**
```dart
Container(
  padding: const EdgeInsets.all(GardenSpace.paddingMd),
  decoration: BoxDecoration(
    color: GardenColors.primary[500],
    borderRadius: GardenRadius.radiusMd,
  ),
)
```

**❌ Mauvais :**
```dart
Container(
  padding: const EdgeInsets.all(16),  // Hardcodé
  decoration: BoxDecoration(
    color: Color(0xFF037f8c),  // Hardcodé
    borderRadius: BorderRadius.circular(12),  // Hardcodé
  ),
)
```

### Exports organisés

Exportez les composants dans `lib/ui/components.dart` :

```dart
// Atoms
export 'widgets/atoms/Button/button.dart';
export 'widgets/atoms/Card/card.dart';

// Molecules
export 'widgets/molecules/MenuItem/menu_item.dart';
```

---

## Vérification

### Exécuter l'analyse

```bash
flutter analyze
```

Corrigez tous les warnings et erreurs avant de commiter.

### Formater le code

```bash
dart format .
```

---

## Voir aussi

- [analyse_options.yaml](../../analysis_options.yaml) - Configuration du linter
- [Standards de tests](testing-standards.md)
- [Guidelines de composants](../explanation/component-guidelines.md)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)

