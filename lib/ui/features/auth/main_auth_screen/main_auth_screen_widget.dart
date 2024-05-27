import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/ui/features/auth/main_auth_screen/main_auth_screen_wm.dart';

@RoutePage()
class MainAuthScreen extends ElementaryWidget<IMainAuthScreenWidgetModel> {
  const MainAuthScreen({super.key}) : super(defaultMainAuthScreenWidgetModelFactory);

  @override
  Widget build(IMainAuthScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
        leading: const SizedBox(),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: wm.onAuthButtonTap,
                child: const Text(
                  'Auth',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: wm.onRegisterButtonTap,
                child: const Text(
                  'Register',
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
