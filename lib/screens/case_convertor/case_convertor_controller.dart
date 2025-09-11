import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextConverterController extends GetxController {

  final TextEditingController inputController = TextEditingController();
  final TextEditingController outputController = TextEditingController();

  var charCount = 0.obs;
  var wordCount = 0.obs;
  var writingSpeed = 0.0.obs;
  DateTime? _startTime;

  @override
  void onInit() {
    super.onInit();

    inputController.addListener(() {
      final text = inputController.text;

      charCount.value = text.length;
      wordCount.value = text.trim().isEmpty ? 0 : text.trim().split(RegExp(r"\s+")).length;

      if (_startTime == null && text.isNotEmpty) {
        _startTime = DateTime.now();
      }


      if (_startTime != null && wordCount.value > 0) {
        final duration = DateTime.now().difference(_startTime!).inSeconds / 60.0; // minutes
        if (duration > 0) {
          writingSpeed.value = wordCount.value / duration;
        }
      }

      if (text.isEmpty) {
        _startTime = null;
        writingSpeed.value = 0.0;
      }
    });
  }


  void toUppercase() => outputController.text = inputController.text.toUpperCase();

  void toLowercase() => outputController.text = inputController.text.toLowerCase();

  void toTitleCase() {
    final words = inputController.text.split(" ");
    outputController.text = words
        .map((word) => word.isNotEmpty
        ? word[0].toUpperCase() + word.substring(1).toLowerCase()
        : "")
        .join(" ");
  }

  void toSentenceCase() {
    String text = inputController.text.trim();
    if (text.isEmpty) {
      outputController.text = "";
      return;
    }
    outputController.text =
        text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  void toAlternatingCase() {
    String text = inputController.text;
    String result = "";
    for (int i = 0; i < text.length; i++) {
      result += i % 2 == 0 ? text[i].toLowerCase() : text[i].toUpperCase();
    }
    outputController.text = result;
  }

  void toInverseCase() {
    String text = inputController.text;
    String result = "";
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      result += char == char.toUpperCase()
          ? char.toLowerCase()
          : char.toUpperCase();
    }
    outputController.text = result;
  }



  void copyResult() {
    if (outputController.text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: outputController.text));
      Get.snackbar("Copied", "Converted text copied to clipboard",
          snackPosition: SnackPosition.BOTTOM);
    }else{
      Get.snackbar(" Please first convert text to any case!", "Converted box is Empty.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void clearAll() {
    inputController.clear();
    outputController.clear();
    charCount.value = 0;
    wordCount.value = 0;
    writingSpeed.value = 0.0;
    _startTime = null;
  }

  @override
  void onClose() {
    inputController.dispose();
    outputController.dispose();
    super.onClose();
  }
}
