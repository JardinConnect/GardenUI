# Menu Hiérarchique Multi-Niveaux

## Vue d'ensemble

Le composant `HierarchicalMenu` est un menu vertical hiérarchique qui permet d'afficher une structure d'éléments extensibles/collapsibles sur jusqu'à 5 niveaux de profondeur. Ce composant suit l'architecture Atomic Design du projet GardenUI.

## Architecture

### Foundation

- **Couleurs** : Système de couleurs GardenUI avec palette spécifique pour chaque niveau
- **Typographie** : Styles de texte adaptés selon la taille du composant
- **Espacement** : Système d'espacement uniforme

### Atoms

- **`LevelIndicator`** : Barre colorée verticale indiquant le niveau de profondeur
- **`AlertIndicator`** : Icône d'alerte (triangle jaune/rouge) pour les avertissements et erreurs

### Molecules

- **`HierarchicalMenuItemWidget`** : Élément individuel du menu avec titre, sous-titre, icônes et interactions

### Organisms

- **`HierarchicalMenu`** : Menu complet avec gestion de l'état, animations et interactions

### Models

- **`HierarchicalMenuItem`** : Modèle de données pour représenter un élément de menu

## Caractéristiques

### Structure hiérarchique

- ✅ Jusqu'à 5 niveaux de profondeur
- ✅ Expansion/collapse avec animation fluide
- ✅ Indentation automatique selon le niveau
- ✅ Indicateur coloré de niveau (barre gauche)

### Contenu des éléments

- ✅ Titre principal
- ✅ Sous-information optionnelle (température, humidité, etc.)
- ✅ Icône optionnelle
- ✅ Indicateur d'alerte (warning/error)
- ✅ Chevron pour les éléments avec enfants

### Interactions

- ✅ Clic pour expand/collapse
- ✅ Sélection d'éléments
- ✅ Callbacks personnalisables
- ✅ Animation de rotation du chevron

### Styles

- ✅ 3 tailles disponibles (sm, md, lg)
- ✅ Coins arrondis
- ✅ États hover et sélectionné
- ✅ Couleurs configurables par niveau

## Utilisation

### Exemple basique

```dart
HierarchicalMenu(
  items: [
    HierarchicalMenuItem(
      id: 'serre1',
      title: 'Serre principale',
      subtitle: '24°C - 65%',
      icon: Icons.home,
      level: 1,
      alertType: MenuAlertType.warning,
      children: [
        HierarchicalMenuItem(
          id: 'zone_a',
          title: 'Zone A',
          subtitle: '22°C - 70%',
          level: 2,
        ),
      ],
    ),
  ],
  onItemSelected: (item) {
    print('Élément sélectionné: ${item.title}');
  },
)
```

### Exemple avancé avec gestion d'état

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String? selectedItemId;
  late List<HierarchicalMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return HierarchicalMenu(
      items: items,
      size: HierarchicalMenuSize.lg,
      selectedItemId: selectedItemId,
      maxHeight: 600,
      onItemSelected: (item) {
        setState(() {
          selectedItemId = item.id;
        });
      },
      onItemExpansionChanged: (item) {
        // Mise à jour de l'état d'expansion
        setState(() {
          items = updateItemInTree(items, item);
        });
      },
    );
  }
}
```

## API

### `HierarchicalMenuItem`

| Propriété    | Type                         | Obligatoire | Description        |
| ------------ | ---------------------------- | ----------- | ------------------ |
| `id`         | `String`                     | ✅          | Identifiant unique |
| `title`      | `String`                     | ✅          | Titre principal    |
| `subtitle`   | `String?`                    | ❌          | Sous-information   |
| `icon`       | `IconData?`                  | ❌          | Icône de l'élément |
| `alertType`  | `MenuAlertType`              | ❌          | Type d'alerte      |
| `level`      | `int`                        | ❌          | Niveau (1-5)       |
| `children`   | `List<HierarchicalMenuItem>` | ❌          | Éléments enfants   |
| `isExpanded` | `bool`                       | ❌          | État d'expansion   |

### `HierarchicalMenu`

| Propriété                | Type                                  | Obligatoire | Description                 |
| ------------------------ | ------------------------------------- | ----------- | --------------------------- |
| `items`                  | `List<HierarchicalMenuItem>`          | ✅          | Éléments racine             |
| `size`                   | `HierarchicalMenuSize`                | ❌          | Taille du menu              |
| `selectedItemId`         | `String?`                             | ❌          | ID de l'élément sélectionné |
| `onItemSelected`         | `ValueChanged<HierarchicalMenuItem>?` | ❌          | Callback de sélection       |
| `onItemExpansionChanged` | `ValueChanged<HierarchicalMenuItem>?` | ❌          | Callback d'expansion        |
| `maxWidth`               | `double?`                             | ❌          | Largeur maximale            |
| `maxHeight`              | `double?`                             | ❌          | Hauteur maximale            |

### `MenuAlertType`

```dart
enum MenuAlertType { none, warning, error }
```

### `HierarchicalMenuSize`

```dart
enum HierarchicalMenuSize { sm, md, lg }
```

## Couleurs par niveau

1. **Niveau 1** : Bleu primaire (`GardenColors.primary.shade500`)
2. **Niveau 2** : Jaune secondaire (`GardenColors.secondary.shade500`)
3. **Niveau 3** : Vert tertiaire (`GardenColors.tertiary.shade500`)
4. **Niveau 4** : Bleu info (`GardenColors.blueInfo.shade500`)
5. **Niveau 5** : Jaune warning (`GardenColors.yellowWarning.shade500`)

## Tests

Le composant est couvert par des tests unitaires complets :

```bash
flutter test test/organisms/hierarchical_menu_test.dart
```

## Widgetbook

Les composants sont documentés dans Widgetbook avec plusieurs cas d'usage :

- Menu par défaut
- Menu avec tous les niveaux
- Exemple complet avec données réalistes
- Menu petit format avec imbrication profonde

Lancer Widgetbook :

```bash
flutter run
```

## Performance

- ✅ Animations optimisées avec `AnimationController`
- ✅ Gestion efficace de l'état avec `StatefulWidget`
- ✅ Lazy loading des animations par élément
- ✅ Disposal automatique des ressources

## Accessibilité

- ✅ Support des lecteurs d'écran
- ✅ Navigation clavier
- ✅ Contraste de couleurs respecté
- ✅ Tailles tactiles appropriées
