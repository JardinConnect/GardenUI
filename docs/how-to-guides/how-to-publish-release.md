# Comment publier une release

## Vue d'ensemble

Ce guide explique le processus complet pour créer et publier une nouvelle version de GardenUI.

## Prérequis

- Accès en écriture au dépôt GitHub
- Tous les tests doivent passer
- Le code doit être mergé dans la branche `master`

## Processus de release

### Étape 1 : Préparer le CHANGELOG

Avant de créer une release, mettez à jour le `CHANGELOG.md` :

```markdown
## [0.2.0] - 2025-11-12

### Ajouté
- Nouveau composant SearchField (molecule)
- Support des thèmes sombres
- Documentation DIATAXIS complète

### Modifié
- Amélioration des performances du Menu
- Mise à jour de la typographie

### Corrigé
- Bug d'affichage du NotificationIcon
- Problème de padding dans GardenCard

### Déprécié
- Ancienne API du Button (sera supprimée en v1.0.0)
```

### Étape 2 : Mettre à jour la version

Modifiez le `pubspec.yaml` pour incrémenter la version :

```yaml
name: garden_ui
description: "Garden Connect UI library"
version: 0.3.0  # Nouvelle version (exemple)
```

### Étape 3 : Commit des changements

```bash
git add CHANGELOG.md pubspec.yaml
git commit -m "chore: bump version to 0.2.0"
git push origin main
```

### Étape 4 : Créer un tag Git

Créez un tag correspondant à la version :

```bash
git tag -a v0.3.0 -m "Release version 0.3.0"
git push origin v0.3.0
```

### Étape 5 : Créer la Release GitHub

1. Allez sur [GitHub Releases](https://github.com/JardinConnect/GardenUI/releases)
2. Cliquez sur **Draft a new release**
3. Remplissez les champs :
   - **Tag** : Sélectionnez `v0.3.0` (le tag créé à l'étape 4)
   - **Release title** : `v0.3.0`
   - **Description** : Copiez le contenu du CHANGELOG pour cette version

```markdown
## 🎉 Release 0.3.0

### ✨ Nouveautés
- Nouveau composant SearchField (molecule)
- Support des thèmes sombres
- Documentation DIATAXIS complète

### 🔧 Améliorations
- Amélioration des performances du Menu
- Mise à jour de la typographie

### 🐛 Corrections
- Bug d'affichage du NotificationIcon
- Problème de padding dans GardenCard

### ⚠️ Dépréciations
- Ancienne API du Button (sera supprimée en v1.0.0)

### 📦 Installation

Ajoutez cette version dans votre `pubspec.yaml` :

\```yaml
dependencies:
  garden_ui:
    git:
      url: git@github.com:JardinConnect/GardenUI.git
      ref: v0.3.0
\```
```

4. Cliquez sur **Publish release**

### Étape 6 : Vérification automatique

Le workflow GitHub Actions `release` se déclenche automatiquement et :
- ✅ Valide le code
- ✅ Exécute tous les tests
- ✅ Vérifie la version

Consultez l'onglet **Actions** pour voir le statut.

## Versioning sémantique

GardenUI suit le [Semantic Versioning](https://semver.org/) (SemVer) :

### Format : MAJOR.MINOR.PATCH

- **MAJOR** (1.0.0) : Changements incompatibles avec l'API existante
- **MINOR** (0.2.0) : Ajout de fonctionnalités rétrocompatibles
- **PATCH** (0.1.1) : Corrections de bugs rétrocompatibles

### Exemples

#### Incrémenter PATCH (0.1.0 → 0.1.1)

Corrections de bugs uniquement :
```
- Fix: Correction du padding du Button
- Fix: Résolution d'un crash dans le Menu
```

#### Incrémenter MINOR (0.1.0 → 0.2.0)

Nouvelles fonctionnalités rétrocompatibles :
```
- Feat: Nouveau composant SearchField
- Feat: Ajout du support des thèmes
- Fix: Correction de bugs mineurs
```

#### Incrémenter MAJOR (0.9.0 → 1.0.0)

Changements non rétrocompatibles :
```
- Breaking: Renommage de GardenButton en Button
- Breaking: Suppression de l'ancienne API Menu
- Feat: Nouvelle architecture de thèmes
```

## Préversions

Pour les versions de développement, utilisez des suffixes :

- **Alpha** : `0.2.0-alpha.1` (très instable)
- **Beta** : `0.2.0-beta.1` (fonctionnalités complètes, mais non testées)
- **RC** : `0.2.0-rc.1` (Release Candidate, prêt sauf bugs critiques)

```bash
git tag -a v0.2.0-beta.1 -m "Beta 1 for version 0.2.0"
git push origin v0.2.0-beta.1
```

## Workflow CI/CD

Le workflow `release` (`.github/workflows/release.yml`) s'exécute automatiquement quand vous créez une Release GitHub.

### Ce que fait le workflow :

1. ✅ Vérifie que le code compile
2. ✅ Exécute l'analyse statique (`flutter analyze`)
3. ✅ Lance tous les tests (`flutter test`)
4. ✅ Valide la version dans `pubspec.yaml`

Si un test échoue, la release reste publiée mais vous devez corriger rapidement.

## Communiquer la release

### 1. Notification aux utilisateurs

Informez les utilisateurs de la nouvelle version :
- Annonce dans le canal de communication de l'équipe
- Mise à jour de la documentation
- Email aux principaux utilisateurs

### 2. Migration guide (si breaking changes)

Pour les changements majeurs, créez un guide de migration :

**Fichier :** `docs/how-to-guides/migration-v1.md`

```markdown
# Migration vers v1.0.0

## Changements incompatibles

### Button renommé
**Avant (v0.x):**
\```dart
GardenButton(label: 'Click', onPressed: () {})
\```

**Après (v1.x):**
\```dart
Button(label: 'Click', onPressed: () {})
\```

### Menu API simplifiée
...
```

## Rollback d'une release

Si une release contient un bug critique :

### Option 1 : Publier un patch rapidement

```bash
# Corriger le bug
git commit -m "fix: critical bug in Menu"
git push

# Créer une version patch
git tag -a v0.2.1 -m "Hotfix for v0.2.0"
git push origin v0.2.1
```

Puis créez une nouvelle Release GitHub avec `v0.2.1`.

### Option 2 : Marquer la release comme "Pre-release"

1. Allez sur la page de la Release sur GitHub
2. Cliquez sur **Edit**
3. Cochez **Set as a pre-release**
4. Ajoutez un avertissement dans la description

## Checklist complète

Avant de publier une release, vérifiez :

- [ ] Tous les tests passent localement (`flutter test`)
- [ ] L'analyse statique ne remonte pas d'erreurs (`flutter analyze`)
- [ ] Le CHANGELOG.md est à jour
- [ ] La version dans pubspec.yaml est incrémentée
- [ ] Les breaking changes sont documentés
- [ ] Un guide de migration existe (si nécessaire)
- [ ] Le tag Git est créé et poussé
- [ ] La Release GitHub est publiée
- [ ] Le workflow CI/CD passe
- [ ] La documentation est à jour
- [ ] Les utilisateurs sont informés

## Calendrier de releases

### Releases régulières

- **Patch** : Au besoin (bugs critiques)
- **Minor** : Tous les mois (nouvelles fonctionnalités)
- **Major** : Tous les 6-12 mois (breaking changes)

### Releases d'urgence (hotfix)

Pour les bugs critiques affectant la production, créez un hotfix immédiatement :

```bash
git checkout -b hotfix/0.2.1
# Corriger le bug
git commit -m "fix: critical security issue"
git checkout main
git merge hotfix/0.2.1
git tag -a v0.2.1 -m "Hotfix: security patch"
git push origin main v0.2.1
```

## Voir aussi

- [Workflows CI/CD](../reference/ci-cd-workflows.md)
- [CHANGELOG](../reference/changelog.md)
- [Versioning sémantique](https://semver.org/)

