import 'package:elementary/elementary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moodmaster/domain/auth_repository/auth_repository.dart';
import 'package:moodmaster/domain/in_app_auth_repository/in_app_auth_repository.dart';

abstract interface class IProfileScreenModel extends ElementaryModel {
  Future<void> signOut();
}

class ProfileScreenModel extends IProfileScreenModel {
  ProfileScreenModel({
    required this.authRepository,
    required this.inAppAuthRepository,
  });
  AuthRepository authRepository;
  InAppAuthRepository inAppAuthRepository;

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await inAppAuthRepository.deleteUser();
  }
}
