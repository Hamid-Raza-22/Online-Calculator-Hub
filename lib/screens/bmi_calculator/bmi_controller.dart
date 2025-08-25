import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BmiController extends GetxController {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  var result = 0.0.obs;

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
    if (result.value == 0.0) return "Invalid";
    if (result.value < 18.5) return "Underweight";
    if (result.value < 24.9) return "Normal weight";
    if (result.value < 29.9) return "Overweight";
    return "obence";
  }
  void copyToClipboard() {
    if (result.value.toString().isNotEmpty) {
      Clipboard.setData(ClipboardData(text: result.value.toString()));
      Get.snackbar("Copied", "Password copied to clipboard",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  void reset() {
    heightController.clear();
    weightController.clear();
    result.value = 0.0;
  }

  @override
  void onClose() {
    heightController.dispose();
    weightController.dispose();
    super.onClose();
  }
}
