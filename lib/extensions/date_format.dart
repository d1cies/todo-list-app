import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String fromDateToString() {
    initializeDateFormatting();
    final DateFormat formatter = DateFormat.yMMMMd('ru_RU');
    return formatter.format(this).replaceAll('г.', '');
  }
}