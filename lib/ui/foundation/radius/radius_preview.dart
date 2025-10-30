import 'package:flutter/widgets.dart';
import 'package:garden_ui/ui/design_system.dart';

class RadiusPreview extends StatelessWidget {
  const RadiusPreview({super.key, required this.name, required this.styles});

  final String name;
  final Map<String, BorderRadiusGeometry> styles;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
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
        for (final style in styles.entries)
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: style.value,
              color: GardenColors.primary.shade300,
            ),
            child: Text(style.key),
          ),
      ],
    );
  }
}
