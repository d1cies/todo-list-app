// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoResponseImpl _$$TodoResponseImplFromJson(Map<String, dynamic> json) =>
    _$TodoResponseImpl(
      status: json['status'] as String,
      element: TodoElement.fromJson(json['element'] as Map<String, dynamic>),
      revision: (json['revision'] as num).toInt(),
    );

Map<String, dynamic> _$$TodoResponseImplToJson(_$TodoResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'element': instance.element.toJson(),
      'revision': instance.revision,
    };
