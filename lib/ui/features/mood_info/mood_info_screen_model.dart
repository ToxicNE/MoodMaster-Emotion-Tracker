import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/data/models/mood/mood_model.dart';
import 'package:moodmaster/domain/mood_repository/mood_repository.dart';

abstract interface class IMoodInfoScreenModel extends ElementaryModel {
  Future<void> onClearMoodInfoTap();

  ValueNotifier<List<MoodModel>?> get moodValueNotofier;
}

class MoodInfoScreenModel extends IMoodInfoScreenModel {
  MoodInfoScreenModel({
    required this.moodRepository,
  });
  MoodRepository moodRepository;

  @override
  ValueNotifier<List<MoodModel>?> get moodValueNotofier => moodRepository.moodNotifier;

  @override
  Future<void> onClearMoodInfoTap() async {
    await moodRepository.clearMood();
  }
}
