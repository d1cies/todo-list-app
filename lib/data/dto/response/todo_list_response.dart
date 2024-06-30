// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/dto/model/todo_element.dart';

part 'todo_list_response.freezed.dart';

part 'todo_list_response.g.dart';

@freezed
class TodoListResponse with _$TodoListResponse {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory TodoListResponse({
    required String status,
    required List<TodoElement> list,
    required int revision,
  }) = _TodoListResponse;

  factory TodoListResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoListResponseFromJson(json);
}
