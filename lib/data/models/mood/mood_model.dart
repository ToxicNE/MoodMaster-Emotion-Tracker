import 'package:json_annotation/json_annotation.dart';
import 'package:moodmaster/data/models/enums/mood_enum.dart';

part 'mood_model.g.dart';

@JsonSerializable()
class MoodModel {
  MoodModel({
    required this.mood,
    required this.time,
    this.note,
  });

  MoodEnum mood;
  DateTime time;
  String? note;

  factory MoodModel.fromJson(Map<String, dynamic> json) => _$MoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoodModelToJson(this);
}
