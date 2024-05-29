import 'package:elementary/elementary.dart';
import 'package:moodmaster/domain/in_app_auth_repository/in_app_auth_repository.dart';

import '../../../../data/models/user/user.dart';

abstract interface class IInAppAuthScreenModel extends ElementaryModel {
  Future<void> endLogin(User user);
}

class InAppAuthScreenModel extends IInAppAuthScreenModel {
  InAppAuthScreenModel({
    required this.inAppAuthRepository,
  });
  InAppAuthRepository inAppAuthRepository;
  @override
  Future<void> endLogin(User user) async {
    try {
      await inAppAuthRepository.saveUser(user);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
