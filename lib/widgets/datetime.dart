import 'package:intl/intl.dart';

dateTime() {
  final DateFormat formatter = DateFormat('hh:mm');
  final String formatted = formatter.format(DateTime.now());
  return formatted;
}
