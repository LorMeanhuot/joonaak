import 'package:intl/intl.dart';

String readTimestamp(int timestamp) {
  var now = new DateTime.now();
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var diff = date.difference(now);
  var time = '';
  //var format = DateFormat.yMMMd().format(date);
  var format = DateFormat.Hm().format(date);
  if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
    time = format; // Doesn't get called when it should be
  } else {
    time = diff.inDays.toString() + 'DAYS AGO'; // Gets call and it's wrong date
  }

  return time;
}
