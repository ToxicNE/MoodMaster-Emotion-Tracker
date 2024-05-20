import 'package:moodmaster/data/models/enums/mood_enum.dart';

class MoodModel {
  MoodModel({
    required this.mood,
    required this.time,
    this.note,
  });

  MoodEnum mood;
  DateTime time;
  String? note;
  
}
