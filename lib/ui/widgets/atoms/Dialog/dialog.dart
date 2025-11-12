import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

class GardenDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final double maxWidth;
  final bool dismissible;

  const GardenDialog({
    super.key,
    required this.title,
    required this.content,
    this.maxWidth = 700,
    this.dismissible = true,
  });

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
              borderRadius: BorderRadius.circular(GardenRadius.radiusSizes["lg"]!),
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
                        topLeft: Radius.circular(GardenRadius.radiusSizes["lg"]!),
                        topRight: Radius.circular(GardenRadius.radiusSizes["lg"]!),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: GardenTypography.headingMd.copyWith(
                            color: GardenColors.typography.shade50,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.close, color: GardenColors.typography.shade50),
                        ),
                      ],
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
                        bottomLeft: Radius.circular(GardenRadius.radiusSizes["lg"]!),
                        bottomRight: Radius.circular(GardenRadius.radiusSizes["lg"]!),
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
      builder: (_) => GardenDialog(
        title: title,
        content: content,
        maxWidth: maxWidth,
        dismissible: dismissible,
      ),
    );
  }
}
