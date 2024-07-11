import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:todo_list/data/interceptor/auth_interceptor.dart';
import 'package:todo_list/data/interceptor/revision_interceptor.dart';
import 'package:todo_list/data/repository/local_todo_repository.dart';
import 'package:todo_list/data/repository/network_todo_repository.dart';
import 'package:todo_list/data/service/todo_service.dart';
import 'package:todo_list/domain/use_case/todo_use_case.dart';
import 'package:todo_list/internal/di/constant.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio buildDio() {
    final dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter)
        .createHttpClient = () => HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        return host == 'beta.mrdekk.ru';
      };

    const timeout = Duration(seconds: 5);

    dio.options
      ..contentType = 'application/json'
      ..baseUrl = 'https://beta.mrdekk.ru/todo'
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    dio.interceptors.addAll(
      [
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
        AuthInterceptor(),
        RevisionInterceptor(revisionKey: InternalConstants.revisionKey),
      ],
    );

    return dio;
  }

  @singleton
  LocalTodoRepository get _localTodoRepository => LocalTodoRepository(
        todoListKey: InternalConstants.todoListKey,
        revisionKey: InternalConstants.revisionKey,
      )..init();

  @singleton
  NetworkTodoRepository get _networkTodoRepository => NetworkTodoRepository(
        TodoService(buildDio()),
        revisionKey: InternalConstants.revisionKey,
      );

  @singleton
  ITodoUseCase get todoUseCase => TodoUseCase(
        localTodoRepository: _localTodoRepository,
        networkTodoRepository: _networkTodoRepository,
        revisionKey: InternalConstants.revisionKey,
      )..init();
}
