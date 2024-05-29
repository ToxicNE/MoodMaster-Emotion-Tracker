import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:moodmaster/navigation/app_router.dart';
import 'package:moodmaster/ui/features/auth/main_auth_screen/main_auth_screen_model.dart';
import 'package:moodmaster/ui/features/auth/main_auth_screen/main_auth_screen_widget.dart';

abstract interface class IMainAuthScreenWidgetModel implements IWidgetModel {
  void onAuthButtonTap();

  void onRegisterButtonTap();
}

MainAuthScreenWidgetModel defaultMainAuthScreenWidgetModelFactory(
    BuildContext context) {
  return MainAuthScreenWidgetModel(MainAuthScreenModel());
}

class MainAuthScreenWidgetModel
    extends WidgetModel<MainAuthScreen, IMainAuthScreenModel>
    implements IMainAuthScreenWidgetModel {
  MainAuthScreenWidgetModel(MainAuthScreenModel super.model);

  @override
  void onAuthButtonTap() {
    context.router.push(const AuthRoute());
  }

  @override
  void onRegisterButtonTap() {
    context.router.push(const RegisterRoute());
  }
}
