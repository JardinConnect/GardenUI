import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:garden_ui/ui/design_system.dart';

import 'card.dart';

@UseCase(name: 'Variants', type: GardenCard)
Widget buildCardUseCase(BuildContext context) {
  return const _CardShowcase();
}

class _CardShowcase extends StatelessWidget {
  const _CardShowcase();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          color: GardenColors.base.shade100,
          padding: EdgeInsets.all(GardenSpace.paddingMd),
          child: Column(
            spacing: GardenSpace.gapLg,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Default (with shadow)', style: GardenTypography.bodyLg),
              const GardenCard(
                child: Text('Card with shadow', style: TextStyle(fontSize: 16)),
              ),
              Text('With border and shadow', style: GardenTypography.bodyLg),
              const GardenCard(
                hasShadow: true,
                hasBorder: true,
                child: Text(
                  'Card with both border and shadow',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Text('With border only', style: GardenTypography.bodyLg),
              const GardenCard(
                hasShadow: false,
                hasBorder: true,
                child: Text(
                  'Card with border only',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Text('No shadow or border', style: GardenTypography.bodyLg),
              const GardenCard(
                hasShadow: false,
                hasBorder: false,
                child: Text(
                  'Plain card without shadow or border',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
