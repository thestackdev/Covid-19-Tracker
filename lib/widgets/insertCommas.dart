import 'package:intl/intl.dart';

class InsertCommas {
  String insertCommas(var number) {
    return NumberFormat.compact().format(double.parse(number));
  }
}
