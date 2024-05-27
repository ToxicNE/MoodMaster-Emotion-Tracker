import 'package:auto_route/auto_route.dart';
import 'package:moodmaster/navigation/guard/auth_guard.dart';
import 'package:moodmaster/ui/features/auth/main_auth_screen/main_auth_screen_widget.dart';
import 'package:moodmaster/ui/features/tabs/navigation.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends _$AppRouter {
  AppRouter({
    required this.authGuard,
  });
  AuthGuard authGuard;

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          path: '/',
          initial: true,
          page: AppBottomTabsRoute.page,
          guards: <AutoRouteGuard>[
            authGuard,
          ],
        ),
      ];
}
