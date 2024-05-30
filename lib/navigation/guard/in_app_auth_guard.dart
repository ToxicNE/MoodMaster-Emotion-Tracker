import 'package:auto_route/auto_route.dart';
import 'package:moodmaster/data/source/auth_rds/in_app_auth_rds.dart';

import 'package:moodmaster/navigation/app_router.dart';

class InAppAuthGuard extends AutoRouteGuard {
  InAppAuthGuard({
    required this.inAppAuthRDS,
  });
  InAppAuthRds inAppAuthRDS;
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    if (inAppAuthRDS.getUser() == null) {
      router.push(const InAppAuthRoute());
    } else {
      router.push(const InAppAuthRoute());
      // resolver.next(true);
    }
  }
}
