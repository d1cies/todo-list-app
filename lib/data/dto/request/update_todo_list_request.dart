// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/dto/model/todo_element.dart';

part 'update_todo_list_request.freezed.dart';

part 'update_todo_list_request.g.dart';

@freezed
class UpdateTodoListRequest with _$UpdateTodoListRequest {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory UpdateTodoListRequest({
    required List<TodoElement> list,
  }) = _UpdateTodoListRequest;

  factory UpdateTodoListRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTodoListRequestFromJson(json);
}
