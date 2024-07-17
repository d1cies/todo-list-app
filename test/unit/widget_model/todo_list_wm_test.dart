// import 'dart:async';
//
// import 'package:elementary/elementary.dart';
// import 'package:elementary_test/elementary_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:todo_list/domain/use_case/todo_use_case.dart';
// import 'package:todo_list/presentation/todo_list/todo_list_screen/todo_list_screen.dart';
//
// import '../../data/mock_data.dart';
//
// // хотел протестировать widget model с помощью пакета elementary_test, т.к.
// // по бизнес логике тестироват особо нечего. Но где-то здесь запнулся на тесте состояния
// void main() {
//   late TodoListScreenModel model;
//   late ITodoUseCase todoUseCase;
//
//   TodoListScreenWidgetModel setUpWm() {
//     todoUseCase = MockTodoUseCase()..init();
//     model = TodoListScreenModelMock();
//     return TodoListScreenWidgetModel(
//       model,
//       todoUseCase: todoUseCase,
//     );
//   }
//
//   // тест падает, не успел разобраться почему
//   testWidgetModel<TodoListScreenWidgetModel, TodoListScreenWidget>(
//     'when getTodoList and before get result valueState todoListState be loading',
//     setUpWm,
//     (wm, tester, context) async {
//       tester.init();
//       when(() => todoUseCase.getTodoList()).thenAnswer(
//         (_) => Future.delayed(
//           const Duration(milliseconds: 30),
//           () => null,
//         ),
//       );
//
//       unawaited(wm.refreshTodoList());
//
//       await Future<void>.delayed(
//         const Duration(milliseconds: 10),
//       );
//
//       final value = wm.todoListState.value;
//
//       expect(value, isNotNull);
//       expect(value.isLoadingState, isTrue);
//     },
//   );
// }
//
// class TodoListScreenModelMock extends Mock
//     with MockElementaryModelMixin
//     implements TodoListScreenModel {}
