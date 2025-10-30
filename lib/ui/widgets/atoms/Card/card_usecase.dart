import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'card.dart';

@widgetbook.UseCase(name: 'Default', type: GardenCard)
Widget defaultCard(BuildContext context) {
  return GardenCard(
    hasShadow: context.knobs.boolean(label: 'Has Shadow', initialValue: true),
    hasBorder: context.knobs.boolean(label: 'Has Border', initialValue: false),
    child: const Text('Card content goes here', style: TextStyle(fontSize: 16)),
  );
}

@widgetbook.UseCase(name: 'With Border and Shadow', type: GardenCard)
Widget cardWithBorderAndShadow(BuildContext context) {
  return const GardenCard(
    hasShadow: true,
    hasBorder: true,
    child: Text(
      'Card with both border and shadow',
      style: TextStyle(fontSize: 16),
    ),
  );
}

@widgetbook.UseCase(name: 'With Border Only', type: GardenCard)
Widget cardWithBorderOnly(BuildContext context) {
  return const GardenCard(
    hasShadow: false,
    hasBorder: true,
    child: Text('Card with border only', style: TextStyle(fontSize: 16)),
  );
}

@widgetbook.UseCase(name: 'No Shadow or Border', type: GardenCard)
Widget cardPlain(BuildContext context) {
  return const GardenCard(
    hasShadow: false,
    hasBorder: false,
    child: Text(
      'Plain card without shadow or border',
      style: TextStyle(fontSize: 16),
    ),
  );
}
