import 'package:auto_route/auto_route.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:moodmaster/data/models/enums/register_error_enum.dart';
import 'package:moodmaster/di/global/global_scope.dart';
import 'package:moodmaster/navigation/app_router.dart';
import 'package:moodmaster/ui/features/auth/register/register_screen_model.dart';
import 'package:moodmaster/ui/features/auth/register/register_screen_widget.dart';

abstract interface class IRegisterScreenWidgetModel implements IWidgetModel {
  ValueNotifier<EntityState<RegisterErrorEnum?>> get errorListenable;

  ValueNotifier<EntityState<bool>> get hasRegisterEmailSendedListenable;

  ValueNotifier<EntityState<bool>> get registerLoadingListenable;

  TextEditingController get emailController;

  TextEditingController get passwordController;

  TextEditingController get confirmPasswordController;

  Future<void> register();

  void onContinueRegistrationTap();
}

RegisterScreenWidgetModel defaultRegisterScreenWidgetModelFactory(
    BuildContext context) {
  return RegisterScreenWidgetModel(RegisterScreenModel(
    authRepository: context.global.authRepository,
    inappAuthRepository: context.global.inAppAuthRepository,
  ));
}

class RegisterScreenWidgetModel
    extends WidgetModel<RegisterScreen, IRegisterScreenModel>
    implements IRegisterScreenWidgetModel {
  RegisterScreenWidgetModel(RegisterScreenModel super.model);

  final _errorEntity = EntityStateNotifier<RegisterErrorEnum?>();

  final _hasRegisteredEmailSended = EntityStateNotifier<bool>();

  final _registerLoadingEntity = EntityStateNotifier<bool>();

  @override
  ValueNotifier<EntityState<RegisterErrorEnum?>> get errorListenable =>
      _errorEntity;

  @override
  ValueNotifier<EntityState<bool>> get hasRegisterEmailSendedListenable =>
      _hasRegisteredEmailSended;

  @override
  ValueNotifier<EntityState<bool>> get registerLoadingListenable =>
      _registerLoadingEntity;

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

  void _onPasswordControllerValueChange() {
    _errorEntity.content(null);
  }

  void _onEmailControllerValueChange() {
    _errorEntity.content(null);
  }

  @override
  void initWidgetModel() {
    _confirmPasswordController.addListener(_onPasswordControllerValueChange);
    _passwordController.addListener(_onPasswordControllerValueChange);

    _emailController.addListener(_onEmailControllerValueChange);

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

    if (password.length < 5) {
      return _errorEntity.content(RegisterErrorEnum.shortPassword);
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return _errorEntity.content(RegisterErrorEnum.incorrectEmail);
    }

    _registerLoadingEntity.content(true);

    try {
      await model.register(email, password);
      _hasRegisteredEmailSended.content(true);
      _registerLoadingEntity.content(false);
    } on Exception {
      _errorEntity.content(RegisterErrorEnum.undefiendError);
      _registerLoadingEntity.content(false);
    }
  }

  @override
  void onContinueRegistrationTap() {
    context.router.push(const InAppAuthRoute());
  }
}
