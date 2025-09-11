import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BmiController extends GetxController {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  var result = 0.0.obs;
  var clicked=false.obs;
  var bmiCategory=''.obs;
  var showResult=false.obs;


  @override
  void onInit() {
    super.onInit();
    heightController.addListener(() {
      clicked.value = false;
      showResult.value=false;
    });
    weightController.addListener(() {
      clicked.value = false;
      showResult.value=false;
    });
  }


  void calculateBmi() {
    final height = double.tryParse(heightController.text) ?? 0.0;
    final weight = double.tryParse(weightController.text) ?? 0.0;

    if (height > 0 && weight > 0) {
      final heightInMeters = height / 100;
      result.value = weight / (heightInMeters * heightInMeters);
    } else {
      result.value = 0.0;
    }
  }

  String getBmiCategory() {
    if (result.value == 0.0) return bmiCategory.value="Invalid";
    if (result.value < 18.5) return bmiCategory.value="Underweight";
    if (result.value < 24.9) return bmiCategory.value="Normal weight";
    if (result.value < 29.9) return bmiCategory.value="Overweight";
    return bmiCategory.value="obese";
  }
  void copyToClipboard() {
    if (result.value.toString().isNotEmpty) {
      Clipboard.setData(ClipboardData(text: "${result.value.toString()}${bmiCategory.value}"));
      Get.snackbar("Copied", "BMI copied to clipboard",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  void reset() {
    heightController.clear();
    weightController.clear();
    result.value = 0.0;
    clicked.value=false;
    showResult.value=false;
    bmiCategory.value='';
  }

  @override
  void onClose() {
    heightController.dispose();
    weightController.dispose();
    super.onClose();
  }
}
