import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';

void main() {
  group('GardenTooltip Widget Tests', () {
    testWidgets('renders TooltipIconButton', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenTooltip(
              title: 'Tooltip Title',
              content: Text('Tooltip Content'),
            ),
          ),
        ),
      );

      expect(find.byType(TooltipIconButton), findsOneWidget);
      expect(find.byType(GardenDialog), findsNothing);
    });

    testWidgets('opens dialog with correct title and content on press', (
      WidgetTester tester,
    ) async {
      const title = 'Help Info';
      const contentText = 'Here is more detailed information.';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GardenTooltip(title: title, content: Text(contentText)),
          ),
        ),
      );

      await tester.tap(find.byType(TooltipIconButton));
      await tester.pumpAndSettle();

      expect(find.byType(GardenDialog), findsOneWidget);
      expect(find.text(title), findsOneWidget);
      expect(find.text(contentText), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(find.byType(GardenDialog), findsNothing);
    });
  });
}
