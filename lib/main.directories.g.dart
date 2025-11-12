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
import 'package:garden_ui/ui/widgets/atoms/Button/button_usecase.dart' as _i8;
import 'package:garden_ui/ui/widgets/atoms/Card/card_usecase.dart' as _i9;
import 'package:garden_ui/ui/widgets/atoms/GardenIcon/garden_icon_usecase.dart'
    as _i10;
import 'package:garden_ui/ui/widgets/atoms/GardenToggle/garden_toggle_usecase.dart'
    as _i11;
import 'package:garden_ui/ui/widgets/atoms/LevelIndicator/level_indicator_usecase.dart'
    as _i12;
import 'package:garden_ui/ui/widgets/atoms/MenuIcon/menu_icon_usecase.dart'
    as _i13;
import 'package:garden_ui/ui/widgets/atoms/NotificationIcon/notification_icon_usecase.dart'
    as _i14;
import 'package:garden_ui/ui/widgets/atoms/PaginationDots/pagination_dots_usecase.dart'
    as _i15;
import 'package:garden_ui/ui/widgets/atoms/TabItem/tab_item_usecase.dart'
    as _i16;
import 'package:garden_ui/ui/widgets/molecules/HierarchicalMenuItem/hierarchical_menu_item_usecase.dart'
    as _i17;
import 'package:garden_ui/ui/widgets/molecules/MenuItem/menu_item_usecase.dart'
    as _i18;
import 'package:garden_ui/ui/widgets/molecules/Notification/notification_toast_usecase.dart'
    as _i19;
import 'package:garden_ui/ui/widgets/molecules/TabMenu/tab_menu_usecase.dart'
    as _i20;
import 'package:garden_ui/ui/widgets/organisms/HierarchicalMenu/hierarchical_menu_usecase.dart'
    as _i21;
import 'package:garden_ui/ui/widgets/organisms/Menu/menu_usecase.dart' as _i22;
import 'package:garden_ui/ui/widgets/organisms/SensorAlertCard/sensor_alert_card_usecase.dart'
    as _i23;
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
                name: 'Button',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'Button',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Danger',
                        builder: _i8.dangerButtonUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Primary',
                        builder: _i8.primaryButtonUseCase,
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
                      builder: _i9.buildCardUseCase,
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
                        builder: _i10.gardenIconAllIconsUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'All Sizes',
                        builder: _i10.gardenIconSizesUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Color Variants',
                        builder: _i10.gardenIconColorsUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Default',
                        builder: _i10.gardenIconDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Fill Percentage (Interactive)',
                        builder: _i10.gardenIconFillUseCase,
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
                        builder: _i11.gardenToggleDisabledUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Enabled',
                        builder: _i11.gardenToggleEnabledUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Interactive',
                        builder: _i11.gardenToggleInteractiveUseCase,
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
                        builder: _i12.levelIndicatorLevel1UseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Level 3',
                        builder: _i12.levelIndicatorLevel3UseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Level 5',
                        builder: _i12.levelIndicatorLevel5UseCase,
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
                      builder: _i13.buildMenuIconUseCase,
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
                        builder: _i14.alertNotificationIconUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Info',
                        builder: _i14.infoNotificationIconUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Success',
                        builder: _i14.successNotificationIconUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Warning',
                        builder: _i14.warningNotificationIconUseCase,
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
                        builder: _i15.paginationDotsDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'First dot active',
                        builder: _i15.paginationDotsFirstUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Interactive',
                        builder: _i15.paginationDotsInteractiveUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Last dot active',
                        builder: _i15.paginationDotsLastUseCase,
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
                      builder: _i16.buildTabItemUseCase,
                      designLink: 'https://www.figma.com/file/your-tab-design',
                    ),
                  ),
                ],
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'molecules',
            children: [
              _i1.WidgetbookFolder(
                name: 'HierarchicalMenuItem',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'HierarchicalMenuItemWidget',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Default',
                        builder: _i17.hierarchicalMenuItemDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'With Children Expanded',
                        builder: _i17.hierarchicalMenuItemExpandedUseCase,
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
                      builder: _i18.buildMenuItemUseCase,
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
                        builder: _i19.alertNotificationUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Info',
                        builder: _i19.infoNotificationUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Success',
                        builder: _i19.successNotificationUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Warning',
                        builder: _i19.warningNotificationUseCase,
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
                      builder: _i20.buildTabMenuUseCase,
                      designLink:
                          'https://www.figma.com/file/your-tab-menu-design',
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
                        builder: _i21.hierarchicalMenuDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'With Selected Item',
                        builder: _i21.hierarchicalMenuWithSelectionUseCase,
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
                      builder: _i22.buildMenuUseCase,
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
                        name: 'Disabled toggle',
                        builder: _i23.sensorAlertCardDisabledUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Humidity with errors (2 thresholds)',
                        builder: _i23.sensorAlertCardHumidityUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Interactive',
                        builder: _i23.sensorAlertCardInteractiveUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Light with 3 thresholds',
                        builder:
                            _i23.sensorAlertCardLightThreeThresholdsUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'No alerts',
                        builder: _i23.sensorAlertCardNoAlertsUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Temperature with 4 thresholds',
                        builder: _i23
                            .sensorAlertCardTemperatureFourThresholdsUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Temperature with warnings (2 thresholds)',
                        builder: _i23.sensorAlertCardTemperatureUseCase,
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
