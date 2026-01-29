# Changelog

Toutes les modifications notables de ce projet sont documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/).

## [0.3.8] - 2026-01-29

### 🔧 Modifié
- **GardenCard** : Add backgroundColor to GardenCard

## [0.3.7] - 2026-01-29

### 🔧 Modifié
- **HierarchicalMenuItemWidget** : Fix slide animation when opening/closing submenus
- **HierarchicalMenu** : Fix slide animation when opening/closing submenus

## [0.3.6] - 2026-01-22

### 🔧 Modifié
- **AnalyticsSummaryCard** : Rename AnalyticType enum to AnalyticsSummaryFilter

## [0.3.5] - 2026-01-16

### 🔧 Modifié
- **AnalyticsSummaryCard** (#55) : add filter to AnalyticsSummaryCard widget

## [0.3.4] - 2025-12-12

### 🔧 Modifié
- **GardenToggle** (#42) : feat(GardenToggle) : add "enabledIcon" and "disabledIcon" parameters + update widget colors

### 🐛 Corrigé

- **HierarchicalMenu** (#43) : fix: hierarchical menu ontap handling
- **SensorAlertCard** (#43) : fix: sensor alert card display

## [0.3.3] - 2025-12-06

### 🐛 Corrigé

- **HierarchicalMenu** (#41) : fix: hierarchical menu

## [0.3.2] - 2025-12-05

### 🐛 Corrigé

- **NodeCard** (#40) : Rename NodeCard to AnalyticsSummaryCard (#40)

## [0.3.1] - 2025-12-05

### 🐛 Corrigé

- (#39) : add package properties to render icon on frontend project

## [0.3.0] - 2025-12-05

### ✨ Ajouté

- **NodeCard component** (#37) : Nouveau composant molecule pour les cartes de nœuds
- **Tooltip component** (#32) : Nouveau composant molecule pour les infobulles
- **GardenDialog component** (#32) : Nouveau composant atom pour les boites de dialogues
- **SensorAlertCard component** (#31) : Nouveau composant organism pour les cartes d'alerte capteur
- **Documentation Diataxis** (#30) : Refonte de la documentation selon la méthodologie Diataxis

### 🐛 Corrigé

- **HierarchicalMenu** (#38) : Ajout de la gestion de l'événement `onTap`

---

## [0.2.0] - 2025-10-30

### ✨ Ajouté

- Nouveau composant **Button** (atom) (#23)
- Nouveau composant **NotificationToast** (molecule) (#18)
- Nouveau composant **Card** (atom) (#24)
- Nouveaux **GardenIcons** (#28)

### 🔧 Modifié

- **Refactorisation complète du projet** (#26)
- Renommage du projet : `widgetbook_workspace` → `garden_ui`

### 🐛 Corrigé

- **Menu component** : le logo est maintenant injectable via paramètre
- **GardenRadius** : retourne maintenant `BorderRadius` au lieu de `BorderRadiusGeometry` (#28)

---

## [0.1.0] - 2025-09-19

Première release publique de GardenUI.

### ✨ Ajouté

#### Atoms
- **MenuIcon** atom avec support des états actif/inactif + tests
- **TabItem**
- Constantes **radius** et **shadow**

#### Molecules
- **MenuItem** molecule avec gestion de la sévérité (logout menu)
- **TabMenu**

#### Organisms
- **Menu** organism
- **HierarchicalMenu**

#### Foundation
- **GardenSpace** pour paddings et gaps
- Système de **couleurs** complet
- **Typographie** avec Google Fonts

#### Infrastructure
- **Cloud hosting** sur Widgetbook
- **Tests** unitaires pour Menu
- Ajout de la **licence** MIT
- Workflows **CI/CD** (analyze_and_test, release)

### 🔧 Modifié

- Améliorations du design de **TabItem** et layout de **TabMenu**

### 🐛 Corrigé

- Workflow CI/CD (`release.yml`)
- Warnings et erreurs de linting
- Opacité des **shadows**
- Export de toutes les classes du design system

---

👉 **[Documentation complète du changelog](doc/reference/changelog.md)**
