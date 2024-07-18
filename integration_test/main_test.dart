import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/app/app.dart';
import 'package:todo_list/app/environment/environment.dart';
import 'package:todo_list/data/service/todo_service.dart';
import 'package:todo_list/domain/repository/local_todo_repository.dart';
import 'package:todo_list/domain/repository/network_todo_repository.dart';
import 'package:todo_list/domain/use_case/todo_use_case.dart';

import '../test/data/mock_data.dart';

Future<void> mainTest() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initServices();
  runApp(
    TodoListApp(
      environment: Environment.test,
    ),
  );
}

Future<void> _initServices() async {
  GetIt.I.registerLazySingleton<TodoService>(MockNetworkTodoService.new);
  GetIt.I
      .registerLazySingleton<ILocalTodoRepository>(MockLocalTodoRepository.new);
  GetIt.I.registerLazySingleton<INetworkTodoRepository>(
      MockNetworkTodoRepository.new);
  GetIt.I.registerLazySingleton<ITodoUseCase>(
    () => MockTodoUseCase()..init(),
  );
}
