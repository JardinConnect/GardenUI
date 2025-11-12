import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

/// A customizable dialog widget with a header and content area.
///
/// This widget displays a dialog with a title in the header and a content area below it.
/// The dialog can be dismissed by clicking the close button in the header or by tapping outside
/// the dialog if `dismissible` is set to true.
class GardenDialog extends StatelessWidget {
  /// The title of the dialog displayed in the header
  final String title;

  /// The content widget displayed in the body of the dialog
  final Widget content;

  /// The maximum width of the dialog
  final double maxWidth;

  /// Whether the dialog can be dismissed by tapping the close button
  final bool dismissible;

  const GardenDialog({
    super.key,
    required this.title,
    required this.content,
    this.maxWidth = 700,
    this.dismissible = true,
  });

  List<Widget> _getHeader(BuildContext context) {
    List<Widget> widgets = [
      Text(
        title,
        style: GardenTypography.headingMd.copyWith(
          color: GardenColors.typography.shade50,
        ),
      ),
    ];

    if (dismissible) {
      widgets.add(
        Builder(
          builder: (dialogContext) => IconButton(
            onPressed: () => close(dialogContext),
            icon: Icon(Icons.close, color: GardenColors.typography.shade50),
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(GardenSpace.paddingMd),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Container(
            decoration: BoxDecoration(
              color: GardenColors.base.shade50,
              borderRadius: BorderRadius.circular(
                GardenRadius.radiusSizes["lg"]!,
              ),
              boxShadow: GardenShadow.shadowMd,
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: GardenRadius.radiusLg,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: GardenSpace.paddingSm,
                      horizontal: GardenSpace.paddingMd,
                    ),
                    decoration: BoxDecoration(
                      color: GardenColors.primary.shade700,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          GardenRadius.radiusSizes["lg"]!,
                        ),
                        topRight: Radius.circular(
                          GardenRadius.radiusSizes["lg"]!,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _getHeader(context),
                    ),
                  ),

                  // Content
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: GardenSpace.paddingSm,
                      horizontal: GardenSpace.paddingMd,
                    ),
                    decoration: BoxDecoration(
                      color: GardenColors.base.shade50,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          GardenRadius.radiusSizes["lg"]!,
                        ),
                        bottomRight: Radius.circular(
                          GardenRadius.radiusSizes["lg"]!,
                        ),
                      ),
                    ),
                    child: content,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Future<void> show(
    BuildContext context, {
    required String title,
    required Widget content,
    double maxWidth = 700,
    bool dismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (dialogContext) => GardenDialog(
        title: title,
        content: content,
        maxWidth: maxWidth,
        dismissible: dismissible,
      ),
    );
  }

  static void close(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
