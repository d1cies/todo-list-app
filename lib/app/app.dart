import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/app/theme/app_theme.dart';
import 'package:todo_list/generated/app_localizations.dart';
import 'package:todo_list/internal/firebase/firebase_remote_handler.dart';
import 'package:todo_list/router/app_router.dart';
import 'package:todo_list/util/ui/color_convert.dart';

import 'environment/environment.dart';

class TodoListApp extends StatefulWidget {
  final Environment environment;

  const TodoListApp({super.key, required this.environment});

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  final AppRouter _appRouter = AppRouter();

  final _appLinks = AppLinks();

  @override
  void initState() {
    super.initState();
    _appLinks.uriLinkStream.listen(
      (uri) async {
        final route = await _buildInitialPath(uri);
        if (route != null) {
          await _appRouter.navigateNamed('${Uri.parse(route)}');
        }
      },
    );
  }

  Future<String?> _buildInitialPath(Uri route) async {
    if (route.hasQuery) {
      return '${route.path}?${route.query}';
    }
    return route.path;
  }

  @override
  Widget build(BuildContext context) {
    final remoteConfigHandler = GetIt.instance.get<FirebaseRemoteHandler>()
      ..init();
    return ValueListenableBuilder(
      valueListenable: remoteConfigHandler.todoImportanceColorController,
      builder: (context, appValue, _) {
        Color? remoteColor;
        if (appValue.isNotEmpty) {
          remoteColor = getColorFromHex(appValue);
        }
        return MaterialApp.router(
          routerConfig: _appRouter.config(),
          theme: AppTheme.light(importanceColor: remoteColor).themeData,
          darkTheme: AppTheme.dark(importanceColor: remoteColor).themeData,
          debugShowCheckedModeBanner: widget.environment != Environment.prod,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
