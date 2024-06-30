import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/app_theme.dart';
import 'package:todo_list/generated/app_localizations.dart';
import 'package:todo_list/router/app_router.dart';

class TodoListApp extends StatelessWidget {
  TodoListApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: AppTheme.light().themeData,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
