// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoListResponseImpl _$$TodoListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TodoListResponseImpl(
      status: json['status'] as String,
      list: (json['list'] as List<dynamic>)
          .map((e) => TodoElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      revision: (json['revision'] as num).toInt(),
    );

Map<String, dynamic> _$$TodoListResponseImplToJson(
        _$TodoListResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'list': instance.list.map((e) => e.toJson()).toList(),
      'revision': instance.revision,
    };
