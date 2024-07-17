import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:todo_list/analytics/event/analytics_event.dart';
import 'package:todo_list/analytics/middleware/middleware.dart';
import 'package:todo_list/util/lifecycle_component.dart';


/// Класс для перехвата событий аналитики
abstract class IAnalyticsEventsWrapper implements LifeCycleComponent {
  BehaviorSubject<AnalyticsEvent> get eventsStream;

  void addMiddleware(IAnalyticsMiddleware middleware);

  void addEvent(AnalyticsEvent event);
}

class AnalyticsEventsWrapper implements IAnalyticsEventsWrapper {
  late final StreamSubscription<AnalyticsEvent> _eventsSubscription;

  @override
  BehaviorSubject<AnalyticsEvent> eventsStream = BehaviorSubject();

  final List<IAnalyticsMiddleware> _middlewares = [];

  @override
  void addEvent(AnalyticsEvent event) {
    eventsStream.add(event);
  }

  @override
  void addMiddleware(IAnalyticsMiddleware middleware) {
    _middlewares.add(middleware);
  }

  @override
  void dispose() {
    _eventsSubscription.cancel();
    eventsStream.close();
  }

  @override
  void init() {
    _eventsSubscription = eventsStream.listen(
      (initialValue) {
        _middlewares.fold(
          initialValue,
          (previousValue, middleware) => middleware.logEvent(previousValue),
        );
      },
    );
  }
}
