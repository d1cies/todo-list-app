import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/extensions/date_format.dart';
import 'package:todo_list/presentation/todo_detail/todo_detail_screen/components/date_switch.dart';
import 'package:todo_list/presentation/todo_detail/todo_detail_screen/components/delete_element.dart';
import 'package:todo_list/presentation/todo_detail/todo_detail_screen/components/select_importance.dart';
import 'package:todo_list/presentation/todo_detail/todo_detail_screen/components/todo_text_field.dart';
import 'package:todo_list/presentation/todo_detail/todo_detail_screen/todo_detail_screen_wm.dart';

// TODO: cover with documentation
/// Main widget for TodoDetailScreen module
@RoutePage()
class TodoDetailScreenWidget
    extends ElementaryWidget<ITodoDetailScreenWidgetModel> {
  final Todo? todo;

  const TodoDetailScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultTodoDetailScreenWidgetModelFactory,
    this.todo,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ITodoDetailScreenWidgetModel wm) {
    final isNewTodo = todo == null;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: wm.close,
          child: Icon(
            size: 24,
            Icons.close,
            color: wm.color.labelPrimary,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
                key: const ValueKey('todoSaveButton'),
                onPressed: wm.saveTodo,
                child: Text(
                  wm.localizations.save,
                  style: wm.text.button.copyWith(
                    color: wm.color.blue,
                  ),
                )),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 23,
          ),
          children: [
            TodoTextField(
              textController: wm.todoTextController,
              textFocusNode: wm.todoTextFocusNode,
            ),
            const SizedBox(height: 28),
            Text(
              wm.localizations.importance,
              style: wm.text.body.copyWith(
                color: wm.color.labelPrimary,
              ),
            ),
            SelectImportance(wm: wm),
            const Divider(height: 0),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wm.localizations.doneBy,
                      style: wm.text.body.copyWith(
                        color: wm.color.labelPrimary,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: wm.deadlineController,
                      builder: (context, deadline, _) {
                        if (deadline != null) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(deadline.fromDateToString(context),
                                style: wm.text.subhead.copyWith(
                                  color: wm.color.blue,
                                )),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: wm.deadlineEnableController,
                  builder: (context, enabled, _) {
                    return DateSwitch(
                      enabled: enabled,
                      switchDeadline: wm.switchDeadline,
                    );
                  },
                ),
              ],
            ),
            const Divider(),
            DeleteElement(
              isNewTodo: isNewTodo,
              id: todo?.id,
              deleteTodo: wm.deleteTodo,
            ),
          ],
        ),
      ),
    );
  }
}
