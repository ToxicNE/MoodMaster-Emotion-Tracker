import 'package:auto_route/auto_route.dart';
import 'package:moodmaster/navigation/guard/auth_guard.dart';
import 'package:moodmaster/ui/features/auth/auth/auth_screen_widget.dart';
import 'package:moodmaster/ui/features/auth/main_auth_screen/main_auth_screen_widget.dart';
import 'package:moodmaster/ui/features/auth/register/register_screen_widget.dart';
import 'package:moodmaster/ui/features/tabs/navigation.dart';

import '../ui/features/auth/in_app_auth/in_app_auth_screen_widget.dart';
import '../ui/features/mood/mood_screen_widget.dart';
import '../ui/features/mood_info/model_info_screen_widget.dart';
import '../ui/features/profile/profile_screen_widget.dart';

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
            children: <AutoRoute>[
              AutoRoute(page: MoodInfoRoute.page),
              AutoRoute(page: MoodRoute.page, initial: true),
              AutoRoute(page: ProfileRoute.page),
            ]),
        AutoRoute(
          page: MainAuthRoute.page,
        ),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: InAppAuthRoute.page),
      ];
}
