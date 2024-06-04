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

  User? getUser() {
    final userJson = sharedPreferences.getString(_key);

    if (userJson == null) return null;

    return User.fromJson(jsonDecode(userJson));
  }

  Future<void> clearUser() async {
    sharedPreferences.remove(_key);
  }
}
