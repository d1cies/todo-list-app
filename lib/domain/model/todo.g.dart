// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoImpl _$$TodoImplFromJson(Map<String, dynamic> json) => _$TodoImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      done: json['done'] as bool,
      importance: $enumDecode(_$ImportanceEnumMap, json['importance']),
      createdAt: (json['createdAt'] as num).toInt(),
      changedAt: (json['changedAt'] as num).toInt(),
      lastUpdatedBy: json['lastUpdatedBy'] as String,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$TodoImplToJson(_$TodoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'done': instance.done,
      'importance': _$ImportanceEnumMap[instance.importance],
      'createdAt': instance.createdAt,
      'changedAt': instance.changedAt,
      'lastUpdatedBy': instance.lastUpdatedBy,
      'deadline': instance.deadline?.toIso8601String(),
      'color': instance.color,
    };

const _$ImportanceEnumMap = {
  Importance.basic: 'basic',
  Importance.low: 'low',
  Importance.important: 'important',
};
