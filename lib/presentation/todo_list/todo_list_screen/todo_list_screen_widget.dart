import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/presentation/common_components/loading_indicator.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/components/sliver_persistent_app_bar.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/components/sliver_todo_list.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/todo_list_screen_wm.dart';

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
      body: RefreshIndicator(
        onRefresh: wm.refreshTodoList,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            ValueListenableBuilder(
              valueListenable: wm.showDoneTodosController,
              builder: (context, showDoneTodos, _) {
                return ValueListenableBuilder(
                  valueListenable: wm.doneTodoCountController,
                  builder: (context, doneTodosCount, _) {
                    return SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverPersistentAppBar(
                        minHeight: 88,
                        expandedHeight: 164,
                        doneTodos: doneTodosCount,
                        showDoneTodos: showDoneTodos,
                        switchShowDone: wm.changeDoneTodosVisibility,
                      ),
                    );
                  },
                );
              },
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              sliver: ValueListenableBuilder(
                valueListenable: wm.showDoneTodosController,
                builder: (context, showDoneTodos, _) {
                  return EntityStateNotifierBuilder(
                    listenableEntityState: wm.todoListState,
                    loadingBuilder: (_, __) => const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 150),
                        child: LoadingIndicator(),
                      ),
                    ),
                    builder: (context, data) {
                      final todos = data ?? [];
                      if (todos.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 70,
                              ),
                              child: Text(
                                wm.localizations.empty,
                                style: wm.text.title,
                              ),
                            ),
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
