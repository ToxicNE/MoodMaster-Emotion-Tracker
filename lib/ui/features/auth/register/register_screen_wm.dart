import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:moodmaster/data/models/enums/register_error_enum.dart';
import 'package:moodmaster/di/global/global_scope.dart';
import 'package:moodmaster/ui/features/auth/register/register_screen_model.dart';
import 'package:moodmaster/ui/features/auth/register/register_screen_widget.dart';

abstract interface class IRegisterScreenWidgetModel implements IWidgetModel {
  ValueNotifier<EntityState<RegisterErrorEnum>> get errorListenable;

  Future<void> register();

  TextEditingController get emailController;

  TextEditingController get passwordController;

  TextEditingController get confirmPasswordController;
}

RegisterScreenWidgetModel defaultRegisterScreenWidgetModelFactory(
    BuildContext context) {
  return RegisterScreenWidgetModel(RegisterScreenModel(
    authRepository: context.global.authRepository,
  ));
}

class RegisterScreenWidgetModel
    extends WidgetModel<RegisterScreen, IRegisterScreenModel>
    implements IRegisterScreenWidgetModel {
  RegisterScreenWidgetModel(RegisterScreenModel model) : super(model);

  final _errorEntity = EntityStateNotifier<RegisterErrorEnum>();

  @override
  ValueNotifier<EntityState<RegisterErrorEnum>> get errorListenable =>
      _errorEntity;

  late final _confirmPasswordController = TextEditingController();

  late final _emailController = TextEditingController();

  late final _passwordController = TextEditingController();

  @override
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  @override
  TextEditingController get emailController => _emailController;

  @override
  TextEditingController get passwordController => _passwordController;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  Future<void> register() async {
    final email = _emailController.text;

    final password = _passwordController.text;

    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      return _errorEntity.content(RegisterErrorEnum.diffrentPasswords);
    }

    // TODO() проверка на правильность пароля

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return _errorEntity.content(RegisterErrorEnum.incorrectEmail);
    }

    await model.register(email, password);
  }
}
