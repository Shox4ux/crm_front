import 'package:intl/intl.dart';

String formatDateTime(DateTime date) {
  // if (dateTime == null) {
  //   return 'Not specified date time';
  // }
  // var date = DateTime.parse(dateTime);
  final formatter = DateFormat('dd.MM.yyyy  HH:mm');
  return formatter.format(date);
}
