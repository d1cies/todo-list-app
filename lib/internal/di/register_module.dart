import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:todo_list/analytics/analytics_events_wrapper.dart';
import 'package:todo_list/analytics/middleware/firebase_middleware.dart';
import 'package:todo_list/data/interceptor/auth_interceptor.dart';
import 'package:todo_list/data/interceptor/revision_interceptor.dart';
import 'package:todo_list/data/repository/local_todo_repository.dart';
import 'package:todo_list/data/repository/network_todo_repository.dart';
import 'package:todo_list/data/service/todo_service.dart';
import 'package:todo_list/domain/use_case/todo_use_case.dart';
import 'package:todo_list/firebase_options.dart';
import 'package:todo_list/internal/di/constant.dart';
import 'package:todo_list/internal/logger.dart';

Future<void> initModule() async {
  await _initFirebase();
  RegisterModule._analyticsEventsWrapper.addMiddleware(
    FirebaseMiddleware(
      firebaseAnalytics: FirebaseAnalytics.instance,
    ),
  );
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  logger.i('Firebase init');

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    logger.i('Firebase Crashlytics', error: errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    logger.i('Firebase Crashlytics PlatformDispatcher', error: error);
    return true;
  };
}

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
        const RevisionInterceptor(
          revisionKey: InternalConstants.revisionKey,
        ),
      ],
    );

    return dio;
  }

  static final AnalyticsEventsWrapper _analyticsEventsWrapper =
      AnalyticsEventsWrapper()..init();

  @singleton
  IAnalyticsEventsWrapper get analyticsEventsWrapper => _analyticsEventsWrapper;

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
        analyticsEventsWrapper: analyticsEventsWrapper
      )..init();
}
