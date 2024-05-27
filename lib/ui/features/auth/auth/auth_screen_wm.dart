import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:moodmaster/ui/features/auth/auth/auth_screen_model.dart';
import 'package:moodmaster/ui/features/auth/auth/auth_screen_widget.dart';

abstract interface class IAuthScreenWidgetModel implements IWidgetModel {}

AuthScreenWidgetModel defaultAuthScreenWidgetModelFactory(BuildContext context) {
  return AuthScreenWidgetModel(AuthScreenModel());
}

class AuthScreenWidgetModel extends WidgetModel<AuthScreen, IAuthScreenModel> implements IAuthScreenWidgetModel {
  AuthScreenWidgetModel(AuthScreenModel model) : super(model);
}
