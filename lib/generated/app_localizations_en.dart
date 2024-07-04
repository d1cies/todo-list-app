import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get myTodosTitle => 'My Todos';

  @override
  String get doneSubtitle => 'Done';

  @override
  String get empty => 'Empty';

  @override
  String get hintTodoTextField => 'What needs to be done...';

  @override
  String get importance => 'Importance';

  @override
  String get no => 'No';

  @override
  String get low => 'Low';

  @override
  String get high => 'High';

  @override
  String get delete => 'Delete';

  @override
  String get doneBy => 'Done by';

  @override
  String get save => 'SAVE';
}
