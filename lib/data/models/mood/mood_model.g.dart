// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoodModel _$MoodModelFromJson(Map<String, dynamic> json) => MoodModel(
      mood: $enumDecode(_$MoodEnumEnumMap, json['mood']),
      time: DateTime.parse(json['time'] as String),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$MoodModelToJson(MoodModel instance) => <String, dynamic>{
      'mood': _$MoodEnumEnumMap[instance.mood]!,
      'time': instance.time.toIso8601String(),
      'note': instance.note,
    };

const _$MoodEnumEnumMap = {
  MoodEnum.happy: 'happy',
  MoodEnum.normal: 'normal',
  MoodEnum.sad: 'sad',
  MoodEnum.angry: 'angry',
  MoodEnum.fear: 'fear',
  MoodEnum.surprise: 'surprise',
};
