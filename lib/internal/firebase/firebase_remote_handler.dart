import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

abstract class FirebaseConfigFields {
  static const String todoImportanceColor = 'todo_importance_color';
}

class FirebaseRemoteHandler {
  late ValueNotifier<String> todoImportanceColorController =
      ValueNotifier(todoImportanceColor);

  final _remoteConfig = FirebaseRemoteConfig.instance;

  String get todoImportanceColor =>
      _remoteConfig.getString(FirebaseConfigFields.todoImportanceColor);

  Future<void> init() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    await _remoteConfig.setDefaults({
      FirebaseConfigFields.todoImportanceColor: '#FF3B30',
    });

    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(minutes: 1),
      ),
    );

    await _remoteConfig.fetchAndActivate();

    _remoteConfig.onConfigUpdated.listen((event) async {
      await _remoteConfig.activate();
      todoImportanceColorController.value = todoImportanceColor;
    });
  }
}
