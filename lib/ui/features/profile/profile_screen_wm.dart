// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:moodmaster/di/global/global_scope.dart';
import 'package:moodmaster/navigation/app_router.dart';
import 'profile_screen_model.dart';
import 'profile_screen_widget.dart';

abstract interface class IProfileScreenWidgetModel implements IWidgetModel {
  Future<void> onSignOutTap();
}

ProfileScreenWidgetModel defaultProfileScreenWidgetModelFactory(
    BuildContext context) {
  return ProfileScreenWidgetModel(ProfileScreenModel(
      authRepository: context.global.authRepository,
      inAppAuthRepository: context.global.inAppAuthRepository));
}

class ProfileScreenWidgetModel
    extends WidgetModel<ProfileScreen, IProfileScreenModel>
    implements IProfileScreenWidgetModel {
  ProfileScreenWidgetModel(ProfileScreenModel super.model);

  @override
  Future<void> onSignOutTap() async {
    await model.signOut();
    context.router.push(const MainAuthRoute());
  }
}
