// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    TodoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TodoDetailRouteArgs>(
          orElse: () => const TodoDetailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TodoDetailScreenWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    TodoListRoute.name: (routeData) {
      final args = routeData.argsAs<TodoListRouteArgs>(
          orElse: () => const TodoListRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TodoListScreenWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
  };
}

/// generated route for
/// [TodoDetailScreenWidget]
class TodoDetailRoute extends PageRouteInfo<TodoDetailRouteArgs> {
  TodoDetailRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultTodoDetailScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          TodoDetailRoute.name,
          args: TodoDetailRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoDetailRoute';

  static const PageInfo<TodoDetailRouteArgs> page =
      PageInfo<TodoDetailRouteArgs>(name);
}

class TodoDetailRouteArgs {
  const TodoDetailRouteArgs({
    this.key,
    this.wmFactory = defaultTodoDetailScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'TodoDetailRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [TodoListScreenWidget]
class TodoListRoute extends PageRouteInfo<TodoListRouteArgs> {
  TodoListRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultTodoListScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          TodoListRoute.name,
          args: TodoListRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const PageInfo<TodoListRouteArgs> page =
      PageInfo<TodoListRouteArgs>(name);
}

class TodoListRouteArgs {
  const TodoListRouteArgs({
    this.key,
    this.wmFactory = defaultTodoListScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'TodoListRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}
