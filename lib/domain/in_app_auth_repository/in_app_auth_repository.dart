import 'package:moodmaster/data/models/user/user.dart';
import 'package:moodmaster/data/source/in_app_auth_rds/in_app_auth_rds.dart';
import 'package:moodmaster/navigation/app_router.dart';

class InAppAuthRepository {
  InAppAuthRepository({
    required this.inAppAuthRDS,
    required this.router,
  });
  InAppAuthRds inAppAuthRDS;
  AppRouter router;

  Future<void> saveUser(User user) async {
    await inAppAuthRDS.saveUser(user);
  }

  Future<void> deleteUser() async {
    inAppAuthRDS.clearUser();
  }

  Future<void> getUser() async {
    inAppAuthRDS.getUser();
  }
}
