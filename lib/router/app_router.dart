import 'package:todo_list/router/app_router_export.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'ScreenWidget,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: TodoListRoute.page,
          initial: true,
        ),
        AutoRoute(page: TodoDetailRoute.page),
      ];
}
