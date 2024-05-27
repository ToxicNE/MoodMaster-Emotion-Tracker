import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/ui/features/auth/register/register_screen_wm.dart';

@RoutePage()
class RegisterScreen extends ElementaryWidget<IRegisterScreenWidgetModel> {
  const RegisterScreen({super.key})
      : super(defaultRegisterScreenWidgetModelFactory);

  @override
  Widget build(IRegisterScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: wm.emailController,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: wm.passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm password',
              ),
              controller: wm.confirmPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: wm.register,
                child: const Text('Register'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
