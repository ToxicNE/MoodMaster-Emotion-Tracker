import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/data/models/user/user.dart';
import 'package:moodmaster/di/global/global_scope.dart';
import 'package:moodmaster/ui/features/auth/in_app_auth/in_app_auth_screen_model.dart';
import 'package:moodmaster/ui/features/auth/in_app_auth/in_app_auth_screen_widget.dart';

abstract interface class IInAppAuthScreenWidgetModel implements IWidgetModel {
  Future<void> endLogin(User user);

  TextEditingController get nameController;

  TextEditingController get surnameController;

  TextEditingController get avatarUrlController;
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

  @override
  Future<void> endLogin(User user) async {
    user.name = _nameController.text;
    user.surname = _surnameController.text;
    user.avatarUrl = _avararUrlController.text;
    await model.endLogin(user);
  }

  @override
  TextEditingController get avatarUrlController => _avararUrlController;

  @override
  TextEditingController get nameController => _nameController;

  @override
  TextEditingController get surnameController => _nameController;
}
