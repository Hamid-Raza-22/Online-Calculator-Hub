import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DateController extends GetxController {
  var startDate = Rxn<DateTime>();
  var showResult = false.obs;
  var clicked=false.obs;
  var endDate = Rxn<DateTime>();
  var includeEndDate = false.obs;
  var diffyears = 0.obs;
  var diffMonths = 0.obs;
  var diffDays = 0.obs;
  final startController = TextEditingController();
  final calculateOnController = TextEditingController();

  void setStartDate(DateTime date) {
    startDate.value = date;
  }

  void setEndDate(DateTime date) {
    endDate.value = date;
  }

  void toggleIncludeEndDate(bool value) {
    includeEndDate.value = value;
  }

  String? calculateDifference() {
    if (startDate.value == null || endDate.value == null) return null;

    DateTime start = startDate.value!;
    DateTime end = endDate.value!;

    if (end.isBefore(start)) {
      return "End date must be after start date";
    }

    if (includeEndDate.value) {
      end = end.add(const Duration(days: 1));
    }

    int years = end.year - start.year;
    int months = end.month - start.month;
    int days = end.day - start.day;

    if (days < 0) {
      months -= 1;
      final prevMonth = DateTime(end.year, end.month, 0);
      days += prevMonth.day;
    }

    if (months < 0) {
      years -= 1;
      months += 12;
    }
    diffyears.value=years;
    diffMonths.value=months;
    diffDays.value=days;
    return "$diffyears";

  }
  void copyResult() {
    if (diffyears.value.toString().isNotEmpty) {
      Clipboard.setData(ClipboardData(text:"${diffyears.value}${diffMonths.value},${diffDays.value}"));
      Get.snackbar(
        "Copied",
        "date difference result copied to clipboard",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void reset(){
    diffDays.value=0;
    diffyears.value=0;
    diffMonths.value=0;
    includeEndDate.value = false;
    startDate.value = null;
    endDate.value =null;
    startController.clear();
    calculateOnController.clear();
    clicked.value=false;

  }
}
