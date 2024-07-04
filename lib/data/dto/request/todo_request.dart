// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/dto/model/todo_element.dart';

part 'todo_request.freezed.dart';

part 'todo_request.g.dart';

@freezed
class TodoRequest with _$TodoRequest {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory TodoRequest({
    required TodoElement element,
  }) = _TodoRequest;

  factory TodoRequest.fromJson(Map<String, dynamic> json) =>
      _$TodoRequestFromJson(json);
}
