import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:moodmaster/data/models/mood/mood_model.dart';
import 'package:moodmaster/di/global/global_scope.dart';

import 'model_info_screen_widget.dart';
import 'mood_info_screen_model.dart';

abstract interface class IMoodInfoScreenWidgetModel implements IWidgetModel {
  ValueNotifier<EntityState<List<MoodModel>?>> get userMoods;

  Future<void> onClearMoodInfoTap();
}

MoodInfoScreenWidgetModel defaultMoodInfoScreenWidgetModelFactory(BuildContext context) {
  return MoodInfoScreenWidgetModel(MoodInfoScreenModel(moodRepository: context.global.moodRepository));
}

class MoodInfoScreenWidgetModel extends WidgetModel<MoodInfoScreen, IMoodInfoScreenModel>
    implements IMoodInfoScreenWidgetModel {
  MoodInfoScreenWidgetModel(super.model);

  final _moodEntity = EntityStateNotifier<List<MoodModel>?>();

  @override
  ValueNotifier<EntityState<List<MoodModel>?>> get userMoods => _moodEntity;

  void onMoodNotifierUpdate() {
    _moodEntity.content(model.moodValueNotofier.value);
  }

  @override
  void initWidgetModel() {
    model.moodValueNotofier.addListener(onMoodNotifierUpdate);

    _moodEntity.content(model.moodValueNotofier.value);
    super.initWidgetModel();
  }

  @override
  Future<void> onClearMoodInfoTap() {
    return model.onClearMoodInfoTap();
  }
}
