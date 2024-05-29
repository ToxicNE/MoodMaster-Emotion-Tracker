import 'package:auto_route/auto_route.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:moodmaster/di/global/global_scope.dart';
import 'package:moodmaster/navigation/app_router.dart';
import 'package:moodmaster/ui/features/auth/auth/auth_screen_model.dart';
import 'package:moodmaster/ui/features/auth/auth/auth_screen_widget.dart';

import '../../../../data/models/enums/register_error_enum.dart';

abstract interface class IAuthScreenWidgetModel implements IWidgetModel {
  ValueNotifier<EntityState<RegisterErrorEnum>> get errorListenable;

  Future<void> login();

  TextEditingController get emailController;

  TextEditingController get passwordController;

  void onLoginButtonTap();
}

AuthScreenWidgetModel defaultAuthScreenWidgetModelFactory(
    BuildContext context) {
  return AuthScreenWidgetModel(AuthScreenModel(
    authRepository: context.global.authRepository,
  ));
}

class AuthScreenWidgetModel extends WidgetModel<AuthScreen, IAuthScreenModel>
    implements IAuthScreenWidgetModel {
  AuthScreenWidgetModel(AuthScreenModel super.model);

  late final _emailController = TextEditingController();

  late final _passwordController = TextEditingController();

  final _errorEntity = EntityStateNotifier<RegisterErrorEnum>();

  @override
  TextEditingController get emailController => _emailController;

  @override
  ValueNotifier<EntityState<RegisterErrorEnum>> get errorListenable =>
      _errorEntity;
  @override
  Future<void> login() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await model.login(email, password);
  }

  @override
  TextEditingController get passwordController => _passwordController;

  @override
  void onLoginButtonTap() {
    context.router.push(const InAppAuthRoute());
  }
}
