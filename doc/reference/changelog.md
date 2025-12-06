# Historique des versions (CHANGELOG)

Toutes les modifications notables de ce projet sont documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/),
et ce projet adhère au [Versioning Sémantique](https://semver.org/lang/fr/).

---

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

## [0.2.0] - 2025-10-30

### ✨ Ajouté

- **Button component** (#23) : Nouveau composant atom pour les boutons
- **NotificationToast component** (#18) : Nouveau composant molecule pour les notifications toast
- **Card component** (#24) : Nouveau composant atom pour les cartes
- **GardenIcons** (#28) : Nouvelle collection d'icônes personnalisées

### 🔧 Modifié

- **Refactorisation du projet** (#26) : Réorganisation complète de la structure du code
- **Renommage** : Le projet passe de `widgetbook_workspace` à `garden_ui`

### 🐛 Corrigé

- **Menu component** : Le logo est maintenant injectable via un paramètre au lieu d'être hardcodé
- **GardenRadius** (#29) : Retourne désormais `BorderRadius` au lieu de `BorderRadiusGeometry` pour plus de flexibilité

---

## [0.1.0] - 2025-09-19

Première release publique de GardenUI.

### ✨ Ajouté

#### Atoms
- **MenuIcon** : Icône de menu avec support des états actif/inactif et tests complets
- **TabItem** : Élément de tabulation individuel
- **Constantes radius et shadow** : Valeurs de design tokens pour rayons et ombres

#### Molecules
- **MenuItem** : Élément de menu combinant icône et label avec support de la sévérité (gestion logout menu)
- **TabMenu** : Menu à onglets horizontal

#### Organisms
- **Menu** : Menu de navigation vertical complet
- **HierarchicalMenu** : Menu de navigation avec support de hiérarchie et sous-menus

#### Foundation
- **GardenSpace** : Système d'espacement pour paddings et gaps
- **Système de couleurs** : Palettes complètes (primary, secondary, tertiary, semantic)
- **Typographie** : Styles typographiques avec Google Fonts

#### Infrastructure
- **Cloud hosting** : Déploiement Widgetbook sur Cloudflare
- **Tests unitaires** : Tests complets pour le composant Menu
- **Licence MIT** : Ajout de la licence open source
- **Workflows CI/CD** : Pipelines GitHub Actions pour analyze_and_test et release

### 🔧 Modifié

- **Design TabItem** : Améliorations visuelles de TabItem
- **Layout TabMenu** : Optimisation de la mise en page du TabMenu

### 🐛 Corrigé

- **Workflow CI/CD** : Corrections dans `release.yml` pour le bon fonctionnement
- **Linting** : Résolution de tous les warnings et erreurs de lint
- **Shadows opacity** : Correction de l'opacité des ombres
- **Exports** : Export de toutes les classes du design system dans le fichier principal

---

## Format des versions futures

Chaque version suivra cette structure :

### [Version] - Date

#### ✨ Ajouté (Added)
Nouvelles fonctionnalités ajoutées.

#### 🔧 Modifié (Changed)
Changements dans les fonctionnalités existantes.

#### 🐛 Corrigé (Fixed)
Corrections de bugs.

#### ⚠️ Déprécié (Deprecated)
Fonctionnalités qui seront bientôt supprimées.

#### 🗑️ Supprimé (Removed)
Fonctionnalités supprimées.

#### 🔒 Sécurité (Security)
Corrections de vulnérabilités de sécurité.

---

## Voir aussi

- [Comment publier une release](../how-to-guides/how-to-publish-release.md)
- [Workflows CI/CD](ci-cd-workflows.md)
- [Versioning Sémantique](https://semver.org/lang/fr/)
