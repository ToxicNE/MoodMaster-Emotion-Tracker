import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/data/models/enums/register_error_enum.dart';
import 'package:moodmaster/ui/features/auth/register/register_screen_wm.dart';

@RoutePage()
class RegisterScreen extends ElementaryWidget<IRegisterScreenWidgetModel> {
  const RegisterScreen({super.key})
      : super(defaultRegisterScreenWidgetModelFactory);

  @override
  Widget build(IRegisterScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создайте аккаунт',
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
                EntityStateNotifierBuilder<bool>(
                  listenableEntityState: wm.hasRegisterEmailSendedListenable,
                  errorBuilder: (context, e, data) => Container(),
                  loadingBuilder: (context, data) => Container(),
                  builder: (context, bool? data) {
                    if (data == true) {
                      return const Align(
                        alignment: Alignment.center,
                        child: Text('Вам отправлено письмо'),
                      );
                    }
                    return Container();
                  },
                ),
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
                  keyboardType: TextInputType.emailAddress,
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
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Повторите пароль',
                  ),
                  controller: wm.confirmPasswordController,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                const Spacer(),
                EntityStateNotifierBuilder<bool>(
                  listenableEntityState: wm.hasRegisterEmailSendedListenable,
                  builder: (context, bool? data) {
                    if (data == true) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.black,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: wm.onContinueRegistrationTap,
                          child: const Text('Продолжить'),
                        ),
                      );
                    }
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.black,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: wm.register,
                        child: const Text('Зарегистрироваться'),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16)
              ],
            ),
          ),
          EntityStateNotifierBuilder<bool>(
            listenableEntityState: wm.registerLoadingListenable,
            builder: (context, bool? data) {
              if (data == true) {
                return const Center(child: CircularProgressIndicator());
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
