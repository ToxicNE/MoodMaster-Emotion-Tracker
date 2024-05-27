import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/ui/features/auth/main_auth_screen/main_auth_screen_wm.dart';

@RoutePage()
class MainAuthScreen extends ElementaryWidget<IMainAuthScreenWidgetModel> {
  const MainAuthScreen({super.key}) : super(defaultMainAuthScreenWidgetModelFactory);

  @override
  Widget build(IMainAuthScreenWidgetModel wm) {
    return Container();
  }
}
