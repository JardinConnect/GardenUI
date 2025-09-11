import 'package:flutter/material.dart';
import 'package:widgetbook_workspace/ui/widgets/atoms/TabItem/tab_item.dart';

/// A horizontal menu of tabs with optional scrolling support.
///
/// This component arranges multiple [TabItem]s in a row and handles
/// the selection state.
class TabMenu extends StatefulWidget {
  /// List of tab labels to display.
  final List<String> tabs;

  /// The currently selected tab index.
  final int selectedIndex;

  /// Callback when a tab is selected.
  final ValueChanged<int> onTabSelected;

  /// Optional list of icons to display with each tab.
  final List<IconData>? icons;

  /// Whether to enable horizontal scrolling when tabs don't fit.
  final bool scrollable;

  /// Whether tab indicators should match the content width.
  final bool matchIndicatorToContent;

  /// Spacing between tabs.
  final double tabSpacing;

  const TabMenu({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    this.icons,
    this.scrollable = false,
    this.matchIndicatorToContent = true, // Changed from false to true
    this.tabSpacing = 16.0,
  }) : assert(
         icons == null || icons.length == tabs.length,
         'If icons are provided, their count must match tabs count',
       );

  @override
  State<TabMenu> createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabItems = List.generate(widget.tabs.length, (index) {
      return TabItem(
        label: widget.tabs[index],
        icon: widget.icons != null ? widget.icons![index] : null,
        isSelected: index == widget.selectedIndex,
        onTap: () => widget.onTabSelected(index),
      );
    });

    // Wrap with Semantics for better screen reader support
    return Semantics(
      container: true,
      label: 'Tab navigation',
      child: widget.scrollable
          ? _buildScrollableTabs(tabItems)
          : _buildFixedTabs(tabItems),
    );
  }

  Widget _buildScrollableTabs(List<Widget> tabItems) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: tabItems,
      ),
    );
  }

  Widget _buildFixedTabs(List<Widget> tabItems) {
    return Row(children: tabItems);
  }
}
