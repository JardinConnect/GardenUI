import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden_ui/ui/components.dart';

void main() {
  group('PaginationDots Widget Tests', () {
    testWidgets('renders correct number of dots', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginationDots(
              totalDots: 5,
              activeIndex: 2,
              onDotTapped: (index) {},
            ),
          ),
        ),
      );

      expect(find.byType(PaginationDots), findsOneWidget);
      expect(find.byType(GestureDetector), findsNWidgets(5));
    });

    testWidgets('renders with first dot active', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginationDots(
              totalDots: 5,
              activeIndex: 0,
              onDotTapped: (index) {},
            ),
          ),
        ),
      );

      expect(find.byType(PaginationDots), findsOneWidget);
    });

    testWidgets('renders with last dot active', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginationDots(
              totalDots: 5,
              activeIndex: 4,
              onDotTapped: (index) {},
            ),
          ),
        ),
      );

      expect(find.byType(PaginationDots), findsOneWidget);
    });

    testWidgets('calls onDotTapped with correct index', (
      WidgetTester tester,
    ) async {
      int? tappedIndex;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginationDots(
              totalDots: 5,
              activeIndex: 0,
              onDotTapped: (index) {
                tappedIndex = index;
              },
            ),
          ),
        ),
      );

      // Tap the third dot
      await tester.tap(find.byType(GestureDetector).at(2));
      await tester.pumpAndSettle();

      expect(tappedIndex, 2);
    });

    testWidgets('handles single dot', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginationDots(
              totalDots: 1,
              activeIndex: 0,
              onDotTapped: (index) {},
            ),
          ),
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('handles many dots', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginationDots(
              totalDots: 10,
              activeIndex: 5,
              onDotTapped: (index) {},
            ),
          ),
        ),
      );

      expect(find.byType(GestureDetector), findsNWidgets(10));
    });
  });
}
