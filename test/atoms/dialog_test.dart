import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';
import 'package:garden_ui/ui/foundation/color/color_design_system.dart';
import 'package:garden_ui/ui/foundation/shadow/shadow_design_system.dart';

void main() {
  group('GardenDialog Widget Tests', () {
    testWidgets('renders title and content correctly', (
      WidgetTester tester,
    ) async {
      const testTitle = 'Test Dialog';
      const testContent = Text('This is content');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenDialog(title: testTitle, content: testContent),
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text('This is content'), findsOneWidget);
      expect(find.byType(GardenDialog), findsOneWidget);
    });

    testWidgets('shows close button when dismissible is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenDialog(
              title: 'Title',
              content: Text('Content'),
              dismissible: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('does not show close button when dismissible is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenDialog(
              title: 'Title',
              content: Text('Content'),
              dismissible: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('applies correct max width constraint', (
      WidgetTester tester,
    ) async {
      const maxWidth = 500.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenDialog(
              title: 'Test',
              content: Text('Test Content'),
              maxWidth: maxWidth,
            ),
          ),
        ),
      );

      final constrainedBoxFinder = find.descendant(
        of: find.byType(GardenDialog),
        matching: find.byType(ConstrainedBox),
      );

      final constrainedBoxes = tester
          .widgetList<ConstrainedBox>(constrainedBoxFinder)
          .toList();

      final constrained = constrainedBoxes.firstWhere(
        (box) => box.constraints.maxWidth != double.infinity,
      );

      expect(constrained.constraints.maxWidth, equals(maxWidth));
    });

    testWidgets('uses correct background, radius, and shadow', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GardenDialog(title: 'Styled', content: Text('Style Test')),
          ),
        ),
      );

      final containerFinder = find
          .descendant(
            of: find.byType(GardenDialog),
            matching: find.byType(Container),
          )
          .first;

      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, equals(GardenColors.base.shade50));
      expect(decoration.boxShadow, equals(GardenShadow.shadowMd));
      expect(decoration.borderRadius, isNotNull);
    });

    testWidgets('show() displays dialog and can be dismissed', (
      WidgetTester tester,
    ) async {
      const testTitle = 'Dialog Title';
      const testContent = Text('Dialog Content');

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    GardenDialog.show(
                      context,
                      title: testTitle,
                      content: testContent,
                    );
                  },
                  child: const Text('Open Dialog'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text('Dialog Content'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(find.text(testTitle), findsNothing);
    });
  });
}
