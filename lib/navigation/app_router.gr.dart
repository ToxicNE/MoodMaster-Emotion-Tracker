// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppBottomTabsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppBottomTabsScreen(),
      );
    },
    MainAuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainAuthScreen(),
      );
    },
  };
}

/// generated route for
/// [AppBottomTabsScreen]
class AppBottomTabsRoute extends PageRouteInfo<void> {
  const AppBottomTabsRoute({List<PageRouteInfo>? children})
      : super(
          AppBottomTabsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBottomTabsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainAuthScreen]
class MainAuthRoute extends PageRouteInfo<void> {
  const MainAuthRoute({List<PageRouteInfo>? children})
      : super(
          MainAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainAuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
