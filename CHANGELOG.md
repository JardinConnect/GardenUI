# Changelog

Toutes les modifications notables de ce projet sont documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/).

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
