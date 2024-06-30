import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/domain/model/importance.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';

part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  factory Todo({
    required String id,
    required String text,
    required bool done,
    required Importance importance,
    required int createdAt,
    required int changedAt,
    required String lastUpdatedBy,
    DateTime? deadline,
    String? color,
  }) = _Todo;

  factory Todo.create({
    required String text,
    required bool done,
    required String lastUpdatedBy,
    Importance? importance,
    DateTime? deadline,
    int? createdAt,
    int? changedAt,
    String? color,
  }) =>
      Todo(
        id: const Uuid().v4(),
        text: text,
        done: done,
        deadline: deadline,
        importance: importance ?? Importance.basic,
        createdAt: createdAt ??  DateTime.now().millisecondsSinceEpoch,
        changedAt: changedAt ?? DateTime.now().millisecondsSinceEpoch,
        lastUpdatedBy: lastUpdatedBy,
        color: color,
      );

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
