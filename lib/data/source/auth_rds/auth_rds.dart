import 'package:firebase_auth/firebase_auth.dart';

class AuthRDS {
  AuthRDS({
    required this.firebaseAuth,
  });
  FirebaseAuth firebaseAuth;

  // TODO() сделать авторизацию
  Future<void> register(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }
}
