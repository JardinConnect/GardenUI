import 'package:flutter/material.dart';
import 'package:garden_ui/ui/design_system.dart';

class GardenDialog extends StatelessWidget {
  final String title;

  const GardenDialog({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: GardenRadius.radiusLg
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: GardenSpace.paddingSm, horizontal: GardenSpace.paddingMd),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(GardenRadius.radiusSizes["lg"]!),
                  topRight: Radius.circular(GardenRadius.radiusSizes["lg"]!)
              ),
              color: GardenColors.primary.shade700
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close))
              ],
            ),
          )
        ],
      ),
    );
  }


}