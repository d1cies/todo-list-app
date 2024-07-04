import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get myTodosTitle => 'Мои дела';

  @override
  String get doneSubtitle => 'Выполнено';

  @override
  String get empty => 'Пусто';

  @override
  String get hintTodoTextField => 'Что нужно сделать...';

  @override
  String get importance => 'Важность';

  @override
  String get no => 'Нет';

  @override
  String get low => 'Низкий';

  @override
  String get high => 'Высокий';

  @override
  String get delete => 'Удалить';

  @override
  String get doneBy => 'Сделать до';

  @override
  String get save => 'СОХРАНИТЬ';
}
