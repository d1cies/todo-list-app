import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String fromDateToString(BuildContext context) {
    initializeDateFormatting();
    final locale = Localizations.localeOf(context);
    final formatter = DateFormat.yMMMMd(locale.languageCode);
    return formatter.format(this).replaceAll('г.', '');
  }
}
