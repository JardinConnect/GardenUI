import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/ui/components.dart';

void main() {
  group('Notification Widget Tests', () {
    testWidgets('renders title and message correctly', (
      WidgetTester tester,
    ) async {
      const title = 'Test Title';
      const message = 'Test message content';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NotificationToast(title: title, message: message),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
    });

    testWidgets('passes correct size and severity to NotificationIcon', (
      WidgetTester tester,
    ) async {
      final testCases = [
        {
          'size': NotificationSize.sm,
          'severity': NotificationSeverity.alert,
          'expectedIconSize': NotificationSize.sm,
          'expectedIconSeverity': NotificationIconSeverity.alert,
        },
        {
          'size': NotificationSize.md,
          'severity': NotificationSeverity.success,
          'expectedIconSize': NotificationSize.md,
          'expectedIconSeverity': NotificationIconSeverity.success,
        },
        {
          'size': NotificationSize.lg,
          'severity': NotificationSeverity.warning,
          'expectedIconSize': NotificationSize.lg,
          'expectedIconSeverity': NotificationIconSeverity.warning,
        },
      ];

      for (final testCase in testCases) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NotificationToast(
                title: 'Title',
                message: 'Message',
                size: testCase['size'] as NotificationSize,
                severity: testCase['severity'] as NotificationSeverity,
              ),
            ),
          ),
        );

        final iconFinder = find.byType(NotificationIcon);
        expect(iconFinder, findsOneWidget);

        final iconWidget = tester.widget<NotificationIcon>(iconFinder);
        expect(iconWidget.size, testCase['expectedIconSize']);
        expect(iconWidget.severity, testCase['expectedIconSeverity']);
      }
    });

    testWidgets('close button hides notification', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NotificationToast(title: 'Title', message: 'Message'),
          ),
        ),
      );

      expect(find.byType(NotificationToast), findsOneWidget);

      final closeButton = find.byIcon(Icons.close);
      expect(closeButton, findsOneWidget);

      await tester.tap(closeButton);
      await tester.pumpAndSettle();

      final animatedOpacity = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity),
      );
      expect(animatedOpacity.opacity, 0);
    });
  });
}
