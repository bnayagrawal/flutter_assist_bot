import 'package:intl/intl.dart';

String getChatTimeStamp(DateTime dateTime) {
  final DateFormat formatter = DateFormat('E').add_jm();
  return formatter.format(dateTime);
}