import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_list/data/dto/request/todo_request.dart';
import 'package:todo_list/data/dto/request/update_todo_list_request.dart';
import 'package:todo_list/data/dto/response/todo_list_response.dart';
import 'package:todo_list/data/dto/response/todo_response.dart';

part 'todo_service.g.dart';

@RestApi()
abstract class TodoService {
  @factoryMethod
  factory TodoService(Dio dio) => _TodoService(dio);

  @GET('/list')
  Future<TodoListResponse> getTodoList();

  @PATCH('/list')
  Future<TodoListResponse> updateTodoList({
    @Body() required UpdateTodoListRequest request,
  });

  @GET('/list/{id}')
  Future<TodoResponse> getTodo(
    @Path('id') String id,
  );

  @POST('/list')
  Future<TodoResponse> createTodo({
    @Body() required TodoRequest request,
  });

  @PUT('/list/{id}')
  Future<TodoResponse> updateTodo(
    @Path('id') String id, {
    @Body() required TodoRequest request,
  });

  @DELETE('/list/{id}')
  Future<TodoResponse> deleteTodo(
    @Path('id') String id,
  );
}
