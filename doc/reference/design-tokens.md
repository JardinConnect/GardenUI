# Design Tokens

## Vue d'ensemble

Les design tokens sont les valeurs fondamentales du design system GardenUI. Ils garantissent la cohérence visuelle et facilitent la maintenance en centralisant les définitions de styles.

## Couleurs (GardenColors)

**Emplacement :** `lib/ui/foundation/color/color_design_system.dart`

### Palettes principales

Chaque palette de couleurs contient 10 nuances (de 50 à 900), du plus clair au plus foncé.

#### Typography

Couleurs pour le texte et les éléments typographiques.

```dart
GardenColors.typography[50]   // #e6e6ec (très clair)
GardenColors.typography[100]  // #b0b1c4
GardenColors.typography[200]  // #8a8ca7
GardenColors.typography[300]  // #55577f
GardenColors.typography[400]  // #343666
GardenColors.typography[500]  // #010440 (défaut)
GardenColors.typography[600]  // #01043a
GardenColors.typography[700]  // #01032d
GardenColors.typography[800]  // #010223
GardenColors.typography[900]  // #00021b (très foncé)
```

#### Base

Couleurs de fond et surfaces neutres.

```dart
GardenColors.base[50]   // #fcfcfd (presque blanc)
GardenColors.base[100]  // #f4f5f8
GardenColors.base[200]  // #eff0f4
GardenColors.base[300]  // #e8eaf0
GardenColors.base[400]  // #e3e5ed
GardenColors.base[500]  // #dcdfe8 (défaut)
GardenColors.base[600]  // #c8cbd3
GardenColors.base[700]  // #9c9ea5
GardenColors.base[800]  // #797b80
GardenColors.base[900]  // #5c5e61
```

#### Primary

Couleur principale de la marque (cyan/turquoise).

```dart
GardenColors.primary[50]   // #e6f2f4
GardenColors.primary[100]  // #b1d7db
GardenColors.primary[200]  // #8bc4ca
GardenColors.primary[300]  // #56a9b2
GardenColors.primary[400]  // #3599a3
GardenColors.primary[500]  // #037f8c (défaut)
GardenColors.primary[600]  // #03747f
GardenColors.primary[700]  // #025a63
GardenColors.primary[800]  // #02464d
GardenColors.primary[900]  // #01353b
```

**Usage :** Boutons principaux, liens, éléments interactifs.

#### Secondary

Couleur secondaire (jaune/or).

```dart
GardenColors.secondary[50]   // #fbf6e7
GardenColors.secondary[100]  // #f2e2b6
GardenColors.secondary[200]  // #ecd492
GardenColors.secondary[300]  // #e4c061
GardenColors.secondary[400]  // #deb442
GardenColors.secondary[500]  // #d6a113 (défaut)
GardenColors.secondary[600]  // #c39311
GardenColors.secondary[700]  // #98720d
GardenColors.secondary[800]  // #76590a
GardenColors.secondary[900]  // #5a4408
```

**Usage :** Accents, badges, éléments secondaires.

#### Tertiary

Couleur tertiaire (vert).

```dart
GardenColors.tertiary[50]   // #effce8
GardenColors.tertiary[100]  // #ccf7b8
GardenColors.tertiary[200]  // #b4f396
GardenColors.tertiary[300]  // #91ee66
GardenColors.tertiary[400]  // #7cea49
GardenColors.tertiary[500]  // #5be51b (défaut)
GardenColors.tertiary[600]  // #53d019
GardenColors.tertiary[700]  // #41a313
GardenColors.tertiary[800]  // #327e0f
GardenColors.tertiary[900]  // #26600b
```

**Usage :** Indicateurs de succès, éléments positifs.

### Couleurs sémantiques

#### Red Alert (Erreur)

```dart
GardenColors.redAlert[50]   // #fdebeb
GardenColors.redAlert[100]  // #f8c1c1
GardenColors.redAlert[200]  // #f5a3a3
GardenColors.redAlert[300]  // #f07979
GardenColors.redAlert[400]  // #ed5f5f
GardenColors.redAlert[500]  // #e93737 (défaut)
GardenColors.redAlert[600]  // #d43232
GardenColors.redAlert[700]  // #a52727
GardenColors.redAlert[800]  // #801e1e
GardenColors.redAlert[900]  // #621717
```

**Usage :** Messages d'erreur, alertes critiques, actions destructrices.

#### Yellow Warning (Avertissement)

```dart
GardenColors.yellowWarning[50]   // #fdfae9
GardenColors.yellowWarning[100]  // #f9f0b9
GardenColors.yellowWarning[200]  // #f7e898
GardenColors.yellowWarning[300]  // #f3de68
GardenColors.yellowWarning[400]  // #f1d84b
GardenColors.yellowWarning[500]  // #edce1e (défaut)
GardenColors.yellowWarning[600]  // #d8bb1b
GardenColors.yellowWarning[700]  // #a89215
GardenColors.yellowWarning[800]  // #827111
GardenColors.yellowWarning[900]  // #64570d
```

**Usage :** Avertissements, messages d'attention.

#### Blue Info (Information)

```dart
GardenColors.blueInfo[50]   // #edf2fd
GardenColors.blueInfo[100]  // #c7d7f8
GardenColors.blueInfo[200]  // #acc4f5
GardenColors.blueInfo[300]  // #86a9f0
GardenColors.blueInfo[400]  // #6e99ed
GardenColors.blueInfo[500]  // #4a7fe9 (défaut)
GardenColors.blueInfo[600]  // #4374d4
GardenColors.blueInfo[700]  // #355aa5
GardenColors.blueInfo[800]  // #294680
GardenColors.blueInfo[900]  // #1f3562
```

**Usage :** Messages informatifs, tooltips, aide contextuelle.

### Utilisation

```dart
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';

// Utiliser une couleur
Container(
  color: GardenColors.primary[500],
  // ou simplement
  color: GardenColors.primary,
)

// Accès via les getters
Container(
  color: GardenColors.primary.shade500,
)
```

---

## Espacements (GardenSpace)

**Emplacement :** `lib/ui/foundation/padding/space_design_system.dart`

### Échelle d'espacement

Les espacements suivent une échelle cohérente :

| Token | Valeur | Usage typique |
|-------|--------|---------------|
| `GardenSpace.paddingXs` | 4px | Espacement minimal, padding de badges |
| `GardenSpace.paddingSm` | 8px | Padding compact, gaps entre icônes |
| `GardenSpace.paddingMd` | 16px | Padding standard, espacement par défaut |
| `GardenSpace.paddingLg` | 24px | Padding large, sections importantes |
| `GardenSpace.paddingXl` | 32px | Padding très large, séparation majeure |

### Gaps (espacements entre éléments)

| Token | Valeur | Usage typique |
|-------|--------|---------------|
| `GardenSpace.gapXs` | 4px | Gap minimal entre éléments liés |
| `GardenSpace.gapSm` | 8px | Gap compact |
| `GardenSpace.gapMd` | 16px | Gap standard |
| `GardenSpace.gapLg` | 24px | Gap large |
| `GardenSpace.gapXl` | 32px | Gap très large |

### Utilisation

```dart
import 'package:garden_ui/ui/foundation/padding/space_design_system.dart';

// Padding
Container(
  padding: EdgeInsets.all(GardenSpace.paddingMd),
  child: Text('Contenu'),
)

// Gap entre widgets
Column(
  children: [
    Widget1(),
    SizedBox(height: GardenSpace.gapMd),
    Widget2(),
  ],
)

// Padding asymétrique
Container(
  padding: EdgeInsets.symmetric(
    horizontal: GardenSpace.paddingLg,
    vertical: GardenSpace.paddingSm,
  ),
)
```

---

## Rayons de bordure (GardenRadius)

**Emplacement :** `lib/ui/foundation/radius/radius_design_system.dart`

### Échelle des rayons

| Token | Valeur | Usage typique |
|-------|--------|---------------|
| `GardenRadius.radiusXs` | 4px | Petits éléments, badges |
| `GardenRadius.radiusSm` | 8px | Boutons, chips |
| `GardenRadius.radiusMd` | 12px | Cartes, modales |
| `GardenRadius.radiusLg` | 16px | Grandes surfaces, containers |

### Utilisation

```dart
import 'package:garden_ui/ui/foundation/radius/radius_design_system.dart';

// Rayon sur un container
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: GardenRadius.radiusMd,
  ),
)

// Rayon personnalisé (coins spécifiques)
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(GardenRadius.radiusSizes['md']!),
      topRight: Radius.circular(GardenRadius.radiusSizes['md']!),
    ),
  ),
)
```

---

## Ombres (GardenShadow)

**Emplacement :** `lib/ui/foundation/shadow/shadow_design_system.dart`

Les ombres ajoutent de la profondeur et de la hiérarchie visuelle.

### Niveaux d'élévation

GardenUI définit plusieurs niveaux d'ombres pour différentes élévations d'éléments (à vérifier dans le fichier source pour les valeurs exactes).

### Utilisation typique

```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: GardenRadius.radiusMd,
    boxShadow: GardenShadow.elevation1, // Exemple
  ),
)
```

---

## Typographie (GardenTypography)

**Emplacement :** `lib/ui/foundation/typography/typography_design_system.dart`

La typographie définit les styles de texte utilisés dans toute l'application.

### Styles de texte

GardenUI utilise Google Fonts et définit une hiérarchie de styles textuels (à vérifier dans le fichier source pour les valeurs exactes) :

- Titres (heading)
- Corps de texte (body)
- Labels
- Captions

### Utilisation

```dart
import 'package:garden_ui/ui/foundation/typography/typography_design_system.dart';

Text(
  'Mon titre',
  style: GardenTypography.headingLarge,
)

Text(
  'Mon paragraphe',
  style: GardenTypography.bodyMedium,
)
```

---

## Bonnes pratiques

### ✅ À faire

- **Toujours** utiliser les design tokens au lieu de valeurs hardcodées
- Utiliser les tokens sémantiques (`redAlert`, `yellowWarning`) pour les états
- Respecter l'échelle d'espacement pour la cohérence
- Utiliser les nuances appropriées (50-900) selon le contexte

### ❌ À éviter

- Hardcoder des couleurs (`Colors.blue` au lieu de `GardenColors.primary`)
- Utiliser des valeurs d'espacement arbitraires (`8.5px` au lieu de tokens)
- Mélanger des systèmes de design (Material + GardenUI)
- Créer des variations de couleurs personnalisées sans ajouter aux tokens

---

## Personnalisation

Pour étendre les design tokens avec de nouvelles valeurs, modifiez les fichiers dans `lib/ui/foundation/` et exécutez les tests pour vérifier la cohérence.

---

## Voir aussi

- [Catalogue des composants](components-catalog.md)
- [Philosophie du design system](../explanation/design-system-philosophy.md)
- [Comment créer un composant](../how-to-guides/how-to-create-atom.md)

