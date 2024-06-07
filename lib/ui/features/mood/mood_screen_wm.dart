import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:moodmaster/data/models/enums/mood_enum.dart';
import 'package:moodmaster/data/models/mood/mood_model.dart';
import 'package:moodmaster/di/global/global_scope.dart';

import 'mood_screen_model.dart';
import 'mood_screen_widget.dart';

abstract interface class IMoodScreenWidgetModel implements IWidgetModel {
  Future<void> onMoodSetTap(MoodEnum moodEnum);
}

MoodScreenWidgetModel defaultMoodScreenWidgetModelFactory(BuildContext context) {
  return MoodScreenWidgetModel(MoodScreenModel(moodRepository: context.global.moodRepository));
}

class MoodScreenWidgetModel extends WidgetModel<MoodScreen, IMoodScreenModel> implements IMoodScreenWidgetModel {
  MoodScreenWidgetModel(MoodScreenModel super.model);

  @override
  Future<void> onMoodSetTap(MoodEnum moodEnum) async {
    final userMood = MoodModel(mood: moodEnum, time: DateTime.now());

    await model.setNewMood(userMood);
  }
}
