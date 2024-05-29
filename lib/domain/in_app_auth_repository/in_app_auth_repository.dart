import 'package:moodmaster/data/models/user/user.dart';
import 'package:moodmaster/data/source/auth_rds/in_app_auth_rds.dart';

class InAppAuthRepository {
  InAppAuthRepository({
    required this.inAppAuthRDS,
  });
  InAppAuthRds inAppAuthRDS;

  Future<void> saveUser(User user) async {
    try {
      await inAppAuthRDS.saveUser(user);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
