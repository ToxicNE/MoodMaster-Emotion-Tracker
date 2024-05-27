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
      appBar: AppBar(
        title: const Text('Welcome to MoodMaster!'),
        leading: const SizedBox(),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  'https://otkritkis.com/wp-content/uploads/2022/07/gznan.gif',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  shadowColor: Colors.lightGreenAccent,
                  foregroundColor: Colors.black,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: wm.onAuthButtonTap,
                child: const Text(
                  'Authorize',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shadowColor: Colors.lightGreenAccent,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    foregroundColor: Colors.black),
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
