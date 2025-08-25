import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CaloriesController extends GetxController {
  var errorMsg = "Please Enter All fields";
  var selectedGender = 'Male'.obs;
  var selectedActivity = 'Sedentary(little or no exercise)'.obs;

  var calories = ''.obs;

  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  void setSelectedGender(String? newValue) {
    if (newValue != null) {
      selectedGender.value = newValue;
    }
  }

  void setSelectedActivity(String? newValue) {
    if (newValue != null) {
      selectedActivity.value = newValue;
    }
  }

  double calculateBMR() {
    final age = int.tryParse(ageController.text) ?? 0;
    final weight = double.tryParse(weightController.text) ?? 0.0;
    final height = double.tryParse(heightController.text) ?? 0.0;

    if (selectedGender.value == "Male") {
      return 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      return 10 * weight + 6.25 * height - 5 * age - 161;
    }
  }

  double getActivityFactor() {
    switch (selectedActivity.value) {
      case 'Sedentary(little or no exercise)':
        return 1.2;
      case 'Lightly active (1-3 days/week)':
        return 1.375;
      case 'Moderately active (3-5 days/week)':
        return 1.55;
      case 'Very active (6-7 days/week)':
        return 1.725;
      case 'Extra active (Physical job)':
        return 1.9;
      default:
        return 1.2;
    }
  }

  void calculateCalories() {
    if (ageController.text.isNotEmpty &&
        weightController.text.isNotEmpty &&
        heightController.text.isNotEmpty) {
      double bmr = calculateBMR();
      double tdee = bmr * getActivityFactor();

      double loseWeight = tdee - 500;
      double gainWeight = tdee + 500;

      calories.value =
      "${tdee.toStringAsFixed(0)} cal/day\n"
          "Lose Weight: ${loseWeight.toStringAsFixed(0)} cal/day\n"
          "Gain Weight: ${gainWeight.toStringAsFixed(0)} cal/day\n"
          "BMR(Basal Metabolic Rate): ${bmr.toStringAsFixed(0)} cal/day";
    } else {
      calories.value = errorMsg;
    }
  }
  void copyResult() {
    if (calories.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: calories.value));
      Get.snackbar(
        "Copied",
        "Calories result copied to clipboard",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  void reset() {
    selectedGender.value = 'Male';
    selectedActivity.value = 'Sedentary(little or no exercise)';
    ageController.clear();
    weightController.clear();
    heightController.clear();
    calories.value = "";
  }
}
