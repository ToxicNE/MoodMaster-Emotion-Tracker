import 'package:elementary/elementary.dart';
import 'package:moodmaster/data/models/mood/mood_model.dart';
import 'package:moodmaster/domain/mood_repository/mood_repository.dart';

abstract interface class IMoodScreenModel extends ElementaryModel {
  Future<void> setNewMood(MoodModel moodModel);
}

class MoodScreenModel extends IMoodScreenModel {
  MoodScreenModel({
    required this.moodRepository,
  });
  MoodRepository moodRepository;

  @override
  Future<void> setNewMood(MoodModel moodModel) async {
    await moodRepository.setNewMood(moodModel);
  }
}
