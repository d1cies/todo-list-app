import 'package:todo_list/data/dto/model/todo_element.dart';
import 'package:todo_list/data/dto/request/todo_request.dart';
import 'package:todo_list/domain/model/todo.dart';

Todo mapDtoToTodo(TodoElement dto) {
  final deadline = dto.deadline;
  return Todo(
    id: dto.id,
    text: dto.text,
    done: dto.done,
    importance: dto.importance,
    deadline:
        deadline != null ? DateTime.fromMillisecondsSinceEpoch(deadline) : null,
    createdAt: dto.createdAt,
    changedAt: dto.changedAt,
    lastUpdatedBy: dto.lastUpdatedBy,
  );
}

TodoElement mapTodoToTodoElement(Todo todo) {
  return TodoElement(
    id: todo.id,
    text: todo.text,
    importance: todo.importance,
    deadline: todo.deadline?.millisecondsSinceEpoch,
    done: todo.done,
    createdAt: todo.createdAt,
    changedAt: todo.changedAt,
    lastUpdatedBy: todo.lastUpdatedBy,
  );
}
