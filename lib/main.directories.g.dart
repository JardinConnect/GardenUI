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
import 'package:widgetbook_workspace/ui/foundation/color/color_usecase.dart'
    as _i2;
import 'package:widgetbook_workspace/ui/foundation/typography/typography_usecase.dart'
    as _i3;
import 'package:widgetbook_workspace/ui/widgets/atoms/TabItem/tab_item_usecase.dart'
    as _i4;
import 'package:widgetbook_workspace/ui/widgets/molecules/tab_menu_usecase.dart'
    as _i5;
import 'package:widgetbook_workspace/ui/widgets/atoms/MenuIcon/menu_icon_usecase.dart'
    as _i6;
import 'package:widgetbook_workspace/ui/foundation/shadow/shadow_usecase.dart'
    as _i7;
import 'package:widgetbook_workspace/ui/foundation/radius/radius_usecase.dart'
    as _i8;

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
            name: 'typography',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'GardenTypography',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i3.buildDesignSystemTextStylesUseCase,
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
                  builder: _i7.buildDesignSystemShadowUseCase,
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
                  builder: _i8.buildDesignSystemRadiusUseCase,
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
                name: 'TabItem',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'TabItem',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'States',
                      builder: _i4.buildTabItemUseCase,
                      designLink: 'https://www.figma.com/file/your-tab-design',
                    ),
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
                      builder: _i6.buildMenuIconUseCase,
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
              _i1.WidgetbookLeafComponent(
                name: 'TabMenu',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i5.buildTabMenuUseCase,
                  designLink: 'https://www.figma.com/file/your-tab-menu-design',
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
