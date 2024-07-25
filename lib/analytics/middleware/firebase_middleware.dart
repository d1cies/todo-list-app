import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:todo_list/analytics/event/analytics_event.dart';
import 'package:todo_list/analytics/middleware/middleware.dart';
import 'package:todo_list/internal/logger.dart';

/// обрабатывает входящие [AnalyticsEvent] и отправляет их в Firebase
class FirebaseMiddleware implements IAnalyticsMiddleware {
  final FirebaseAnalytics _firebaseAnalytics;

  FirebaseMiddleware({
    required FirebaseAnalytics firebaseAnalytics,
  }) : _firebaseAnalytics = firebaseAnalytics;

  @override
  AnalyticsEvent logEvent(AnalyticsEvent event) {
    handleEvent(event);
    logger.i('Firebase analytics: ${event.name}');
    return event;
  }

  Future<void> handleEvent(AnalyticsEvent event) async {
    await _firebaseAnalytics
        .logEvent(name: event.name, parameters: event.parameters)
        .onError(
      (error, stackTrace) {
        try {
          FirebaseCrashlytics.instance.recordError(error, stackTrace);
        } on Exception catch (e) {
          logger.e('Firebase analytics: $e');
        }
      },
    );
  }
}
