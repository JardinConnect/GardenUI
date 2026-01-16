// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:garden_ui/ui/foundation/color/color_usecase.dart' as _i2;
import 'package:garden_ui/ui/foundation/padding/space_usecase.dart' as _i3;
import 'package:garden_ui/ui/foundation/radius/radius_usecase.dart' as _i4;
import 'package:garden_ui/ui/foundation/shadow/shadow_usecase.dart' as _i5;
import 'package:garden_ui/ui/foundation/typography/typography_usecase.dart'
    as _i6;
import 'package:garden_ui/ui/widgets/atoms/AlertIndicator/alert_indicator_usecase.dart'
    as _i7;
import 'package:garden_ui/ui/widgets/atoms/BatteryIndicator/battery_indicator_usecase.dart'
    as _i8;
import 'package:garden_ui/ui/widgets/atoms/Button/button_usecase.dart' as _i9;
import 'package:garden_ui/ui/widgets/atoms/Card/card_usecase.dart' as _i10;
import 'package:garden_ui/ui/widgets/atoms/Dialog/dialog_usecase.dart' as _i11;
import 'package:garden_ui/ui/widgets/atoms/GardenIcon/garden_icon_usecase.dart'
    as _i12;
import 'package:garden_ui/ui/widgets/atoms/GardenToggle/garden_toggle_usecase.dart'
    as _i13;
import 'package:garden_ui/ui/widgets/atoms/LevelIndicator/level_indicator_usecase.dart'
    as _i14;
import 'package:garden_ui/ui/widgets/atoms/MenuIcon/menu_icon_usecase.dart'
    as _i15;
import 'package:garden_ui/ui/widgets/atoms/NotificationIcon/notification_icon_usecase.dart'
    as _i16;
import 'package:garden_ui/ui/widgets/atoms/PaginationDots/pagination_dots_usecase.dart'
    as _i17;
import 'package:garden_ui/ui/widgets/atoms/TabItem/tab_item_usecase.dart'
    as _i18;
import 'package:garden_ui/ui/widgets/atoms/TooltipIconButton/tooltip_icon_button_usecase.dart'
    as _i19;
import 'package:garden_ui/ui/widgets/molecules/AnalyticsSummaryCard/analytics_summary_card_usecase.dart'
    as _i20;
import 'package:garden_ui/ui/widgets/molecules/HierarchicalMenuItem/hierarchical_menu_item_usecase.dart'
    as _i21;
import 'package:garden_ui/ui/widgets/molecules/MenuItem/menu_item_usecase.dart'
    as _i22;
import 'package:garden_ui/ui/widgets/molecules/Notification/notification_toast_usecase.dart'
    as _i23;
import 'package:garden_ui/ui/widgets/molecules/TabMenu/tab_menu_usecase.dart'
    as _i24;
import 'package:garden_ui/ui/widgets/molecules/Tooltip/tooltip_usecase.dart'
    as _i25;
import 'package:garden_ui/ui/widgets/organisms/HierarchicalMenu/hierarchical_menu_usecase.dart'
    as _i26;
import 'package:garden_ui/ui/widgets/organisms/Menu/menu_usecase.dart' as _i27;
import 'package:garden_ui/ui/widgets/organisms/SensorAlertCard/sensor_alert_card_usecase.dart'
    as _i28;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'ui',
    children: [
      _i1.WidgetbookFolder(
        name: 'foundation',
        children: [
          _i1.WidgetbookFolder(
            name: 'color',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'GardenColors',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i2.buildDesignSystemColorUseCase,
                  designLink: 'https://www.figma.com/',
                ),
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'padding',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'GardenSpace',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i3.buildDesignSystemSpaceUseCase,
                  designLink: 'https://www.figma.com/',
                ),
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'radius',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'GardenRadius',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i4.buildDesignSystemRadiusUseCase,
                  designLink: 'https://www.figma.com/',
                ),
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'shadow',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'GardenShadow',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i5.buildDesignSystemShadowUseCase,
                  designLink: 'https://www.figma.com/',
                ),
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'typography',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'GardenTypography',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i6.buildDesignSystemTextStylesUseCase,
                  designLink: 'https://www.figma.com/',
                ),
              ),
            ],
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'widgets',
        children: [
          _i1.WidgetbookFolder(
            name: 'atoms',
            children: [
              _i1.WidgetbookFolder(
                name: 'AlertIndicator',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'AlertIndicator',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Default',
                        builder: _i7.alertIndicatorDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Error',
                        builder: _i7.alertIndicatorErrorUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Small',
                        builder: _i7.alertIndicatorSmallUseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'BatteryIndicator',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'BatteryIndicator',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Battery Indicator at 35% (Small size)',
                        builder: _i8.batteryIndicatorSmallUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Battery Indicator at 50% (Large size)',
                        builder: _i8.batteryIndicatorLargeUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Battery Indicator at 75% (Medium size)',
                        builder: _i8.batteryIndicatorDefaultUseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'Button',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'Button',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Danger',
                        builder: _i9.dangerButtonUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Primary',
                        builder: _i9.primaryButtonUseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'Card',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'GardenCard',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Variants',
                      builder: _i10.buildCardUseCase,
                    ),
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'Dialog',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'GardenDialog',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default',
                      builder: _i11.dialogDefaultUseCase,
                    ),
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'GardenIcon',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'GardenIcon',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'All Icons',
                        builder: _i12.gardenIconAllIconsUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'All Sizes',
                        builder: _i12.gardenIconSizesUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Color Variants',
                        builder: _i12.gardenIconColorsUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Default',
                        builder: _i12.gardenIconDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Fill Percentage (Interactive)',
                        builder: _i12.gardenIconFillUseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'GardenToggle',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'GardenToggle',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Disabled',
                        builder: _i13.gardenToggleDisabledUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Enabled',
                        builder: _i13.gardenToggleEnabledUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Interactive',
                        builder: _i13.gardenToggleInteractiveUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Interactive with icons',
                        builder: _i13.gardenToggleInteractiveWithIconsUseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'LevelIndicator',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'LevelIndicator',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Level 1',
                        builder: _i14.levelIndicatorLevel1UseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Level 3',
                        builder: _i14.levelIndicatorLevel3UseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Level 5',
                        builder: _i14.levelIndicatorLevel5UseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'MenuIcon',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'MenuIcon',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'States',
                      builder: _i15.buildMenuIconUseCase,
                      designLink: 'https://www.figma.com/file/your-menu-design',
                    ),
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'NotificationIcon',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'NotificationIcon',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Alert',
                        builder: _i16.alertNotificationIconUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Info',
                        builder: _i16.infoNotificationIconUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Success',
                        builder: _i16.successNotificationIconUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Warning',
                        builder: _i16.warningNotificationIconUseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'PaginationDots',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'PaginationDots',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Default (5 dots)',
                        builder: _i17.paginationDotsDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'First dot active',
                        builder: _i17.paginationDotsFirstUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Interactive',
                        builder: _i17.paginationDotsInteractiveUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Last dot active',
                        builder: _i17.paginationDotsLastUseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'TabItem',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'TabItem',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'States',
                      builder: _i18.buildTabItemUseCase,
                      designLink: 'https://www.figma.com/file/your-tab-design',
                    ),
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'TooltipIconButton',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'TooltipIconButton',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Default',
                        builder: _i19.tooltipIconButtonDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Large',
                        builder: _i19.tooltipIconButtonLargeUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Small',
                        builder: _i19.tooltipIconButtonSmallUseCase,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'molecules',
            children: [
              _i1.WidgetbookFolder(
                name: 'AnalyticsSummaryCard',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'AnalyticsSummaryCard',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Default',
                        builder: _i20.analyticsSummaryCardUseCase,
                        designLink:
                            'https://www.figma.com/design/F4eYqIvQgbgcuG9Ev4kVuC/MockUp?node-id=777-5617&t=QeqXtK992GxqKHXp-4',
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'With battery',
                        builder: _i20.analyticsSummaryCardWithBatteryUseCase,
                        designLink:
                            'https://www.figma.com/design/F4eYqIvQgbgcuG9Ev4kVuC/MockUp?node-id=777-5617&t=QeqXtK992GxqKHXp-4',
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'With filter',
                        builder: _i20.analyticsSummaryCardWithFilterUseCase,
                        designLink:
                            'https://www.figma.com/design/F4eYqIvQgbgcuG9Ev4kVuC/MockUp?node-id=777-5617&t=QeqXtK992GxqKHXp-4',
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'HierarchicalMenuItem',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'HierarchicalMenuItemWidget',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Default',
                        builder: _i21.hierarchicalMenuItemDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Interactive with content display',
                        builder: _i21.hierarchicalMenuItemInteractiveUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'With Children Expanded',
                        builder: _i21.hierarchicalMenuItemExpandedUseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'MenuItem',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'MenuItem',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default',
                      builder: _i22.buildMenuItemUseCase,
                      designLink:
                          'https://www.figma.com/file/your-menu-item-design',
                    ),
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'Notification',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'NotificationToast',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Alert',
                        builder: _i23.alertNotificationUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Info',
                        builder: _i23.infoNotificationUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Success',
                        builder: _i23.successNotificationUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Warning',
                        builder: _i23.warningNotificationUseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'TabMenu',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'TabMenu',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default',
                      builder: _i24.buildTabMenuUseCase,
                      designLink:
                          'https://www.figma.com/file/your-tab-menu-design',
                    ),
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'Tooltip',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'GardenTooltip',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default',
                      builder: _i25.tooltipDefaultUseCase,
                    ),
                  ),
                ],
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'organisms',
            children: [
              _i1.WidgetbookFolder(
                name: 'HierarchicalMenu',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'HierarchicalMenu',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Default',
                        builder: _i26.hierarchicalMenuDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'With Selected Item',
                        builder: _i26.hierarchicalMenuWithSelectionUseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'Menu',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'Menu',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default',
                      builder: _i27.buildMenuUseCase,
                      designLink: 'https://www.figma.com/file/your-menu-design',
                    ),
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'SensorAlertCard',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'SensorAlertCard',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Custom icon color',
                        builder: _i28.sensorAlertCardCustomIconColorUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Disabled toggle',
                        builder: _i28.sensorAlertCardDisabledUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Humidity with errors (2 thresholds)',
                        builder: _i28.sensorAlertCardHumidityUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Interactive',
                        builder: _i28.sensorAlertCardInteractiveUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Light with 3 thresholds',
                        builder:
                            _i28.sensorAlertCardLightThreeThresholdsUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'No alerts',
                        builder: _i28.sensorAlertCardNoAlertsUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Temperature with 4 thresholds',
                        builder: _i28
                            .sensorAlertCardTemperatureFourThresholdsUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Temperature with warnings (2 thresholds)',
                        builder: _i28.sensorAlertCardTemperatureUseCase,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
