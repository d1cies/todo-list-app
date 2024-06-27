import 'package:injectable/injectable.dart';
import 'package:todo_list/data/repository/local_todo_repository.dart';
import 'package:todo_list/domain/repository/todo_repository.dart';

@module
abstract class RegisterModule {
  static final LocalTodoRepository _localTodoRepository = LocalTodoRepository(
    key: 'todo-list',
  )..init();

  @singleton
  TodoRepository get todoRepository => _localTodoRepository;
}
