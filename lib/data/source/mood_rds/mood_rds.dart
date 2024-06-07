import 'dart:convert';

import 'package:moodmaster/data/models/mood/mood_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoodRDS {
  MoodRDS({
    required this.sharedPreferences,
  });

  SharedPreferences sharedPreferences;

  final String _key = 'mood_key';

  Future<void> setMood(MoodModel mood) async {
    List<MoodModel>? moods = getMood();

    moods ??= [];

    moods.add(mood);

    await sharedPreferences.setStringList(_key, moods.map((e) => jsonEncode(e.toJson())).toList());
  }

  List<MoodModel>? getMood() {
    final value = sharedPreferences.getStringList(_key);

    if (value == null) return null;

    return value.map((e) => MoodModel.fromJson(jsonDecode(e))).toList();
  }

  Future<void> clearMood() async {
    await sharedPreferences.remove(_key);
  }
}
