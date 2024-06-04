import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:moodmaster/di/global/global_scope.dart';

import 'model_info_screen_widget.dart';
import 'mood_info_screen_model.dart';

abstract interface class IMoodInfoScreenWidgetModel implements IWidgetModel {
  Future<void> onClearMoodInfoTap();
}

MoodInfoScreenWidgetModel defaultMoodInfoScreenWidgetModelFactory(
    BuildContext context) {
  return MoodInfoScreenWidgetModel(
      MoodInfoScreenModel(moodRepository: context.global.moodRepository));
}

class MoodInfoScreenWidgetModel
    extends WidgetModel<MoodInfoScreen, IMoodInfoScreenModel>
    implements IMoodInfoScreenWidgetModel {
  MoodInfoScreenWidgetModel(super.model);

  @override
  Future<void> onClearMoodInfoTap() {
    return model.onClearMoodInfoTap();
  }
}
