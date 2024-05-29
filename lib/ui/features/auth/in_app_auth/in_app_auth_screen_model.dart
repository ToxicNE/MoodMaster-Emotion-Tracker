import 'package:elementary/elementary.dart';
import 'package:moodmaster/domain/auth_repository/auth_repository.dart';

abstract interface class IInAppAuthScreenModel extends ElementaryModel {
  Future<void> endLogin(String name, String surname, String avatarUrl);
}

class InAppAuthScreenModel extends IInAppAuthScreenModel {
  @override
  Future<void> endLogin(String name, String surname, String avatarUrl) async {
    throw UnimplementedError();
  }
}
