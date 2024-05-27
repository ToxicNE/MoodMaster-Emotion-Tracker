import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/ui/features/auth/auth/auth_screen_wm.dart';

@RoutePage()
class AuthScreen extends ElementaryWidget<IAuthScreenWidgetModel> {
  const AuthScreen({super.key}) : super(defaultAuthScreenWidgetModelFactory);

  @override
  Widget build(IAuthScreenWidgetModel wm) {
    return const Scaffold();
  }
}
