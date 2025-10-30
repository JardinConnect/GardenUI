import 'package:flutter/material.dart';

/// Enumération pour les types d'alerte du menu hiérarchique
enum MenuAlertType { none, warning, error }

/// Modèle de données pour un élément de menu hiérarchique
class HierarchicalMenuItem {
  /// Identifiant unique de l'élément
  final String id;

  /// Titre principal de l'élément
  final String title;

  /// Sous-information (température, humidité, etc.)
  final String? subtitle;

  /// Icône de l'élément
  final IconData? icon;

  /// Type d'alerte (aucune, avertissement, erreur)
  final MenuAlertType alertType;

  /// Niveau de profondeur dans la hiérarchie (1-5)
  final int level;

  /// Liste des éléments enfants
  final List<HierarchicalMenuItem> children;

  /// Indique si l'élément est ouvert/fermé
  final bool isExpanded;

  /// Callback appelé lors du tap sur l'élément
  final VoidCallback? onTap;

  /// Callback appelé lors de l'expansion/collapse
  final ValueChanged<bool>? onExpansionChanged;

  const HierarchicalMenuItem({
    required this.id,
    required this.title,
    this.subtitle,
    this.icon,
    this.alertType = MenuAlertType.none,
    this.level = 1,
    this.children = const [],
    this.isExpanded = false,
    this.onTap,
    this.onExpansionChanged,
  });

  /// Crée une copie de l'élément avec les propriétés modifiées
  HierarchicalMenuItem copyWith({
    String? id,
    String? title,
    String? subtitle,
    IconData? icon,
    MenuAlertType? alertType,
    int? level,
    List<HierarchicalMenuItem>? children,
    bool? isExpanded,
    VoidCallback? onTap,
    ValueChanged<bool>? onExpansionChanged,
  }) {
    return HierarchicalMenuItem(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      icon: icon ?? this.icon,
      alertType: alertType ?? this.alertType,
      level: level ?? this.level,
      children: children ?? this.children,
      isExpanded: isExpanded ?? this.isExpanded,
      onTap: onTap ?? this.onTap,
      onExpansionChanged: onExpansionChanged ?? this.onExpansionChanged,
    );
  }

  /// Vérifie si l'élément a des enfants
  bool get hasChildren => children.isNotEmpty;

  /// Retourne la couleur associée au niveau
  Color get levelColor {
    // Note: Consider using LevelIndicator component directly instead
    // of calculating colors here for better consistency
    switch (level) {
      case 1:
        return const Color(0xFF037f8c); // GardenColors.primary.shade500
      case 2:
        return const Color(0xFFd6a113); // GardenColors.secondary.shade500
      case 3:
        return const Color(0xFF5be51b); // GardenColors.tertiary.shade500
      case 4:
        return const Color(0xFF4a7fe9); // GardenColors.blueInfo.shade500
      case 5:
        return const Color(0xFFedce1e); // GardenColors.yellowWarning.shade500
      default:
        return const Color(0xFFe3e5ed); // GardenColors.base.shade400
    }
  }
}
