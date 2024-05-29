import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/ui/features/auth/auth/auth_screen_wm.dart';

@RoutePage()
class AuthScreen extends ElementaryWidget<IAuthScreenWidgetModel> {
  const AuthScreen({super.key}) : super(defaultAuthScreenWidgetModelFactory);

  @override
  Widget build(IAuthScreenWidgetModel wm) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        title: const Text('Authorization',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey.shade400,
                  shadowColor: Colors.blueGrey,
                  foregroundColor: Colors.black,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.black, width: 2)),
                ),
                onPressed: wm.login,
                child: const Text('Log in'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
