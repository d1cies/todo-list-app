import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:todo_list/internal/di/configure_dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit(generateForDir: [''])
void configureDependencies() => getIt.init();
