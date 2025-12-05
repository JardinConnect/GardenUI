# Construire un formulaire complet

## Introduction

Dans ce tutoriel, vous allez apprendre à composer plusieurs composants GardenUI (atoms et molecules) pour créer un formulaire de connexion complet.

## Objectif

Créer un formulaire de connexion avec :
- Champs de saisie pour email et mot de passe
- Un bouton de soumission
- Une notification de succès/erreur

## Étape 1 : Préparer la structure

Créez un nouveau fichier `login_form.dart` dans votre projet :

```dart
import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';
```

## Étape 2 : Créer le widget de formulaire

```dart
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _notificationMessage;
  bool _isSuccess = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Simuler une connexion réussie
      setState(() {
        _isSuccess = true;
        _notificationMessage = 'Connexion réussie !';
      });

      // Masquer la notification après 3 secondes
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _notificationMessage = null;
          });
        }
      });
    } else {
      setState(() {
        _isSuccess = false;
        _notificationMessage = 'Veuillez corriger les erreurs';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Notification (molecule)
          if (_notificationMessage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: GardenSpace.m),
              child: NotificationToast(
                message: _notificationMessage!,
                type: _isSuccess 
                    ? NotificationType.success 
                    : NotificationType.error,
              ),
            ),

          // Champ Email
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'votre@email.com',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre email';
              }
              if (!value.contains('@')) {
                return 'Email invalide';
              }
              return null;
            },
          ),

          const SizedBox(height: GardenSpace.m),

          // Champ Mot de passe
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Mot de passe',
              hintText: '••••••••',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre mot de passe';
              }
              if (value.length < 6) {
                return 'Le mot de passe doit contenir au moins 6 caractères';
              }
              return null;
            },
          ),

          const SizedBox(height: GardenSpace.l),

          // Bouton de connexion (atom)
          GardenButton(
            label: 'Se connecter',
            onPressed: _handleSubmit,
          ),
        ],
      ),
    );
  }
}
```

## Étape 3 : Intégrer le formulaire dans une page

```dart
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(GardenSpace.l),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: GardenCard(
              child: Padding(
                padding: const EdgeInsets.all(GardenSpace.l),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo ou titre
                    Text(
                      'Bienvenue',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: GardenSpace.xl),
                    
                    // Formulaire
                    const LoginForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

## Étape 4 : Lancer l'application

```dart
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GardenUI Login Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: GardenColors.primary,
        ),
      ),
      home: const LoginPage(),
    );
  }
}
```

Exécutez l'application :

```bash
flutter run -d chrome
```

## Étape 5 : Améliorer avec des composants avancés

Vous pouvez enrichir votre formulaire avec d'autres composants GardenUI :

### Ajouter un indicateur de niveau de sécurité du mot de passe

```dart
LevelIndicator(
  level: _getPasswordStrength(_passwordController.text),
  maxLevel: 4,
)
```

### Ajouter un menu de navigation

```dart
Menu(
  items: [
    MenuItem(
      icon: GardenIcon.home,
      label: 'Accueil',
      onTap: () => Navigator.pushNamed(context, '/home'),
    ),
    MenuItem(
      icon: GardenIcon.user,
      label: 'Profil',
      onTap: () => Navigator.pushNamed(context, '/profile'),
    ),
  ],
)
```

## Composition des composants

Ce tutoriel illustre la puissance de l'Atomic Design :

```
LoginPage (Page)
└── GardenCard (Atom)
    └── LoginForm (Organism)
        ├── NotificationToast (Molecule)
        ├── TextFormField (Atom Flutter natif)
        └── GardenButton (Atom)
```

## Points clés à retenir

1. **Composition** : Les composants complexes sont construits en combinant des composants plus simples
2. **Design Tokens** : Utilisez toujours `GardenSpace`, `GardenColors`, etc. pour la cohérence
3. **État** : Gérez l'état local avec `StatefulWidget` pour les interactions
4. **Validation** : Utilisez le système de validation de Flutter pour les formulaires
5. **Accessibilité** : Ajoutez des labels et des hints pour une meilleure expérience utilisateur

## Félicitations ! 🎉

Vous maîtrisez maintenant la composition de composants GardenUI pour créer des interfaces complètes et cohérentes.

## Prochaines étapes

- [Explorer tous les composants disponibles](../reference/components-catalog.md)
- [Comprendre les design tokens](../reference/design-tokens.md)
- [Apprendre à créer des organisms complexes](../how-to-guides/how-to-create-organism.md)

