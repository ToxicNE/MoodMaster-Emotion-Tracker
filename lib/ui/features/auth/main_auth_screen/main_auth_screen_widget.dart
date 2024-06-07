import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/ui/features/auth/main_auth_screen/main_auth_screen_wm.dart';

@RoutePage()
class MainAuthScreen extends ElementaryWidget<IMainAuthScreenWidgetModel> {
  const MainAuthScreen({super.key})
      : super(defaultMainAuthScreenWidgetModelFactory);

  @override
  Widget build(IMainAuthScreenWidgetModel wm) {
    return Scaffold(
      body: Stack(
        children: [
          // Image.asset(
          //   'assets/background_img.JPEG',
          //   fit: BoxFit.fill,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/label_image.PNG',
                      )),
                  const SizedBox(height: 100),
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
                      onPressed: wm.onAuthButtonTap,
                      child: const Text(
                        'Есть аккаунт',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: wm.onRegisterButtonTap,
                      child: const Text(
                        'Зарегестрироваться',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
