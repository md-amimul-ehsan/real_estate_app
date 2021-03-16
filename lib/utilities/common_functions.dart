import 'package:intl/intl.dart';

String timestampToNeatTime(String timestamp, )
{
  final dateTime = DateTime.parse(timestamp);

  final format = DateFormat("dd MMMM, HH:mm a");
  final clockString = format.format(dateTime);

  return clockString;
}