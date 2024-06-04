import 'package:shared_preferences/shared_preferences.dart';

class MoodRDS {
  MoodRDS({
    required this.sharedPreferences,
  });
  SharedPreferences sharedPreferences;
}

class PieData {
  PieData(this.xData, this.yData, [this.text]);
  String xData;
  int yData;
  String? text;
}

List<PieData> pieData = <PieData>[
  PieData('Плохо', 1, 'Плохо'),
  PieData('Нормально', 1, 'Нормально'),
  PieData('Хорошо', 1, 'Хорошо'),
];
