import 'package:moodmaster/data/source/mood_rds/mood_rds.dart';

class MoodRepository {
  MoodRepository({
    required this.moodRDS,
  });
  MoodRDS moodRDS;
  Future<void> addSadPoint() {
    pieData[0].yData += 1;
    return moodRDS.sharedPreferences.setInt('sadMood', pieData[0].yData);
  }

  Future<void> addNormalPoint() {
    pieData[1].yData += 1;
    return moodRDS.sharedPreferences.setInt('normalMood', pieData[1].yData);
  }

  Future<void> addHappyPoint() {
    pieData[2].yData += 1;
    return moodRDS.sharedPreferences.setInt('happyMood', pieData[2].yData);
  }

  Future<void> clearMoodInfo() async {
    pieData.forEach((element) {
      element.yData = 1;
    });
    moodRDS.sharedPreferences.setInt('sadMood', 0);
    moodRDS.sharedPreferences.setInt('normalMood', 0);
    moodRDS.sharedPreferences.setInt('happyMood', 0);
  }
}
