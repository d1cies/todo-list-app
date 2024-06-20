// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoImpl _$$TodoImplFromJson(Map<String, dynamic> json) => _$TodoImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      done: json['done'] as bool,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      importance: $enumDecodeNullable(_$ImportanceEnumMap, json['importance']),
    );

Map<String, dynamic> _$$TodoImplToJson(_$TodoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'done': instance.done,
      'deadline': instance.deadline?.toIso8601String(),
      'importance': _$ImportanceEnumMap[instance.importance],
    };

const _$ImportanceEnumMap = {
  Importance.no: 'no',
  Importance.low: 'low',
  Importance.high: 'high',
};
