import 'package:intl/intl.dart';

final DateFormat _dateFormatter = DateFormat('dd.MM.yyyy');

DateTime? parseDate(String value) {
  try {
    return _dateFormatter.parseStrict(value);
  } catch (_) {
    return null;
  }
}
