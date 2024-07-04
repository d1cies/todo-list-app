// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_todo_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateTodoListRequestImpl _$$UpdateTodoListRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateTodoListRequestImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => TodoElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UpdateTodoListRequestImplToJson(
        _$UpdateTodoListRequestImpl instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
    };
