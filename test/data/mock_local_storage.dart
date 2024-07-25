import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// моковый класс, который будет принимать и возращать данные ILocalRepository
/// не является заменой SharedPreferences, а нужен, чтобы проверить,
/// как ILocalRepository обрабатывает данные
class MockLocalStorage extends Mock implements SharedPreferences {
  int _revision = 1;
  String _todoList = '';

  /// get revision
  @override
  int? getInt(String key) {
    return _revision;
  }

  /// set revision and return true
  @override
  Future<bool> setInt(String key, int value) {
    _revision = value;
    return Future.value(true);
  }

  /// get todoList as String (rawData)
  @override
  String? getString(String key) {
    return _todoList;
  }

  /// set todoList and return true
  @override
  Future<bool> setString(String key, String value) {
    _todoList = value;
    return Future.value(true);
  }
}
