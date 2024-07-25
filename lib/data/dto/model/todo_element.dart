// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/domain/model/importance.dart';

part 'todo_element.freezed.dart';

part 'todo_element.g.dart';

@freezed
class TodoElement with _$TodoElement {
  @JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
  )
  factory TodoElement({
    required String id,
    required String text,
    required Importance importance,
    required bool done,
    int? deadline,
    String? color,
    @JsonKey(name: 'created_at') required int createdAt,
    @JsonKey(name: 'changed_at') required int changedAt,
    @JsonKey(name: 'last_updated_by') required String lastUpdatedBy,
  }) = _TodoElement;

  factory TodoElement.fromJson(Map<String, dynamic> json) =>
      _$TodoElementFromJson(json);
}
