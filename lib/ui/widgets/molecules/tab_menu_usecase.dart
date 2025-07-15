import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook_workspace/ui/widgets/molecules/tab_menu.dart';

@UseCase(
  name: 'Default',
  type: TabMenu,
  designLink: 'https://www.figma.com/file/your-tab-menu-design',
)
Widget buildTabMenuUseCase(BuildContext context) {
  return const _TabMenuShowcase();
}

class _TabMenuShowcase extends StatelessWidget {
  const _TabMenuShowcase();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Tab Menu',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const _TabMenuPreview(),

            const SizedBox(height: 40),
            Text(
              'Tab Menu with Icons',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const _TabMenuWithIconsPreview(),

            const SizedBox(height: 40),
            Text(
              'Scrollable Tab Menu',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const _ScrollableTabMenuPreview(),

            const SizedBox(height: 40),
            Text(
              'Tab Menu with Adaptive Indicators',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const _AdaptiveIndicatorTabMenuPreview(),
          ],
        ),
      ),
    );
  }
}

class _TabMenuPreview extends StatefulWidget {
  const _TabMenuPreview();

  @override
  State<_TabMenuPreview> createState() => _TabMenuPreviewState();
}

class _TabMenuPreviewState extends State<_TabMenuPreview> {
  int selectedIndex = 0;
  final tabs = ['Overview', 'Details', 'Reviews'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TabMenu(
        tabs: tabs,
        selectedIndex: selectedIndex,
        onTabSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

class _TabMenuWithIconsPreview extends StatefulWidget {
  const _TabMenuWithIconsPreview();

  @override
  State<_TabMenuWithIconsPreview> createState() =>
      _TabMenuWithIconsPreviewState();
}

class _TabMenuWithIconsPreviewState extends State<_TabMenuWithIconsPreview> {
  int selectedIndex = 0;
  final tabs = ['Home', 'Search', 'Profile'];
  final icons = [Icons.home, Icons.search, Icons.person];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TabMenu(
        tabs: tabs,
        icons: icons,
        selectedIndex: selectedIndex,
        onTabSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

class _ScrollableTabMenuPreview extends StatefulWidget {
  const _ScrollableTabMenuPreview();

  @override
  State<_ScrollableTabMenuPreview> createState() =>
      _ScrollableTabMenuPreviewState();
}

class _ScrollableTabMenuPreviewState extends State<_ScrollableTabMenuPreview> {
  int selectedIndex = 0;
  final tabs = ['Tab 1', 'Tab 2', 'Tab 3'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TabMenu(
        tabs: tabs,
        selectedIndex: selectedIndex,
        onTabSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

class _AdaptiveIndicatorTabMenuPreview extends StatefulWidget {
  const _AdaptiveIndicatorTabMenuPreview();

  @override
  State<_AdaptiveIndicatorTabMenuPreview> createState() =>
      _AdaptiveIndicatorTabMenuPreviewState();
}

class _AdaptiveIndicatorTabMenuPreviewState
    extends State<_AdaptiveIndicatorTabMenuPreview> {
  int selectedIndex = 0;
  final tabs = ['Tab A', 'Tab B', 'Tab C'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TabMenu(
        tabs: tabs,
        selectedIndex: selectedIndex,
        onTabSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
