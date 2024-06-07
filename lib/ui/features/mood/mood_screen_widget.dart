import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'mood_screen_wm.dart';

@RoutePage()
class MoodScreen extends ElementaryWidget<IMoodScreenWidgetModel> {
  const MoodScreen({super.key}) : super(defaultMoodScreenWidgetModelFactory);

  @override
  Widget build(IMoodScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Оценка эмоций",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: const SizedBox(),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Пожалуйста, оцените то, как вы себя чувствуете'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              foregroundColor: Colors.black),
                          onPressed: () => wm.onSadTap(),
                          child: const Text('Плохое'),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellowAccent,
                              foregroundColor: Colors.black),
                          onPressed: () => wm.onNormalTap(),
                          child: const Text('Нормальное'),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreenAccent,
                              foregroundColor: Colors.black),
                          onPressed: () => wm.onHappyTap(),
                          child: const Text('Хорошее'),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
