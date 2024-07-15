import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/app_theme.dart';
import 'package:todo_list/generated/app_localizations.dart';
import 'package:todo_list/router/app_router.dart';

import 'environment/environment.dart';

class TodoListApp extends StatefulWidget {
  final Environment environment;
  TodoListApp({super.key, required this.environment});

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
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: AppTheme.light().themeData,
      darkTheme: AppTheme.dark().themeData,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
