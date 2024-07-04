// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/dto/model/todo_element.dart';

part 'todo_response.freezed.dart';

part 'todo_response.g.dart';

@freezed
class TodoResponse with _$TodoResponse {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory TodoResponse({
    required String status,
    required TodoElement element,
    required int revision,
  }) = _TodoResponse;

  factory TodoResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseFromJson(json);
}
