import 'package:elementary/elementary.dart';
import 'package:moodmaster/domain/mood_repository/mood_repository.dart';

abstract interface class IMoodScreenModel extends ElementaryModel {
  Future<void> onSadTap();
  Future<void> onNormalTap();
  Future<void> onHappyTap();
}

class MoodScreenModel extends IMoodScreenModel {
  MoodScreenModel({
    required this.moodRepository,
  });
  MoodRepository moodRepository;
  @override
  Future<void> onSadTap() async {
    await moodRepository.addSadPoint();
  }

  @override
  Future<void> onHappyTap() async {
    await moodRepository.addHappyPoint();
  }

  @override
  Future<void> onNormalTap() async {
    await moodRepository.addNormalPoint();
  }
}
