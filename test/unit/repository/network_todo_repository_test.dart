import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/data/dto/request/todo_request.dart';

import 'package:todo_list/data/repository/network_todo_repository.dart';
import 'package:todo_list/domain/repository/network_todo_repository.dart';
import 'package:todo_list/internal/di/constant.dart';

import '../../data/mock_data.dart';
import '../../data/todo_list.dart';

void main() {
  late MockNetworkTodoService networkTodoServiceMock;
  late INetworkTodoRepository networkTodoRepository;

  setUpAll(
    () {
      registerFallbackValue(mockTodoRequest);
      registerFallbackValue(mockTodoResponse);
    },
  );
  setUp(
    () {
      networkTodoServiceMock = MockNetworkTodoService();

      when(
        () => networkTodoServiceMock.getTodoList(),
      ).thenAnswer((_) async => mockTodoListResponse);

      when(
        () => networkTodoServiceMock.createTodo(
          request: TodoRequest(
            element: mockTodoElementList.first,
          ),
        ),
      ).thenAnswer((_) async => mockTodoResponse);

      when(
        () => networkTodoServiceMock.updateTodo(
          any(
            that: isA<String>(),
          ),
          request: mockTodoRequest,
        ),
      ).thenAnswer((_) async => mockTodoResponse);

      when(
        () => networkTodoServiceMock.updateTodo(
          mockUpdatedTodoElement.id,
          request: mockTodoUpdateRequest,
        ),
      ).thenAnswer((_) async => mockTodoUpdatedResponse);

      when(
        () => networkTodoServiceMock.deleteTodo(mockTodoList.first.id),
      ).thenAnswer((_) async => mockTodoResponse);

      networkTodoRepository = NetworkTodoRepository(
        networkTodoServiceMock,
        revisionKey: InternalConstants.revisionKey,
      );
    },
  );

  group(
    'NetworkTodoRepository',
    () {
      test(
        'и его метод getTodoList должен выполнить обращение к TodoService и вернуть List<Todo>',
        () async {
          final networkTodoList = await networkTodoRepository.getTodoList();
          verify(() => networkTodoServiceMock.getTodoList());
          expect(networkTodoList, mockTodoList);
        },
      );
      test(
        'и его метод createTodo должен выполнить обращение к TodoService и вернуть созданное Todo',
        () async {
          final networkTodo =
              await networkTodoRepository.createTodo(mockTodoList.first);
          expect(networkTodo, mockTodoList.first);
        },
      );
      test(
        'и его метод updateTodo должен выполнить одно обращение к TodoService с любимым id типа String и заданным параметром request',
        () async {
          await networkTodoRepository.updateTodo(mockTodoList.first);
          verify(
            () => networkTodoServiceMock.updateTodo(
              any(
                that: isA<String>(),
              ),
              request: mockTodoRequest,
            ),
          ).called(1);
        },
      );

      test(
        'и его метод updateTodo должен выполнить обращение к TodoService и вернуть созданную Todo',
        () async {
          final updatedTodo =
              await networkTodoRepository.updateTodo(mockUpdatedTodo);
          expect(updatedTodo, mockUpdatedTodo);
        },
      );

      test(
        'и его метод deleteTodo должен выполнить обращение к TodoService и вернуть удаленную Todo',
            () async {
          final deletedTodo =
          await networkTodoRepository.deleteTodo(mockTodoList.first.id);
          expect(deletedTodo, mockTodoList.first);
        },
      );
    },
  );
}
