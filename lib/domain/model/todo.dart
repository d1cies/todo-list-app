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
    DateTime? deadline,
    Importance? importance,
  }) = _Todo;

  factory Todo.create({
    required String text,
    required bool done,
    DateTime? deadline,
    Importance? importance,
  }) => Todo(
    id:  const Uuid().v4(),
    text: text,
    done: done,
    deadline: deadline,
    importance: importance,
  );

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
