import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/analytics/analytics_events_wrapper.dart';
import 'package:todo_list/domain/repository/local_todo_repository.dart';
import 'package:todo_list/domain/repository/network_todo_repository.dart';
import 'package:todo_list/domain/use_case/todo_use_case.dart';
import 'package:todo_list/internal/di/constant.dart';

import '../../data/mock_analytics_events_wrapper.dart';
import '../../data/mock_data.dart';
import '../../data/todo_list.dart';



void main() {
  late ITodoUseCase todoUseCase;
  late ILocalTodoRepository localTodoRepository;
  INetworkTodoRepository networkTodoRepository;
  late IAnalyticsEventsWrapper analyticsEventsWrapper;

  setUp(
    () {
      localTodoRepository = MockLocalTodoRepository();
      networkTodoRepository = MockNetworkTodoRepository();
      analyticsEventsWrapper = MockAnalyticsEventsWrapper();
      todoUseCase = TodoUseCase(
        localTodoRepository: localTodoRepository,
        networkTodoRepository: networkTodoRepository,
        revisionKey: InternalConstants.revisionKey,
        analyticsEventsWrapper: analyticsEventsWrapper,
      );

      when(
        () => localTodoRepository.getTodoList(),
      ).thenAnswer((_) async => mockTodoList);
    },
  );

  group(
    'TodoUseCase',
    () {
      test(
        '',
        () {
          expect(todoUseCase.getTodoList(), mockTodoList);
        },
      );
    },
  );
}
