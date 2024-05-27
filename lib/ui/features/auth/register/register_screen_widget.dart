import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/ui/features/auth/register/register_screen_wm.dart';

@RoutePage()
class RegisterScreen extends ElementaryWidget<IRegisterScreenWidgetModel> {
  const RegisterScreen({super.key}) : super(defaultRegisterScreenWidgetModelFactory);

  @override
  Widget build(IRegisterScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
