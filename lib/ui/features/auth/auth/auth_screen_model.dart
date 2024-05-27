import 'package:elementary/elementary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moodmaster/domain/auth_repository/auth_repository.dart';

abstract interface class IAuthScreenModel extends ElementaryModel {
  Future<void> login(String email, String password);
}

class AuthScreenModel extends IAuthScreenModel {
  AuthScreenModel({
    required this.authRepository,
  });
  AuthRepository authRepository;

  @override
  Future<void> login(String email, String password) {
    try {
      return authRepository.login(email, password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }
}
