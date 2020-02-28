import 'package:intl/intl.dart';

class DateUtils {
  static String formatData(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String formatDataDetails(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  static String formatHHmm(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static String toDay() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  static DateTime toDayDateTime() {
    return DateTime.parse(toDay());
  }

  static DateTime string2dateTime(String date) {
    return DateTime.parse(date);
  }

  /// timestamp 单位毫秒
  static DateTime int2dateTime(int timestamp) {
    return new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
  }

  static String int2string(int timestamp) {
    print(timestamp.toString());
    return RelativeDateUtils.getTimestampString(int2dateTime(timestamp));
  }

  static String formatDataMovie(DateTime dateTime) {
    return DateFormat('MM月dd日').format(dateTime);
  }
}

class RelativeDateUtils {
  static String getTimestampString(DateTime date) {
    DateTime curDate = new DateTime.now();
    Duration diff = curDate.difference(date);
    if (diff.inDays > 0) {
      return diff.inDays.toString() + "天前";
    } else if (diff.inHours > 0) {
      return diff.inHours.toString() + "小时前";
    } else if (diff.inMinutes > 0) {
      return diff.inMinutes.toString() + "分钟前";
    } else if (diff.inSeconds >= 0) {
      return "刚刚";
    }
    return date.toString();
  }
}
