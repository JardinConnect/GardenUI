# Comment créer un organism

## Vue d'ensemble

Ce guide vous montre comment créer un nouveau composant organism dans GardenUI.

## Qu'est-ce qu'un organism ?

Un **organism** est un composant complexe qui combine plusieurs atoms et molecules :
- Peut contenir de la logique métier
- Compose atoms et molecules
- Peut être spécifique à certains cas d'usage
- Exemples : menus de navigation, formulaires complets, cards complexes

## Étapes de création

### 1. Analyser la composition

Avant de créer un organism, identifiez :
- Les atoms nécessaires
- Les molecules existantes réutilisables
- Les nouvelles molecules à créer
- La logique d'état à gérer

**Exemple :** Pour un `UserProfileCard`, nous avons besoin de :
- Avatar (atom ou image)
- Texte pour nom/email (atoms)
- Badge de statut (atom)
- Boutons d'action (atoms)
- Structure de carte (molecule ou layout)

### 2. Créer la structure de dossiers

```
lib/ui/widgets/organisms/UserProfileCard/
├── user_profile_card.dart
└── user_profile_card_usecase.dart
```

### 3. Créer le modèle de données (optionnel)

Si votre organism a besoin de données structurées, créez un modèle dans `lib/ui/models/` :

**Fichier :** `lib/ui/models/user_profile_model.dart`

```dart
/// Modèle représentant un profil utilisateur
class UserProfileModel {
  const UserProfileModel({
    required this.name,
    required this.email,
    this.avatarUrl,
    this.isOnline = false,
    this.role,
  });

  final String name;
  final String email;
  final String? avatarUrl;
  final bool isOnline;
  final String? role;
}
```

### 4. Créer le fichier du composant

**Fichier :** `lib/ui/widgets/organisms/UserProfileCard/user_profile_card.dart`

```dart
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';
import 'package:garden_ui/ui/foundation/padding/space_design_system.dart';
import 'package:garden_ui/ui/foundation/radius/radius_design_system.dart';
import 'package:garden_ui/ui/widgets/atoms/Card/card.dart';
import 'package:garden_ui/ui/widgets/atoms/Button/button.dart';
import 'package:garden_ui/ui/models/user_profile_model.dart';

/// Une carte de profil utilisateur complète.
///
/// Affiche les informations d'un utilisateur avec des actions
/// possibles. Combine plusieurs atoms et molecules pour créer
/// une interface cohérente.
class UserProfileCard extends StatelessWidget {
  const UserProfileCard({
    super.key,
    required this.profile,
    this.onMessageTap,
    this.onProfileTap,
  });

  /// Les données du profil utilisateur
  final UserProfileModel profile;

  /// Callback lorsqu'on clique sur "Message"
  final VoidCallback? onMessageTap;

  /// Callback lorsqu'on clique sur le profil
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    return GardenCard(
      child: InkWell(
        onTap: onProfileTap,
        borderRadius: BorderRadius.circular(GardenRadius.m),
        child: Padding(
          padding: const EdgeInsets.all(GardenSpace.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête avec avatar et statut
              Row(
                children: [
                  // Avatar
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: GardenColors.primaryContainer,
                        backgroundImage: profile.avatarUrl != null
                            ? NetworkImage(profile.avatarUrl!)
                            : null,
                        child: profile.avatarUrl == null
                            ? Text(
                                _getInitials(profile.name),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: GardenColors.onPrimaryContainer,
                                ),
                              )
                            : null,
                      ),
                      // Indicateur en ligne
                      if (profile.isOnline)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: GardenColors.success,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: GardenColors.surface,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: GardenSpace.m),
                  // Informations
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: GardenSpace.xxs),
                        Text(
                          profile.email,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: GardenColors.onSurfaceVariant,
                          ),
                        ),
                        if (profile.role != null) ...[
                          const SizedBox(height: GardenSpace.xs),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: GardenSpace.s,
                              vertical: GardenSpace.xxs,
                            ),
                            decoration: BoxDecoration(
                              color: GardenColors.secondaryContainer,
                              borderRadius: BorderRadius.circular(GardenRadius.s),
                            ),
                            child: Text(
                              profile.role!,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: GardenColors.onSecondaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              
              // Actions
              if (onMessageTap != null) ...[
                const SizedBox(height: GardenSpace.l),
                Row(
                  children: [
                    Expanded(
                      child: GardenButton(
                        label: 'Envoyer un message',
                        onPressed: onMessageTap!,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }
}
```

### 5. Créer les use cases Widgetbook

**Fichier :** `lib/ui/widgets/organisms/UserProfileCard/user_profile_card_usecase.dart`

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:garden_ui/ui/widgets/organisms/UserProfileCard/user_profile_card.dart';
import 'package:garden_ui/ui/models/user_profile_model.dart';

@widgetbook.UseCase(name: 'Online User', type: UserProfileCard)
Widget userProfileCardOnline(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 400,
      child: UserProfileCard(
        profile: const UserProfileModel(
          name: 'Marie Dupont',
          email: 'marie.dupont@example.com',
          isOnline: true,
          role: 'Administratrice',
        ),
        onMessageTap: () {
          debugPrint('Message tapped');
        },
        onProfileTap: () {
          debugPrint('Profile tapped');
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Offline User', type: UserProfileCard)
Widget userProfileCardOffline(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 400,
      child: UserProfileCard(
        profile: const UserProfileModel(
          name: 'Jean Martin',
          email: 'jean.martin@example.com',
          isOnline: false,
        ),
        onMessageTap: () {
          debugPrint('Message tapped');
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Avatar', type: UserProfileCard)
Widget userProfileCardWithAvatar(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 400,
      child: UserProfileCard(
        profile: const UserProfileModel(
          name: 'Sophie Laurent',
          email: 'sophie.laurent@example.com',
          avatarUrl: 'https://i.pravatar.cc/150?img=1',
          isOnline: true,
          role: 'Développeuse',
        ),
        onMessageTap: () {
          debugPrint('Message tapped');
        },
      ),
    ),
  );
}
```

### 6. Exporter le composant et le modèle

Dans `lib/ui/components.dart` :

```dart
// Organisms
export 'widgets/organisms/UserProfileCard/user_profile_card.dart';

// Models
export 'models/user_profile_model.dart';
```

### 7. Générer le code Widgetbook

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 8. Créer les tests

**Fichier :** `test/organisms/user_profile_card_test.dart`

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/widgets/organisms/UserProfileCard/user_profile_card.dart';
import 'package:garden_ui/ui/models/user_profile_model.dart';

void main() {
  group('UserProfileCard', () {
    const testProfile = UserProfileModel(
      name: 'Test User',
      email: 'test@example.com',
    );

    testWidgets('affiche le nom et l\'email', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UserProfileCard(profile: testProfile),
          ),
        ),
      );

      expect(find.text('Test User'), findsOneWidget);
      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('affiche les initiales quand pas d\'avatar', 
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UserProfileCard(profile: testProfile),
          ),
        ),
      );

      expect(find.text('TU'), findsOneWidget);
    });

    testWidgets('affiche l\'indicateur en ligne', (WidgetTester tester) async {
      const onlineProfile = UserProfileModel(
        name: 'Test User',
        email: 'test@example.com',
        isOnline: true,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UserProfileCard(profile: onlineProfile),
          ),
        ),
      );

      // Vérifier la présence d'un Container pour le statut en ligne
      final onlineIndicators = tester.widgetList<Container>(
        find.byType(Container),
      ).where((container) {
        final decoration = container.decoration as BoxDecoration?;
        return decoration?.shape == BoxShape.circle;
      });

      expect(onlineIndicators.isNotEmpty, isTrue);
    });

    testWidgets('affiche le bouton message si callback fourni', 
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserProfileCard(
              profile: testProfile,
              onMessageTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Envoyer un message'), findsOneWidget);
    });

    testWidgets('appelle le callback message au tap', 
        (WidgetTester tester) async {
      bool tapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserProfileCard(
              profile: testProfile,
              onMessageTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Envoyer un message'));
      expect(tapped, isTrue);
    });

    testWidgets('affiche le rôle si fourni', (WidgetTester tester) async {
      const profileWithRole = UserProfileModel(
        name: 'Test User',
        email: 'test@example.com',
        role: 'Admin',
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UserProfileCard(profile: profileWithRole),
          ),
        ),
      );

      expect(find.text('Admin'), findsOneWidget);
    });
  });
}
```

### 9. Lancer les tests

```bash
flutter test test/organisms/user_profile_card_test.dart
```

## Règles à respecter

### ✅ Bonnes pratiques pour les organisms

- Composer atoms et molecules existants
- Créer des modèles de données si nécessaire
- Gérer l'état complexe si nécessaire
- Exposer des callbacks pour les interactions
- Documenter les dépendances
- Rester focalisé sur un cas d'usage clair

### ❌ À éviter

- Recréer des atoms existants au lieu de les réutiliser
- Mélanger trop de responsabilités non liées
- Hardcoder des données (utiliser des modèles)
- Créer des organisms trop génériques (préférer des molecules)

## Quand créer un organism ?

Créez un organism quand :
- ✅ Vous combinez 5+ composants (atoms + molecules)
- ✅ Il y a de la logique métier à encapsuler
- ✅ Le composant représente une fonctionnalité complète
- ✅ Le composant est réutilisable dans plusieurs contextes similaires

Ne créez PAS d'organism si :
- ❌ C'est trop simple (faire une molecule)
- ❌ C'est trop spécifique à une seule page (garder dans features/)
- ❌ Ça ne compose pas de composants existants

## Checklist finale

- [ ] Organism créé en composant atoms et molecules
- [ ] Modèle de données créé si nécessaire
- [ ] Documentation dartdoc complète
- [ ] Use cases Widgetbook variés (minimum 3)
- [ ] Tests unitaires complets
- [ ] État géré correctement
- [ ] Callbacks exposés
- [ ] Design tokens utilisés
- [ ] Exporté dans `components.dart`
- [ ] Validé visuellement dans Widgetbook

## Voir aussi

- [Comment créer un atom](how-to-create-atom.md)
- [Comment créer une molecule](how-to-create-molecule.md)
- [Comprendre l'Atomic Design](../explanation/atomic-design.md)
- [Architecture du projet](../explanation/architecture.md)

