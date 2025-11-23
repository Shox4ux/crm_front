import 'package:intl/intl.dart';

extension DateToTxt on DateTime {
  String toTxt() => DateFormat('dd.MM.yyyy HH:mm').format(this);
}
