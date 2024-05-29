import 'package:firebase_auth/firebase_auth.dart';
import 'package:moodmaster/data/source/auth_rds/auth_rds.dart';

class AuthRepository {
  AuthRepository({
    required this.authRDS,
  });
  AuthRDS authRDS;

  Future<void> register(String email, String password) async {
    try {
      await authRDS.register(email, password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await authRDS.login(email, password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }
}
