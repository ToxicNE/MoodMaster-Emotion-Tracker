import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moodmaster/data/source/auth_rds/in_app_auth_rds.dart';
import 'package:moodmaster/navigation/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard({
    required this.inAppAuthRDS,
  });

  InAppAuthRds inAppAuthRDS;
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    if (FirebaseAuth.instance.currentUser == null) {
      resolver.redirect(const MainAuthRoute());
      return;
    } else if (inAppAuthRDS.getUser() == null) {
      router.push(const InAppAuthRoute());
    } else {
      resolver.next(true);
    }
    //TODO() Сделать проверки на то что у тебя есть инфа о юзера в локальном хранилище, если её нет отправлять пользователя на экран ввода инфы о себе
  }
}
