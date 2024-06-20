import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_list/feature/todo_list/todo_list_screen/components/todo_item.dart';
import 'package:todo_list/feature/todo_list/todo_list_screen/components/visibility_button.dart';
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
                  title: Text('Мои дела'),
                ),
                elevation: 0,
                actions: [
                  if (scrolled) VisibilityButton(),
                ],
              );
            },
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Text('Выполнено — 5'),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            sliver: SliverList.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Dismissible(
                  // пока нет модельки Unique
                  key: UniqueKey(),
                  child: TodoItem(),
                  background: Container(
                    alignment: AlignmentDirectional.centerStart,
                    color: wm.color.green,
                  ),
                  secondaryBackground: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: wm.color.red,
                  ),
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {}

                    if (direction == DismissDirection.startToEnd) {}
                  },
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 20),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: wm.addNewTodo,
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
