import 'package:elementary/elementary.dart';
import 'package:moodmaster/domain/mood_repository/mood_repository.dart';

abstract interface class IMoodInfoScreenModel extends ElementaryModel {
  Future<void> onClearMoodInfoTap();
}

class MoodInfoScreenModel extends IMoodInfoScreenModel {
  MoodInfoScreenModel({
    required this.moodRepository,
  });
  MoodRepository moodRepository;
  @override
  Future<void> onClearMoodInfoTap() {
    return moodRepository.clearMoodInfo();
  }
}
