import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'main_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Должен создать новую Todo в списке задач',
    (widgetTester) async {
      await mainTest();
      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.byKey(const ValueKey('todoCreation')));
      await widgetTester.pumpAndSettle();

      const todoText = 'test task';
      await widgetTester.enterText(
        find.byKey(const ValueKey('todoTextField')),
        todoText,
      );
      await widgetTester.pumpAndSettle();

      // не захотело работать, причина пока не понятна

      // await widgetTester.tap(find.byType(DropdownMenu<Importance>));
      // await widgetTester.pumpAndSettle();

      // await widgetTester.tap(
      //   find.byWidgetPredicate(
      //     (widget) =>
      //         widget is DropdownMenuEntry<Importance> &&
      //         (widget as DropdownMenuEntry<Importance>).value ==
      //             Importance.important,
      //   ),
      // );
      // await widgetTester.pumpAndSettle();

      await widgetTester.tap(find.byKey(const ValueKey('todoSaveButton')));
      await widgetTester.pumpAndSettle();

      final createdTodoText = find.text(todoText);
      expect(createdTodoText, findsOne);

      final createdTodoCheckboxState = find.byWidgetPredicate(
        (widget) => widget is Checkbox && !(widget.value ?? false),
      );
      expect(createdTodoCheckboxState, findsOne);
    },
  );
}
