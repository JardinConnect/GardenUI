import 'package:flutter/widgets.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';
import 'package:widgetbook_workspace/ui/foundation/padding/space_design_system.dart';

class PaddingPreview extends StatelessWidget {
  const PaddingPreview({super.key, required this.name, required this.styles});

  final String name;
  final Map<String, double> styles;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: GardenSpace.gapMd,
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
            padding: EdgeInsets.all(style.value),
            decoration: BoxDecoration(color: GardenColors.primary.shade300),
            child: Text(style.key),
          ),
      ],
    );
  }
}

class GapPreview extends StatelessWidget {
  const GapPreview({super.key, required this.name, required this.styles});

  final String name;
  final Map<String, double> styles;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: GardenSpace.gapMd,
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
          Row(
            spacing: style.value,
            children: [
              Container(
                color: GardenColors.primary.shade500,
                child: Text(style.key),
              ),
              Container(
                color: GardenColors.primary.shade500,
                child: Text(style.key),
              ),
            ],
          ),
      ],
    );
  }
}
