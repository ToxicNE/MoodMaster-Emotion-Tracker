import 'package:moodmaster/data/models/mood/mood_model.dart';

class Journal {
  Journal({
    required this.time,
    this.mood,
    this.text,
    this.title,
  }) : assert(title != null || text != null, 'Need to provide title or text');

  String? title;
  String? text;
  MoodModel? mood;
  DateTime time;
}
