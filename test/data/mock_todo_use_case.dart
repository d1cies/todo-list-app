import 'package:mocktail/mocktail.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/use_case/todo_use_case.dart';

class MockTodoUseCase extends Mock implements ITodoUseCase {

  final BehaviorSubject<List<Todo>> _todoListStreamController =
      BehaviorSubject();

  @override
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  final List<Todo> _todoList = [];

  @override
  void init() {
    _todoListStreamController.add(_todoList);
  }

  @override
  void dispose() {
    _todoListStreamController.close();
  }

  @override
  Future<void> getTodoList() async {
    _todoListStreamController.add(_todoList);
  }

  @override
  List<Todo> get allCurrentTodoList => _todoListStreamController.value;

  @override
  Future<void> createTodo(Todo todo) async {
    _todoList.add(todo);
    _todoListStreamController.add(_todoList);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final todoIndex = _todoList.indexWhere((t) => t.id == todo.id);
    if (todoIndex != -1) {
      _todoList[todoIndex] = todo;
    } else {
      _todoList.insert(0, todo);
    }
    _todoListStreamController.add(_todoList);
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todoIndex = _todoList.indexWhere((t) => t.id == id);
    _todoList.removeAt(todoIndex);
    _todoListStreamController.add(_todoList);
  }

  @override
  int get countDoneTodos => _todoList.where((todo) => todo.done).length;
}
