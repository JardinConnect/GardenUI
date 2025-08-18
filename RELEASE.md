# Documentation de release GardenUI

## Workflows CI/CD

Le projet utilise des workflows GitHub Actions pour automatiser certaines tâches importantes :

### Workflow `analyze_and_test`

Ce workflow s'exécute automatiquement à chaque **push** ou **pull request**.  
Il a pour objectif de :

- **Analyser le code** pour détecter les erreurs ou les mauvaises pratiques.
- **Exécuter les tests unitaires** pour s'assurer que le code est fonctionnel et stable.

### Workflow `release`

Ce workflow se déclenche lorsque vous créez une **Release GitHub**.  
Il permet de :

- **Valider la version** de la librairie.
- **Préparer la librairie** pour une utilisation dans d'autres projets.

## Utilisation de la librairie dans un projet

Comme la librairie n'est pas publiée sur [pub.dev](https://pub.dev), elle est auto-hébergée. Vous pouvez l'utiliser dans vos projets en ajoutant la dépendance suivante dans le fichier `pubspec.yaml` :

```yaml
dependencies:
  garden_ui:
    git:
      url: https://github.com/JardinConnect/GardenUI.git
      ref: v1.0.0 # Remplacez par le tag, la branche ou le commit souhaité
```

## Publier une Release

Pour créer une nouvelle release :

1. **Créer un tag** correspondant à la version (par exemple, `v1.0.0`).
2. **Créer une Release GitHub** en associant le tag créé.
3. Le workflow `release` se chargera de valider et préparer la version.
