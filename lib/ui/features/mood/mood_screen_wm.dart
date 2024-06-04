import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:moodmaster/di/global/global_scope.dart';

import 'mood_screen_model.dart';
import 'mood_screen_widget.dart';

abstract interface class IMoodScreenWidgetModel implements IWidgetModel {
  Future<void> onSadTap();
  Future<void> onNormalTap();
  Future<void> onHappyTap();
}

MoodScreenWidgetModel defaultMoodScreenWidgetModelFactory(
    BuildContext context) {
  return MoodScreenWidgetModel(
      MoodScreenModel(moodRepository: context.global.moodRepository));
}

class MoodScreenWidgetModel extends WidgetModel<MoodScreen, IMoodScreenModel>
    implements IMoodScreenWidgetModel {
  MoodScreenWidgetModel(MoodScreenModel super.model);

  @override
  Future<void> onHappyTap() async {
    await model.onHappyTap();
  }

  @override
  Future<void> onNormalTap() async {
    await model.onNormalTap();
  }

  @override
  Future<void> onSadTap() async {
    await model.onSadTap();
  }
}
