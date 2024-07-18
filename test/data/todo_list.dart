import 'package:todo_list/data/dto/model/todo_element.dart';
import 'package:todo_list/data/dto/request/todo_request.dart';
import 'package:todo_list/data/dto/response/todo_list_response.dart';
import 'package:todo_list/data/dto/response/todo_response.dart';
import 'package:todo_list/domain/model/importance.dart';
import 'package:todo_list/domain/model/todo.dart';

/// моки для основных данных
List<Todo> mockTodoList = [
  Todo(
    id: '4d9a760b-7ee1-4796-9c55-3a51447bb6b4',
    text: 'one',
    done: true,
    importance: Importance.important,
    createdAt: 1720566498987,
    changedAt: 1720566498987,
    lastUpdatedBy: 'UE1A.230829.036.A1',
    deadline: DateTime.fromMillisecondsSinceEpoch(1721336400000),
  ),
  Todo(
    id: 'c5e443b5-05d1-4b48-873f-27cb059eff6e',
    text: 'two',
    done: true,
    importance: Importance.low,
    createdAt: 1720634174301,
    changedAt: 1720634174301,
    lastUpdatedBy: 'UE1A.230829.036.A1',
  ),
  Todo(
    id: 'b677ea09-a44c-40ee-a528-d71ee879b7ad',
    text: 'three',
    done: false,
    importance: Importance.important,
    createdAt: 1720634101934,
    changedAt: 1720634101934,
    lastUpdatedBy: 'UE1A.230829.036.A1',
    deadline: DateTime.fromMillisecondsSinceEpoch(1720645200000),
  ),
  Todo(
    id: 'ee694352-fc35-4588-936a-49bc6f191efa',
    text: 'four',
    done: true,
    importance: Importance.low,
    createdAt: 1720634091807,
    changedAt: 1720634091807,
    lastUpdatedBy: 'UE1A.230829.036.A1',
    deadline: DateTime.fromMillisecondsSinceEpoch(1721250000000),
  ),
  Todo(
    id: '11438de8-2671-4194-8a5c-dd9c5b57be28',
    text: 'five',
    done: true,
    importance: Importance.basic,
    createdAt: 1720634275988,
    changedAt: 1720634275988,
    lastUpdatedBy: 'UE1A.230829.036.A1',
  ),
  Todo(
    id: '45311995-5878-4cba-b4a4-4578290d4df6',
    text: 'six',
    done: true,
    importance: Importance.basic,
    createdAt: 1720634638889,
    changedAt: 1720634638889,
    lastUpdatedBy: 'UE1A.230829.036.A1',
  ),
  Todo(
    id: '9dbad0d9-ad54-43d9-a702-2212793b34ac',
    text: 'seven',
    done: false,
    importance: Importance.important,
    createdAt: 1720635969187,
    changedAt: 1720635969187,
    lastUpdatedBy: 'UE1A.230829.036.A1',
  ),
];

List<TodoElement> mockTodoElementList = [
  TodoElement(
    id: '4d9a760b-7ee1-4796-9c55-3a51447bb6b4',
    text: 'one',
    done: true,
    importance: Importance.important,
    createdAt: 1720566498987,
    changedAt: 1720566498987,
    lastUpdatedBy: 'UE1A.230829.036.A1',
    deadline: 1721336400000,
  ),
  TodoElement(
    id: 'c5e443b5-05d1-4b48-873f-27cb059eff6e',
    text: 'two',
    done: true,
    importance: Importance.low,
    createdAt: 1720634174301,
    changedAt: 1720634174301,
    lastUpdatedBy: 'UE1A.230829.036.A1',
  ),
  TodoElement(
    id: 'b677ea09-a44c-40ee-a528-d71ee879b7ad',
    text: 'three',
    done: false,
    importance: Importance.important,
    createdAt: 1720634101934,
    changedAt: 1720634101934,
    lastUpdatedBy: 'UE1A.230829.036.A1',
    deadline: 1720645200000,
  ),
  TodoElement(
    id: 'ee694352-fc35-4588-936a-49bc6f191efa',
    text: 'four',
    done: true,
    importance: Importance.low,
    createdAt: 1720634091807,
    changedAt: 1720634091807,
    lastUpdatedBy: 'UE1A.230829.036.A1',
    deadline: 1721250000000,
  ),
  TodoElement(
    id: '11438de8-2671-4194-8a5c-dd9c5b57be28',
    text: 'five',
    done: true,
    importance: Importance.basic,
    createdAt: 1720634275988,
    changedAt: 1720634275988,
    lastUpdatedBy: 'UE1A.230829.036.A1',
  ),
  TodoElement(
    id: '45311995-5878-4cba-b4a4-4578290d4df6',
    text: 'six',
    done: true,
    importance: Importance.basic,
    createdAt: 1720634638889,
    changedAt: 1720634638889,
    lastUpdatedBy: 'UE1A.230829.036.A1',
  ),
  TodoElement(
    id: '9dbad0d9-ad54-43d9-a702-2212793b34ac',
    text: 'seven',
    done: false,
    importance: Importance.important,
    createdAt: 1720635969187,
    changedAt: 1720635969187,
    lastUpdatedBy: 'UE1A.230829.036.A1',
  ),
];

final TodoListResponse mockTodoListResponse = TodoListResponse(
  status: 'ok',
  list: mockTodoElementList,
  revision: 1,
);

final TodoResponse mockTodoResponse = TodoResponse(
  status: 'ok',
  element: mockTodoElementList.first,
  revision: 1,
);
final TodoRequest mockTodoRequest = TodoRequest(
  element: mockTodoElementList.first,
);

final Todo mockUpdatedTodo = Todo(
  id: '4d9a760b-7ee1-4796-9c55-3a51447bb6b4',
  text: 'updated one',
  done: true,
  importance: Importance.important,
  createdAt: 1720566498987,
  changedAt: 1720566498987,
  lastUpdatedBy: 'UE1A.230829.036.A1',
  deadline: DateTime.fromMillisecondsSinceEpoch(1721336400000),
);

final TodoElement mockUpdatedTodoElement = TodoElement(
  id: '4d9a760b-7ee1-4796-9c55-3a51447bb6b4',
  text: 'updated one',
  done: true,
  importance: Importance.important,
  createdAt: 1720566498987,
  changedAt: 1720566498987,
  lastUpdatedBy: 'UE1A.230829.036.A1',
  deadline: 1721336400000,
);

final TodoRequest mockTodoUpdateRequest = TodoRequest(
  element: mockUpdatedTodoElement,
);

final TodoResponse mockTodoUpdatedResponse = TodoResponse(
  status: 'ok',
  element: mockUpdatedTodoElement,
  revision: 1,
);
