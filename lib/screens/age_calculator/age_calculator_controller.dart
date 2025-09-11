import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AgeController extends GetxController {
  var dob = Rxn<DateTime>();
  var showResult = false.obs;
  var calculateOn = Rxn<DateTime>();
var clicked=false.obs;
  var years = 0.obs;
  var months = 0.obs;
  var days = 0.obs;
  final dobController = TextEditingController();
  final calculateOnController = TextEditingController();

  void setDob(DateTime date) {
    dob.value = date;
    if (calculateOn.value != null) {
      calculateAge();
    }
  }

  void setCalculateOn(DateTime date) {
    calculateOn.value = date;
    if (dob.value != null) {
      calculateAge();
    }
  }

  void calculateAge() {
    DateTime start = dob.value!;
    DateTime end = calculateOn.value ?? DateTime.now();

    int yearsDiff = end.year - start.year;
    int monthsDiff = end.month - start.month;
    int daysDiff = end.day - start.day;

    if (daysDiff < 0) {
      monthsDiff--;
      daysDiff += DateTime(end.year, end.month, 0).day;
    }

    if (monthsDiff < 0) {
      yearsDiff--;
      monthsDiff += 12;
    }

    years.value = yearsDiff;
    months.value = monthsDiff;
    days.value = daysDiff;
  }

  void copyResult() {
    if (years.value.toString().isNotEmpty) {
      Clipboard.setData(
          ClipboardData(text: "${years.value} years, ${months.value}months, ${days.value}days"));
      Get.snackbar(
        "Copied",
        "Age result copied to clipboard",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void reset() {
    years.value = 0;
    months.value = 0;
    days.value = 0;
    dob.value = null;
    calculateOn.value = null;

    clicked.value=false;
    dobController.clear();
    calculateOnController.clear();
  }
}
