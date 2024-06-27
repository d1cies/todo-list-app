import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/app/app.dart';
import 'package:todo_list/internal/di/configure_dependencies.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() => startApp();

Future<void> startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  initializeDateFormatting();
  configureDependencies();

  runApp(TodoListApp());
}
