import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list/app/app.dart';
import 'package:todo_list/app/environment/environment.dart';
import 'package:todo_list/internal/di/configure_dependencies.dart';
import 'package:todo_list/internal/di/register_module.dart';

void main() => startApp();

Future<void> startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ],
  );
  await dotenv.load();
  await initializeDateFormatting();
  await initModule();
  configureDependencies();

  runApp(
    TodoListApp(
      environment: Environment.production,
    ),
  );
}


