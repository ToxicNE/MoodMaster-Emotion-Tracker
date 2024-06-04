// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/data/models/user/user.dart';
import 'package:moodmaster/di/global/global_scope.dart';
import 'package:moodmaster/navigation/app_router.dart';
import 'package:moodmaster/ui/features/auth/in_app_auth/in_app_auth_screen_model.dart';
import 'package:moodmaster/ui/features/auth/in_app_auth/in_app_auth_screen_widget.dart';
import 'package:uuid/uuid.dart';

abstract interface class IInAppAuthScreenWidgetModel implements IWidgetModel {
  Future<void> endLogin();

  TextEditingController get nameController;

  TextEditingController get surnameController;

  TextEditingController get avatarUrlController;

  TextEditingController get loginController;
}

InAppAuthScreenWidgetModel defaultInAppAuthScreenWidgetModelFactory(
    BuildContext context) {
  return InAppAuthScreenWidgetModel(InAppAuthScreenModel(
    inAppAuthRepository: context.global.inAppAuthRepository,
  ));
}

class InAppAuthScreenWidgetModel
    extends WidgetModel<InAppAuthScreen, IInAppAuthScreenModel>
    implements IInAppAuthScreenWidgetModel {
  InAppAuthScreenWidgetModel(InAppAuthScreenModel super.model);

  late final _nameController = TextEditingController();

  late final _surnameController = TextEditingController();

  late final _avararUrlController = TextEditingController();

  late final _loginController = TextEditingController();

  @override
  Future<void> endLogin() async {
    const uuid = Uuid();
    final id = uuid.v1();
    User user = User(
        id: id,
        login: _loginController.text,
        name: _nameController.text,
        surname: _surnameController.text,
        avatarUrl: _avararUrlController.text);

    await model.endLogin(user);
    context.router.push(const AppBottomTabsRoute());
  }

  @override
  TextEditingController get avatarUrlController => _avararUrlController;

  @override
  TextEditingController get nameController => _nameController;

  @override
  TextEditingController get surnameController => _surnameController;

  @override
  TextEditingController get loginController => _loginController;
}
