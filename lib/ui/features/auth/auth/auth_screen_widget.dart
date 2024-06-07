import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/data/models/enums/register_error_enum.dart';
import 'package:moodmaster/ui/features/auth/auth/auth_screen_wm.dart';

@RoutePage()
class AuthScreen extends ElementaryWidget<IAuthScreenWidgetModel> {
  const AuthScreen({super.key}) : super(defaultAuthScreenWidgetModelFactory);

  @override
  Widget build(IAuthScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Войдите в аккаунт',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          // Image.asset(
          //   'assets/background_img.JPEG',
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                EntityStateNotifierBuilder<RegisterErrorEnum?>(
                  listenableEntityState: wm.errorListenable,
                  builder: (context, RegisterErrorEnum? data) {
                    if (data == null) return const SizedBox();
                    return Align(
                      alignment: Alignment.center,
                      child: Text(data.errorText),
                    );
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Электронная почта',
                  ),
                  controller: wm.emailController,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Пароль',
                  ),
                  controller: wm.passwordController,
                  obscureText: true,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.black,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: wm.login,
                    child: const Text('Log in'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
