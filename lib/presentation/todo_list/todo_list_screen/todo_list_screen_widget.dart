import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/presentation/common_components/loading_indicator.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/components/sliver_todo_list.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/components/visibility_button.dart';
import 'todo_list_screen_wm.dart';

// TODO: cover with documentation
/// Main widget for TodoListScreen module
@RoutePage()
class TodoListScreenWidget
    extends ElementaryWidget<ITodoListScreenWidgetModel> {
  const TodoListScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultTodoListScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ITodoListScreenWidgetModel wm) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (BuildContext context, SliverConstraints constraints) {
              final scrolled = constraints.scrollOffset > 70;
              return SliverAppBar(
                backgroundColor: wm.color.backPrimary,
                surfaceTintColor: wm.color.backPrimary,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: 150.0,
                collapsedHeight: 70,
                flexibleSpace: FlexibleSpaceBar(
                  background: ColoredBox(
                    color: wm.color.backPrimary,
                  ),
                  titlePadding: EdgeInsets.only(left: 60.0, bottom: 17.0),
                  expandedTitleScale: 2,
                  title: const Text('Мои дела'),
                ),
                elevation: 0,
                actions: [
                  if (scrolled) const VisibilityButton(),
                ],
              );
            },
          ),
          // const SliverPadding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.0),
          //   sliver: SliverToBoxAdapter(
          //     child: Text('Выполнено — 5'),
          //   ),
          // ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            sliver: ValueListenableBuilder(
              valueListenable: wm.showDoneTodosController,
              builder: (context, showDoneTodos, _) {
                return EntityStateNotifierBuilder(
                  listenableEntityState: wm.todoListState,
                  loadingBuilder: ((_, __) => const SliverToBoxAdapter(
                        child: LoadingIndicator()
                      )),
                  builder: (context, data) {
                    final todos = data ?? [];
                    if (todos.isEmpty) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Text('Пусто'),
                        ),
                      );
                    }
                    return SliverTodoList(
                      todos: todos,
                      wm: wm,
                      showDoneTodos: showDoneTodos,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => wm.toTodoDetail(null),
        elevation: 5,
        shape: const CircleBorder(),
        backgroundColor: wm.color.blue,
        child: Icon(
          Icons.add,
          color: wm.color.white,
        ),
      ),
    );
  }
}
