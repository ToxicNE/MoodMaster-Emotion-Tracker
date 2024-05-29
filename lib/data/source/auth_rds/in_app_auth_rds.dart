import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user/user.dart';

class InAppAuthRds {
  InAppAuthRds({
    required this.sharedPreferences,
  });
  SharedPreferences sharedPreferences;

  final String _key = 'user';

  Future<void> saveUser(User user) async {
    try {
      await sharedPreferences.setString(_key, jsonEncode(user.toJson()));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
