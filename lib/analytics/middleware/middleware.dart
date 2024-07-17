
import 'package:todo_list/analytics/event/analytics_event.dart';

abstract class IAnalyticsMiddleware {

  AnalyticsEvent logEvent(AnalyticsEvent event) {
    return event;
  }
}