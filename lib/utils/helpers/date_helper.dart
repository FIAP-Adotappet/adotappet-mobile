import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class DateHelper {
  static DateTime parseStringToDateTime(String dateString, String pattern) {
    DateFormat format = new DateFormat(pattern);
    return format.parse(dateString);
  }

  static int getYearsBetweenDates(DateTime begin, DateTime end) {
    return Jiffy(end).diff(begin, Units.YEAR).floor();
  }

  static int getYearsUntilToday(DateTime begin) {
    return getYearsBetweenDates(begin, DateTime.now());
  }

  static int getMonthsBetweenDates(DateTime begin, DateTime end) {
    return (Jiffy(end).diff(begin, Units.MONTH) % 12).floor();
  }

  static int getMonthsUntilToday(DateTime begin) {
    return getMonthsBetweenDates(begin, DateTime.now());
  }
}