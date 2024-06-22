import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/importance.dart';
import 'package:todo_list/domain/model/todo.dart';
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
    return GestureDetector(
      onTap: wm.todoTextFocusNode.unfocus,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
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
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'СОХРАНИТЬ',
              ),
            ),
          ],
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                elevation: 2.0,
                child: TextField(
                  controller: wm.todoTextController,
                  focusNode: wm.todoTextFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Что надо сделать...',
                    filled: true,
                    fillColor: wm.color.backSecondary,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Text('Важность'),
              DropdownMenu(
                leadingIcon: null,
                trailingIcon: const SizedBox.shrink(),
                initialSelection: wm.importanceList.first,
                inputDecorationTheme: const InputDecorationTheme(
                  activeIndicatorBorder: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                dropdownMenuEntries:
                    wm.importanceList.map<DropdownMenuEntry<Importance>>(
                  (importance) {
                    return DropdownMenuEntry(value: importance, label: 'label');
                  },
                ).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Сделать до'),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(''),
                      ),
                    ],
                  ),
                  Switch(
                    value: true,
                    onChanged: (_) => (),
                    activeColor: wm.color.blue,
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Icon(Icons.delete_outline),
                  Text('Удалить'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
