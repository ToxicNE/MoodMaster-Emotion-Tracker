import 'package:auto_route/auto_route.dart';
import 'package:moodmaster/navigation/guard/auth_guard.dart';

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
  List<AutoRoute> get routes => <AutoRoute>[];
}
