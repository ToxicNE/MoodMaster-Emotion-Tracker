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
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text(
          'Welcome to MoodMaster!',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        leading: const SizedBox(),
        backgroundColor: Colors.transparent,
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
                    child: Image.asset(
                      'assets/main_gif_cat.gif',
                    )),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade200,
                    shadowColor: Colors.blueGrey,
                    foregroundColor: Colors.black,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
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
                    backgroundColor: Colors.blueAccent.shade700,
                    shadowColor: Colors.blue.shade900,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: wm.onRegisterButtonTap,
                  child: const Text(
                    'Register',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
