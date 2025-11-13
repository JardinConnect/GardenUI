# Catalogue des composants

## Vue d'ensemble

Ce catalogue présente tous les composants disponibles dans GardenUI, organisés selon la hiérarchie de l'Atomic Design.

## Atoms

Les atoms sont les composants les plus simples et indivisibles du design system.

### GardenButton

**Emplacement :** `lib/ui/widgets/atoms/Button/button.dart`

Bouton standard avec support des états actif et désactivé.

**Propriétés :**
- `label` (String, requis) : Texte affiché sur le bouton
- `onPressed` (VoidCallback?, requis) : Callback appelé au tap (null = désactivé)

**Exemple :**
```dart
GardenButton(
  label: 'Cliquez-moi',
  onPressed: () {
    print('Bouton cliqué !');
  },
)
```

---

### GardenCard

**Emplacement :** `lib/ui/widgets/atoms/Card/card.dart`

Conteneur avec élévation et coins arrondis pour grouper du contenu.

**Propriétés :**
- `child` (Widget, requis) : Contenu de la carte

**Exemple :**
```dart
GardenCard(
  child: Padding(
    padding: EdgeInsets.all(GardenSpace.m),
    child: Text('Contenu de la carte'),
  ),
)
```

---

### GardenIcon

**Emplacement :** `lib/ui/widgets/atoms/GardenIcon/garden_icon.dart`

Icône stylisée avec support des couleurs du design system.

**Propriétés :**
- `icon` (IconData, requis) : Icône Material à afficher
- `color` (Color?) : Couleur de l'icône
- `size` (double?) : Taille de l'icône

**Exemple :**
```dart
GardenIcon(
  icon: Icons.home,
  color: GardenColors.primary,
  size: 24,
)
```

---

### MenuIcon

**Emplacement :** `lib/ui/widgets/atoms/MenuIcon/menu_icon.dart`

Icône spécialisée pour les menus, avec support des états actif/inactif.

**Propriétés :**
- `icon` (IconData, requis) : Icône à afficher
- `isSelected` (bool) : Si l'icône est dans l'état sélectionné

**Exemple :**
```dart
MenuIcon(
  icon: Icons.dashboard,
  isSelected: true,
)
```

---

### NotificationIcon

**Emplacement :** `lib/ui/widgets/atoms/NotificationIcon/notification_icon.dart`

Icône de notification avec badge de compteur optionnel.

**Propriétés :**
- `icon` (IconData, requis) : Icône de notification
- `count` (int?) : Nombre de notifications (affiche un badge si > 0)

**Exemple :**
```dart
NotificationIcon(
  icon: Icons.notifications,
  count: 5,
)
```

---

### AlertIndicator

**Emplacement :** `lib/ui/widgets/atoms/AlertIndicator/alert_indicator.dart`

Indicateur visuel pour les alertes et notifications importantes.

**Propriétés :**
- `severity` (AlertSeverity, requis) : Niveau de sévérité (info, warning, error, success)
- `size` (double?) : Taille de l'indicateur

**Exemple :**
```dart
AlertIndicator(
  severity: AlertSeverity.warning,
  size: 12,
)
```

---

### LevelIndicator

**Emplacement :** `lib/ui/widgets/atoms/LevelIndicator/level_indicator.dart`

Indicateur de niveau ou de progression avec segments colorés.

**Propriétés :**
- `level` (int, requis) : Niveau actuel
- `maxLevel` (int, requis) : Niveau maximum
- `color` (Color?) : Couleur des segments remplis

**Exemple :**
```dart
LevelIndicator(
  level: 3,
  maxLevel: 5,
)
```

---

### TabItem

**Emplacement :** `lib/ui/widgets/atoms/TabItem/tab_item.dart`

Élément de tabulation individuel.

**Propriétés :**
- `label` (String, requis) : Texte de l'onglet
- `isSelected` (bool) : Si l'onglet est sélectionné
- `onTap` (VoidCallback?) : Callback au tap

**Exemple :**
```dart
TabItem(
  label: 'Accueil',
  isSelected: true,
  onTap: () => print('Tab tapped'),
)
```

---

## Molecules

Les molecules combinent plusieurs atoms pour former des unités fonctionnelles.

### MenuItem

**Emplacement :** `lib/ui/widgets/molecules/MenuItem/menu_item.dart`

Élément de menu combinant une icône et un label.

**Propriétés :**
- `icon` (IconData, requis) : Icône du menu item
- `label` (String, requis) : Texte du menu item
- `isSelected` (bool) : Si l'item est sélectionné
- `onTap` (VoidCallback?) : Callback au tap

**Exemple :**
```dart
MenuItem(
  icon: Icons.home,
  label: 'Accueil',
  isSelected: true,
  onTap: () => navigateToHome(),
)
```

---

### HierarchicalMenuItem

**Emplacement :** `lib/ui/widgets/molecules/HierarchicalMenuItem/hierarchical_menu_item.dart`

Élément de menu avec support de la hiérarchie (items enfants).

**Propriétés :**
- `icon` (IconData, requis) : Icône du menu item
- `label` (String, requis) : Texte du menu item
- `isExpanded` (bool) : Si les enfants sont affichés
- `hasChildren` (bool) : Si l'item a des enfants
- `onTap` (VoidCallback?) : Callback au tap

**Exemple :**
```dart
HierarchicalMenuItem(
  icon: Icons.folder,
  label: 'Documents',
  isExpanded: true,
  hasChildren: true,
  onTap: () => toggleExpansion(),
)
```

---

### NotificationToast

**Emplacement :** `lib/ui/widgets/molecules/Notification/notification_toast.dart`

Toast de notification avec message et type (succès, erreur, info).

**Propriétés :**
- `message` (String, requis) : Message à afficher
- `type` (NotificationType, requis) : Type de notification
- `onDismiss` (VoidCallback?) : Callback de fermeture

**Exemple :**
```dart
NotificationToast(
  message: 'Opération réussie !',
  type: NotificationType.success,
  onDismiss: () => hideNotification(),
)
```

---

### TabMenu

**Emplacement :** `lib/ui/widgets/molecules/TabMenu/tab_menu.dart`

Menu à onglets horizontal.

**Propriétés :**
- `tabs` (List\<String\>, requis) : Liste des labels d'onglets
- `selectedIndex` (int) : Index de l'onglet sélectionné
- `onTabSelected` (ValueChanged\<int\>?) : Callback de sélection

**Exemple :**
```dart
TabMenu(
  tabs: ['Tous', 'En cours', 'Terminés'],
  selectedIndex: 0,
  onTabSelected: (index) => onTabChange(index),
)
```

---

## Organisms

Les organisms sont des composants complexes combinant atoms et molecules.

### Menu

**Emplacement :** `lib/ui/widgets/organisms/Menu/menu.dart`

Menu de navigation vertical avec plusieurs items.

**Propriétés :**
- `items` (List\<MenuItemData\>, requis) : Liste des items du menu
- `selectedIndex` (int?) : Index de l'item sélectionné
- `onItemSelected` (ValueChanged\<int\>?) : Callback de sélection

**Exemple :**
```dart
Menu(
  items: [
    MenuItemData(icon: Icons.home, label: 'Accueil'),
    MenuItemData(icon: Icons.settings, label: 'Paramètres'),
  ],
  selectedIndex: 0,
  onItemSelected: (index) => navigate(index),
)
```

---

### HierarchicalMenu

**Emplacement :** `lib/ui/widgets/organisms/HierarchicalMenu/hierarchical_menu.dart`

Menu de navigation avec support de la hiérarchie et des sous-menus.

**Propriétés :**
- `items` (List\<HierarchicalMenuItemData\>, requis) : Items avec hiérarchie
- `onItemSelected` (ValueChanged\<String\>?) : Callback avec l'ID de l'item

**Exemple :**
```dart
HierarchicalMenu(
  items: [
    HierarchicalMenuItemData(
      id: 'docs',
      icon: Icons.folder,
      label: 'Documents',
      children: [
        HierarchicalMenuItemData(
          id: 'personal',
          icon: Icons.person,
          label: 'Personnel',
        ),
      ],
    ),
  ],
  onItemSelected: (id) => navigateTo(id),
)
```

---

## Explorer dans Widgetbook

Pour visualiser et interagir avec tous ces composants :

```bash
flutter run -d chrome
```

Naviguez dans les catégories **Atoms**, **Molecules**, et **Organisms** pour voir tous les use cases disponibles.

## Voir aussi

- [Design Tokens](design-tokens.md) - Couleurs, espacements, etc.
- [Comment créer un atom](../how-to-guides/how-to-create-atom.md)
- [Comment créer une molecule](../how-to-guides/how-to-create-molecule.md)
- [Comment créer un organism](../how-to-guides/how-to-create-organism.md)

