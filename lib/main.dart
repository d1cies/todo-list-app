
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/app/app.dart';

void main() => startApp();

Future<void> startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(TodoListApp());

}

