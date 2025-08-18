import 'package:flutter/widgets.dart';
import 'typography_design_system.dart';

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({
    super.key,
    required this.name,
    required this.styles,
  });

  final String name;
  final Map<String, TextStyle> styles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name.toUpperCase(),
          style: GardenTypography.caption.copyWith(
            fontWeight: FontWeight.w200,
            fontSize: 11,
            color: GardenTypography.caption.color?.withValues(alpha: 0.64),
          ),
        ),
        for (final style in styles.entries) Text(style.key, style: style.value),
      ],
    );
  }
}
