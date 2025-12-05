import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'pagination_dots.dart';

@widgetbook.UseCase(name: 'Default (5 dots)', type: PaginationDots)
Widget paginationDotsDefaultUseCase(BuildContext context) {
  return PaginationDots(totalDots: 5, activeIndex: 2, onDotTapped: (index) {});
}

@widgetbook.UseCase(name: 'First dot active', type: PaginationDots)
Widget paginationDotsFirstUseCase(BuildContext context) {
  return PaginationDots(totalDots: 5, activeIndex: 0, onDotTapped: (index) {});
}

@widgetbook.UseCase(name: 'Last dot active', type: PaginationDots)
Widget paginationDotsLastUseCase(BuildContext context) {
  return PaginationDots(totalDots: 5, activeIndex: 4, onDotTapped: (index) {});
}

@widgetbook.UseCase(name: 'Interactive', type: PaginationDots)
Widget paginationDotsInteractiveUseCase(BuildContext context) {
  return const _InteractivePaginationDots();
}

class _InteractivePaginationDots extends StatefulWidget {
  const _InteractivePaginationDots();

  @override
  State<_InteractivePaginationDots> createState() =>
      _InteractivePaginationDotsState();
}

class _InteractivePaginationDotsState
    extends State<_InteractivePaginationDots> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PaginationDots(
      totalDots: 5,
      activeIndex: activeIndex,
      onDotTapped: (index) {
        setState(() {
          activeIndex = index;
        });
      },
    );
  }
}
