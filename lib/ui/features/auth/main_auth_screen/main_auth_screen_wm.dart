import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:moodmaster/ui/features/auth/main_auth_screen/main_auth_screen_model.dart';
import 'package:moodmaster/ui/features/auth/main_auth_screen/main_auth_screen_widget.dart';

abstract interface class IMainAuthScreenWidgetModel implements IWidgetModel {}

MainAuthScreenWidgetModel defaultMainAuthScreenWidgetModelFactory(BuildContext context) {
  return MainAuthScreenWidgetModel(MainAuthScreenModel());
}

class MainAuthScreenWidgetModel extends WidgetModel<MainAuthScreen, IMainAuthScreenModel>
    implements IMainAuthScreenWidgetModel {
  MainAuthScreenWidgetModel(MainAuthScreenModel model) : super(model);
}
