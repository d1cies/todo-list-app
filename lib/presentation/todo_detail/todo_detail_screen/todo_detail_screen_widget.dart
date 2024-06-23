import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/domain/model/importance.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/extensions/date_format.dart';
import 'package:todo_list/presentation/todo_detail/todo_detail_screen/components/date_switch.dart';
import 'package:todo_list/presentation/todo_detail/todo_detail_screen/components/delete_element.dart';
import 'todo_detail_screen_wm.dart';

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
    final bool isNewTodo = todo == null;
    return GestureDetector(
      onTap: wm.todoTextFocusNode.unfocus,
      child: Scaffold(
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
              padding: const EdgeInsets.only(right: 16.0),
              child: TextButton(
                onPressed: wm.saveTodo,
                child: Text(
                  'СОХРАНИТЬ',
                  style: wm.text.button.copyWith(
                    color: wm.color.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 23.0,
            ),
            children: [
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                elevation: 2.0,
                child: TextField(
                  controller: wm.todoTextController,
                  focusNode: wm.todoTextFocusNode,
                  maxLines: null,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Что надо сделать...',
                    filled: true,
                    fillColor: wm.color.backSecondary,
                    contentPadding: const EdgeInsets.all(16.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Важность',
                style: wm.text.body.copyWith(
                  color: wm.color.labelPrimary,
                ),
              ),
              ButtonTheme(
                padding: EdgeInsets.zero,
                alignedDropdown: true,
                child: DropdownMenu(
                  leadingIcon: null,
                  trailingIcon: const SizedBox.shrink(),
                  selectedTrailingIcon: const SizedBox.shrink(),
                  initialSelection: wm.selectedImportanceController.value,
                  textStyle: wm.text.subhead
                      .copyWith(color: wm.color.labelPrimary.withOpacity(0.3)),
                  inputDecorationTheme: const InputDecorationTheme(
                    activeIndicatorBorder: BorderSide(
                      color: Colors.transparent,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  menuStyle: MenuStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                    backgroundColor: WidgetStateProperty.all(wm.color.white),
                  ),
                  onSelected: (cur) =>
                      wm.selectImportance(cur ?? Importance.no),
                  dropdownMenuEntries: wm.importanceMap.entries
                      .map<DropdownMenuEntry<Importance>>(
                    (importance) {
                      final color = importance.key == Importance.high
                          ? wm.color.red
                          : wm.color.labelPrimary;
                      return DropdownMenuEntry(
                        value: importance.key,
                        label: importance.value,
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(color),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              const Divider(height: 0),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Сделать до',
                        style: wm.text.body.copyWith(
                          color: wm.color.labelPrimary,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: wm.deadlineController,
                        builder: (BuildContext context, deadline, _) {
                          if (deadline != null) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(deadline.fromDateToString(),
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
                    builder: (BuildContext context, enabled, _) {
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
      ),
    );
  }
}
