// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoElementImpl _$$TodoElementImplFromJson(Map<String, dynamic> json) =>
    _$TodoElementImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      importance: $enumDecode(_$ImportanceEnumMap, json['importance']),
      done: json['done'] as bool,
      deadline: (json['deadline'] as num?)?.toInt(),
      color: json['color'] as String?,
      createdAt: (json['created_at'] as num).toInt(),
      changedAt: (json['changed_at'] as num).toInt(),
      lastUpdatedBy: json['last_updated_by'] as String,
    );

Map<String, dynamic> _$$TodoElementImplToJson(_$TodoElementImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'text': instance.text,
    'importance': _$ImportanceEnumMap[instance.importance],
    'done': instance.done,
  };

  void writeNotNull(String key, value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deadline', instance.deadline);
  writeNotNull('color', instance.color);
  val['created_at'] = instance.createdAt;
  val['changed_at'] = instance.changedAt;
  val['last_updated_by'] = instance.lastUpdatedBy;
  return val;
}

const _$ImportanceEnumMap = {
  Importance.basic: 'basic',
  Importance.low: 'low',
  Importance.important: 'important',
};
