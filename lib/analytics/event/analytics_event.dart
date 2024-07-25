class AnalyticsEvent {
  AnalyticsEvent({
    required this.name,
    this.parameters = const {},
  });

  String name;
  Map<String, Object> parameters;
}
