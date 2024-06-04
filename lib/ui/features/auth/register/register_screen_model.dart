import 'package:elementary/elementary.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:moodmaster/domain/auth_repository/auth_repository.dart';
import 'package:moodmaster/domain/in_app_auth_repository/in_app_auth_repository.dart';

abstract interface class IRegisterScreenModel extends ElementaryModel {
  Future<void> register(String email, String password);
}

class RegisterScreenModel extends IRegisterScreenModel {
  RegisterScreenModel({
    required this.authRepository,
    required this.inappAuthRepository,
  });
  AuthRepository authRepository;
  InAppAuthRepository inappAuthRepository;

  @override
  Future<void> register(String email, String password) {
    try {
      return authRepository.register(email, password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }
}
