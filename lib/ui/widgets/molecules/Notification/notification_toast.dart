import 'package:flutter/material.dart';
import 'package:widgetbook_workspace/ui/components.dart';
import 'package:widgetbook_workspace/ui/design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum NotificationSize { sm, md, lg }

enum NotificationSeverity { alert, info, success, warning }

class NotificationToast extends StatefulWidget {
  final String title;
  final String message;
  final NotificationSize size;
  final NotificationSeverity severity;

  const NotificationToast({
    super.key,
    required this.title,
    required this.message,
    this.size = NotificationSize.md,
    this.severity = NotificationSeverity.info,
  });

  @override
  State<NotificationToast> createState() => _NotificationToastState();
}

class _NotificationToastState extends State<NotificationToast> {
  bool _isVisible = true;

  void _onClose() {
    setState(() => _isVisible = false);
  }

  double get _width {
    switch (widget.size) {
      case NotificationSize.sm:
        return 244;
      case NotificationSize.lg:
        return 524;
      default:
        return 384;
    }
  }

  double get _textVerticalPadding {
    switch (widget.size) {
      case NotificationSize.sm:
        return GardenSpace.paddingXs;
      case NotificationSize.lg:
        return GardenSpace.paddingMd;
      default:
        return GardenSpace.paddingSm;
    }
  }

  NotificationIconSize get _iconSize {
    switch (widget.size) {
      case NotificationSize.sm:
        return NotificationIconSize.sm;
      case NotificationSize.lg:
        return NotificationIconSize.lg;
      default:
        return NotificationIconSize.md;
    }
  }

  NotificationIconSeverity get _iconSeverity {
    switch (widget.severity) {
      case NotificationSeverity.alert:
        return NotificationIconSeverity.alert;
      case NotificationSeverity.success:
        return NotificationIconSeverity.success;
      case NotificationSeverity.warning:
        return NotificationIconSeverity.warning;
      default:
        return NotificationIconSeverity.info;
    }
  }

  int get _maxLinesMessage {
    switch (widget.size) {
      case NotificationSize.sm:
        return 2;
      case NotificationSize.lg:
        return 5;
      default:
        return 3;
    }
  }

  TextStyle get _messageTextStyle {
    switch (widget.size) {
      case NotificationSize.sm:
        return GardenTypography.caption.copyWith(
          color: GardenColors.typography.shade400,
        );
      case NotificationSize.lg:
        return GardenTypography.bodyLg;
      default:
        return GardenTypography.bodyMd;
    }
  }

  TextStyle get _titleTextStyle {
    switch (widget.size) {
      case NotificationSize.sm:
        return GardenTypography.caption.copyWith(
          color: GardenColors.typography.shade400,
        );
      case NotificationSize.lg:
        return GardenTypography.headingSm;
      default:
        return GardenTypography.bodyLg;
    }
  }

  double get _rowGap {
    return widget.size == NotificationSize.sm ? 0 : GardenSpace.gapXs;
  }

  double get _closeIconSize {
    switch (widget.size) {
      case NotificationSize.sm:
        return 12;
      case NotificationSize.lg:
        return 20;
      default:
        return 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      width: _width,
      decoration: BoxDecoration(
        color: GardenColors.base.shade50,
        borderRadius: GardenRadius.radiusMd,
      ),
      child: IntrinsicHeight(
        child: Row(
          spacing: _rowGap,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NotificationIcon(size: _iconSize, severity: _iconSeverity),
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: _textVerticalPadding,
                  horizontal: GardenSpace.paddingSm,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: _titleTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: _closeIconSize,
                          width: _closeIconSize,
                          child: IconButton(
                            onPressed: _onClose,
                            icon: Icon(Icons.close, size: _closeIconSize),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.message,
                      style: _messageTextStyle,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      maxLines: _maxLinesMessage,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _isVisible ? 1 : 0,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: _isVisible ? content : null,
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Info', type: NotificationToast)
Widget infoNotificationUseCase(BuildContext context) {
  return Center(
    child: Column(
      spacing: GardenSpace.gapXl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NotificationToast(
          title: "Title",
          message:
              "Ceci est une longue notification. Ceci est une très longue notification",
          size: NotificationSize.sm,
          severity: NotificationSeverity.info,
        ),
        NotificationToast(
          title: "Title",
          message:
              "Ceci est une longue notification. Ceci est une très longue notification",
          size: NotificationSize.md,
          severity: NotificationSeverity.info,
        ),
        NotificationToast(
          title: "Title",
          message:
              "Ceci est une longue notification. Ceci est une très longue notification",
          size: NotificationSize.lg,
          severity: NotificationSeverity.info,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Alert', type: NotificationToast)
Widget alertNotificationUseCase(BuildContext context) {
  return Column(
    spacing: GardenSpace.gapXl,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.sm,
        severity: NotificationSeverity.alert,
      ),
      NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.md,
        severity: NotificationSeverity.alert,
      ),
      NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.lg,
        severity: NotificationSeverity.alert,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Success', type: NotificationToast)
Widget successNotificationUseCase(BuildContext context) {
  return Column(
    spacing: GardenSpace.gapXl,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.sm,
        severity: NotificationSeverity.success,
      ),
      NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.md,
        severity: NotificationSeverity.success,
      ),
      NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.lg,
        severity: NotificationSeverity.success,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'warning', type: NotificationToast)
Widget warningNotificationUseCase(BuildContext context) {
  return Column(
    spacing: GardenSpace.gapXl,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.sm,
        severity: NotificationSeverity.warning,
      ),
      NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.md,
        severity: NotificationSeverity.warning,
      ),
      NotificationToast(
        title: "Title",
        message:
            "Ceci est une longue notification. Ceci est une très longue notification",
        size: NotificationSize.lg,
        severity: NotificationSeverity.warning,
      ),
    ],
  );
}
