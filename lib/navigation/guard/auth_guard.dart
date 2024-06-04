import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:l/l.dart';
import 'package:moodmaster/data/source/in_app_auth_rds/in_app_auth_rds.dart';
import 'package:moodmaster/navigation/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard({
    required this.inAppAuthRDS,
  });

  InAppAuthRds inAppAuthRDS;
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final fireBaseCurrentUser = FirebaseAuth.instance.currentUser;

    final userAccount = inAppAuthRDS.getUser();

    l.i('fireBaseCurrentUser: $fireBaseCurrentUser');

    if (fireBaseCurrentUser == null) {
      await resolver.redirect(const MainAuthRoute());
    } else if (userAccount == null) {
      await resolver.redirect(const InAppAuthRoute());
    } else {
      resolver.next(true);
    }
  }
}
