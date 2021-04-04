import 'package:intl/intl.dart';

class StringUtil {
  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  static String modifyDateFormat(DateTime date) =>
      DateFormat('yyyy-MM-dd hh:mm').add_d().format(date);
  static String appName = 'appName';
  static String today = 'today';
  static String pinLocation = 'pinLocation';
  static String remove = 'remove';
  static String login = 'login';
}
