# Philosophie du design system

## Vision

GardenUI vise à créer un **langage visuel cohérent** qui facilite la collaboration entre designers et développeurs tout en garantissant une expérience utilisateur uniforme et de qualité.

## Principes fondamentaux

### 1. Cohérence avant tout

**Principe :** Tous les composants doivent partager un langage visuel commun.

**Application :**
- Mêmes couleurs via `GardenColors`
- Mêmes espacements via `GardenSpace`
- Mêmes rayons de bordure via `GardenRadius`
- Même typographie via `GardenTypography`

**Bénéfice :** L'utilisateur reconnaît immédiatement les patterns et navigue intuitivement.

```dart
// ✅ Cohérent - utilise les tokens
Container(
  padding: EdgeInsets.all(GardenSpace.paddingMd),
  decoration: BoxDecoration(
    color: GardenColors.primary,
    borderRadius: GardenRadius.radiusMd,
  ),
)

// ❌ Incohérent - valeurs arbitraires
Container(
  padding: EdgeInsets.all(18),  // Pourquoi 18 ?
  decoration: BoxDecoration(
    color: Color(0xFF1234AB),  // D'où vient cette couleur ?
    borderRadius: BorderRadius.circular(13),  // Pourquoi 13 ?
  ),
)
```

---

### 2. Composition over inheritance

**Principe :** Construire des composants complexes en combinant des composants simples.

**Application :** L'Atomic Design encourage la composition naturelle.

```dart
// ✅ Composition - combine des composants existants
class UserCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return GardenCard(  // Atom existant
      child: Row(
        children: [
          CircleAvatar(),  // Atom
          Text(name),       // Atom
          GardenButton(),   // Atom
        ],
      ),
    );
  }
}

// ❌ Inheritance - crée des dépendances rigides
class UserCard extends GardenCard {  // Couplage fort
  // Difficile à modifier sans affecter la classe parente
}
```

**Bénéfice :** Flexibilité maximale et découplage des composants.

---

### 3. Accessibilité par défaut

**Principe :** Les composants doivent être accessibles sans configuration supplémentaire.

**Application :**
- Contraste de couleurs suffisant
- Tailles de touch targets conformes (minimum 48x48)
- Support des lecteurs d'écran
- Navigation au clavier

```dart
// Les composants GardenUI ont l'accessibilité intégrée
GardenButton(
  label: 'Valider',  // Label automatiquement accessible
  onPressed: () {},   // Tapable avec taille minimum
)
```

**Bénéfice :** Inclusion de tous les utilisateurs sans effort supplémentaire.

---

### 4. Performance first

**Principe :** Les composants doivent être optimisés pour les performances.

**Application :**
- Utilisation systématique de `const` constructors
- Éviter les rebuilds inutiles
- Lazy loading des ressources
- Widgets légers

```dart
// ✅ Performance optimale
const GardenButton(label: 'OK', onPressed: null)  // const = pas de rebuild

// ❌ Moins performant
GardenButton(label: 'OK', onPressed: null)  // Reconstruit à chaque rebuild parent
```

**Bénéfice :** Applications fluides même avec de nombreux composants.

---

### 5. Developer Experience (DX)

**Principe :** Les développeurs doivent pouvoir utiliser la librairie facilement et intuitivement.

**Application :**
- API simple et prévisible
- Documentation complète
- Catalogue Widgetbook interactif
- Messages d'erreur clairs

```dart
// API claire et auto-documentée
GardenButton(
  label: 'Valider',          // Que fait ce paramètre ? C'est clair !
  onPressed: () => submit(), // Simple et prévisible
)
```

**Bénéfice :** Adoption rapide et peu de bugs.

---

### 6. Évolutivité

**Principe :** Le design system doit pouvoir grandir sans refonte majeure.

**Application :**
- Architecture en couches claire
- Dépendances unidirectionnelles
- Design tokens centralisés
- Versioning sémantique

**Bénéfice :** Ajout de fonctionnalités sans casser l'existant.

---

## Design Tokens : La fondation

### Pourquoi des tokens ?

Les design tokens sont les **décisions de design codifiées en variables réutilisables**.

**Avantages :**

1. **Single Source of Truth**
   ```dart
   // Changer une couleur une fois...
   static const primary = Color(0xFF037f8c);
   
   // ... met à jour partout automatiquement
   ```

2. **Cohérence garantie**
   ```dart
   // Impossible d'utiliser une valeur non standard
   EdgeInsets.all(GardenSpace.paddingMd)  // ✅ 16px standardisé
   // vs
   EdgeInsets.all(17)  // ❌ Valeur arbitraire
   ```

3. **Thèmes facilités**
   ```dart
   // Mode sombre ? Changez les tokens !
   GardenColors.primary  // Adapte automatiquement
   ```

### Types de tokens dans GardenUI

#### 1. Couleurs (Semantic tokens)

```dart
GardenColors.primary      // Action principale
GardenColors.secondary    // Action secondaire
GardenColors.error        // Erreurs et dangers
GardenColors.success      // Succès
GardenColors.warning      // Avertissements
```

**Principe :** Nommer par fonction, pas par couleur.

❌ Mauvais : `blueColor`, `redColor`
✅ Bon : `primary`, `error`

#### 2. Espacements (Scale-based)

```dart
GardenSpace.paddingXs   // 4px
GardenSpace.paddingSm   // 8px
GardenSpace.paddingMd   // 16px
GardenSpace.paddingLg   // 24px
GardenSpace.paddingXl   // 32px
```

**Principe :** Échelle cohérente et limitée (évite l'anarchie des valeurs).

#### 3. Typographie (Hierarchical)

```dart
GardenTypography.headingLarge
GardenTypography.headingMedium
GardenTypography.bodyLarge
GardenTypography.bodyMedium
```

**Principe :** Hiérarchie claire reflétant l'importance du contenu.

---

## Composants : Principes de conception

### 1. Single Responsibility Principle

Chaque composant a **une seule raison d'exister**.

```dart
// ✅ Responsabilité unique
class GardenButton {
  // Responsabilité : Être un bouton cliquable
}

// ❌ Trop de responsabilités
class MegaWidget {
  // Bouton + Form + Navigation + ... = Trop !
}
```

### 2. Composition over configuration

**Préférer :**
```dart
Row(
  children: [
    GardenIcon(icon: Icons.star),
    Text('Favoris'),
  ],
)
```

**À :**
```dart
GardenButton(
  showIcon: true,
  icon: Icons.star,
  iconPosition: IconPosition.left,
  label: 'Favoris',
  iconColor: Colors.blue,
  iconSize: 24,
  // ... 20 autres paramètres de configuration
)
```

**Pourquoi ?** Composition = flexibilité infinie sans complexité.

### 3. Props minimales et nécessaires

Chaque prop doit être justifiée.

**Questions à se poser :**
- Ce paramètre est-il vraiment nécessaire ?
- Peut-on déduire cette valeur automatiquement ?
- Cette prop rend-elle le composant plus simple ou plus complexe ?

```dart
// ✅ API minimale et claire
class GardenButton {
  final String label;
  final VoidCallback? onPressed;
}

// ❌ Trop de props "au cas où"
class OverEngineeredButton {
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? elevation;
  // ... 20 autres props
  // Pourquoi ne pas utiliser les tokens ?
}
```

### 4. États explicites

Les états doivent être évidents et sans ambiguïté.

```dart
// ✅ État clair
GardenButton(
  label: 'Valider',
  onPressed: null,  // null = désactivé (convention Flutter)
)

// ❌ État ambigu
GardenButton(
  label: 'Valider',
  enabled: false,  // Paramètre supplémentaire inutile
  onPressed: () {},
)
```

---

## Thématisation

### Approche

GardenUI fournit des design tokens adaptables mais **ne force pas** un système de thème complexe.

**Philosophie :** Simplicité > Complexité

```dart
// Thème simple via tokens
Container(
  color: GardenColors.primary,  // Adapte automatiquement
)

// vs système de thème ultra-complexe avec 50 niveaux d'héritage
```

### Extension possible

Les projets peuvent étendre avec leur propre thématisation :

```dart
// Projet peut wrapper GardenUI dans son ThemeData
ThemeData(
  primaryColor: GardenColors.primary,
  // ... autres mappings
)
```

---

## Philosophie de la documentation

### DIATAXIS

GardenUI adopte le framework [DIATAXIS](https://diataxis.fr/) :

1. **Tutorials** : Apprendre en faisant
2. **How-to Guides** : Résoudre des problèmes spécifiques
3. **Reference** : Information technique détaillée
4. **Explanation** : Comprendre les concepts

**Pourquoi ?** Structure claire qui guide l'utilisateur selon son besoin.

### Documentation intégrée

```dart
/// Documentation dartdoc visible dans l'IDE
///
/// Exemple d'utilisation :
/// ```dart
/// GardenButton(label: 'OK', onPressed: () {})
/// ```
class GardenButton { }
```

### Widgetbook : Documentation vivante

Le catalogue Widgetbook est une **documentation interactive** où on peut voir et tester les composants en temps réel.

---

## Contributions et gouvernance

### Principes

1. **Qualité > Quantité** : Mieux vaut 10 composants excellents que 100 médiocres
2. **Revue systématique** : Chaque composant est reviewé avant merge
3. **Tests obligatoires** : Couverture > 80%
4. **Standards stricts** : Linter + analyse statique

### Processus de décision

```
Proposition de composant
         ↓
Review architecture (Atom/Molecule/Organism ?)
         ↓
Review API (Props nécessaires ?)
         ↓
Review implémentation (Code quality)
         ↓
Review tests (Couverture suffisante ?)
         ↓
Merge et publication
```

---

## Conclusion

La philosophie de GardenUI repose sur des principes simples mais robustes :

- **Cohérence** via les design tokens
- **Simplicité** via la composition
- **Qualité** via les standards stricts
- **Évolutivité** via l'architecture en couches

Ces principes garantissent un design system qui **reste pertinent et maintenable** dans le temps.

## Voir aussi

- [Architecture du projet](architecture.md)
- [Atomic Design](atomic-design.md)
- [Guidelines de développement](component-guidelines.md)
- [Design Tokens](../reference/design-tokens.md)

