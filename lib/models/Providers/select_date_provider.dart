import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class select_date extends ChangeNotifier {

  DateTime selectedValue = DateTime.now();

  var year = "Year".tr;
  var month = "Month".tr;
  var day = "Day".tr;

  changeDate(date) {
    selectedValue = date;
    year = '${selectedValue.year}'.tr;
    month = '${selectedValue.month}'.tr;
    day = '${selectedValue.day}'.tr;
    notifyListeners();
  }
}
