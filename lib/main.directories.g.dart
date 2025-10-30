// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:garden_ui/ui/foundation/color/color_usecase.dart' as _i3;
import 'package:garden_ui/ui/foundation/padding/space_usecase.dart' as _i4;
import 'package:garden_ui/ui/foundation/radius/radius_usecase.dart' as _i5;
import 'package:garden_ui/ui/foundation/shadow/shadow_usecase.dart' as _i6;
import 'package:garden_ui/ui/foundation/typography/typography_usecase.dart'
    as _i7;
import 'package:garden_ui/ui/widgets/atoms/AlertIndicator/alert_indicator.dart'
    as _i8;
import 'package:garden_ui/ui/widgets/atoms/LevelIndicator/level_indicator.dart'
    as _i9;
import 'package:garden_ui/ui/widgets/atoms/MenuIcon/menu_icon_usecase.dart'
    as _i10;
import 'package:garden_ui/ui/widgets/atoms/TabItem/tab_item_usecase.dart'
    as _i11;
import 'package:garden_ui/ui/widgets/molecules/HierarchicalMenuItem/hierarchical_menu_item.dart'
    as _i12;
import 'package:garden_ui/ui/widgets/molecules/MenuItem/menu_item_usecase.dart'
    as _i13;
import 'package:garden_ui/ui/widgets/molecules/TabMenu/tab_menu_usecase.dart'
    as _i14;
import 'package:garden_ui/ui/widgets/organisms/HierarchicalMenu/hierarchical_menu.dart'
    as _i16;
import 'package:garden_ui/ui/widgets/organisms/HierarchicalMenu/hierarchical_menu_examples.dart'
    as _i15;
import 'package:garden_ui/ui/widgets/organisms/Menu/menu_usecase.dart' as _i17;
import 'package:garden_ui/ui/widgets/atoms/Button/button.dart' as _i18;

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
                  builder: _i3.buildDesignSystemColorUseCase,
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
                  builder: _i4.buildDesignSystemSpaceUseCase,
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
                  builder: _i5.buildDesignSystemRadiusUseCase,
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
                  builder: _i6.buildDesignSystemShadowUseCase,
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
                  builder: _i7.buildDesignSystemTextStylesUseCase,
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
                        builder: _i8.alertIndicatorDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Error',
                        builder: _i8.alertIndicatorErrorUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Small',
                        builder: _i8.alertIndicatorSmallUseCase,
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
                        builder: _i9.levelIndicatorLevel1UseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Level 3',
                        builder: _i9.levelIndicatorLevel3UseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Level 5',
                        builder: _i9.levelIndicatorLevel5UseCase,
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
                      builder: _i10.buildMenuIconUseCase,
                      designLink: 'https://www.figma.com/file/your-menu-design',
                    ),
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
                      builder: _i11.buildTabItemUseCase,
                      designLink: 'https://www.figma.com/file/your-tab-design',
                    ),
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
                        name: 'Default',
                        builder: _i18.primaryButtonUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Danger',
                        builder: _i18.dangerButtonUseCase,
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
                name: 'HierarchicalMenuItem',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'HierarchicalMenuItemWidget',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Default',
                        builder: _i12.hierarchicalMenuItemDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'With Children Expanded',
                        builder: _i12.hierarchicalMenuItemExpandedUseCase,
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
                      builder: _i13.buildMenuItemUseCase,
                      designLink:
                          'https://www.figma.com/file/your-menu-item-design',
                    ),
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
                      builder: _i14.buildTabMenuUseCase,
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
                        name: 'Complete Example',
                        builder: _i15.hierarchicalMenuCompleteExampleUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Default',
                        builder: _i16.hierarchicalMenuDefaultUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Large Size',
                        builder: _i16.hierarchicalMenuLargeUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Small Size with Deep Nesting',
                        builder: _i15.hierarchicalMenuDeepNestingUseCase,
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
                      builder: _i17.buildMenuUseCase,
                      designLink: 'https://www.figma.com/file/your-menu-design',
                    ),
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
