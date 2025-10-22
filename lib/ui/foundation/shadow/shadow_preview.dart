import 'package:flutter/widgets.dart';
import 'package:garden_ui/ui/design_system.dart';

class ShadowPreview extends StatelessWidget {
  const ShadowPreview({super.key, required this.name, required this.styles});

  final String name;
  final Map<String, List<BoxShadow>> styles;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GardenColors.base.shade50,
      width: double.maxFinite,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Column(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name.toUpperCase(),
            style: GardenTypography.caption.copyWith(
              fontWeight: FontWeight.w200,
              fontSize: 11,
              color: GardenTypography.caption.color?.withValues(alpha: 0.64),
            ),
          ),
          Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final style in styles.entries)
                Container(
                  decoration: BoxDecoration(
                    boxShadow: style.value,
                    color: GardenColors.primary.shade300,
                  ),

                  child: Text(style.key),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
