import 'package:flutter/material.dart';
import 'package:moodmaster/data/models/mood/mood_model.dart';
import 'package:moodmaster/data/source/mood_rds/mood_rds.dart';

class MoodRepository {
  MoodRepository({
    required this.moodRDS,
  });
  MoodRDS moodRDS;

  ValueNotifier<List<MoodModel>?> moodNotifier = ValueNotifier(null);

  // 1 Получить изначальную информацию о настроении пользователя из sharedPreferences
  // 2 Засетить эту информацию в moodNotifier через moodNotifier.value = data;
  Future<void> setNotifierValue() async {
    final moods = moodRDS.getMood();
    if (moods == null) return;
    moodNotifier.value = moods;
  }

  Future<void> setNewMood(MoodModel models) async {
    await moodRDS.setMood(models);

    setNotifierValue();
  }

  Future<void> clearMood() async {
    await moodRDS.clearMood();

    setNotifierValue();
  }

  List<MoodModel>? getMoods() => moodRDS.getMood();
}
