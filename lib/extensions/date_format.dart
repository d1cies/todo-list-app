import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String toFormattedString() {
    final DateFormat formatter = DateFormat('d MMMM y');
    return formatter.format(this);
  }
}