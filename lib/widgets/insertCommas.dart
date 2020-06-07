import 'package:intl/intl.dart';

class InsertCommas {
  String insertCommas(var number) {
    return NumberFormat.decimalPattern().format(double.parse(number));
  }
}
