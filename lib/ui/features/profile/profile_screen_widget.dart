import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'profile_screen_wm.dart';

@RoutePage()
class ProfileScreen extends ElementaryWidget<IProfileScreenWidgetModel> {
  const ProfileScreen({super.key})
      : super(defaultProfileScreenWidgetModelFactory);

  @override
  Widget build(IProfileScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Профиль",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: const SizedBox(),
        actions: [
          IconButton(
              onPressed: () => wm.onSignOutTap(),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Stack(
        children: [
          // Image.asset(
          //   'assets/background_img.JPEG',
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          Center(
            child: Column(
              children: [
                const SizedBox(),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'https://avatars.githubusercontent.com/u/44781075?v=4',
                      )),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: const Center(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Логин:')),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: const Center(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Имя:')),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: const Center(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Электронная почта:')),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
