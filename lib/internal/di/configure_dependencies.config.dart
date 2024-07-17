// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:todo_list/analytics/analytics_events_wrapper.dart' as _i3;
import 'package:todo_list/domain/use_case/todo_use_case.dart' as _i4;
import 'package:todo_list/internal/di/register_module.dart' as _i7;
import 'package:todo_list/internal/firebase/firebase_remote_handler.dart'
    as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.IAnalyticsEventsWrapper>(
        () => registerModule.analyticsEventsWrapper);
    gh.singleton<_i4.ITodoUseCase>(() => registerModule.todoUseCase);
    gh.singleton<_i5.FirebaseRemoteHandler>(
        () => registerModule.firebaseRemoteHandler);
    gh.singleton<_i6.Dio>(() => registerModule.buildDio());
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
