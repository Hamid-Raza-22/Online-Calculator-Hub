import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStatsController extends GetxController {
  final TextEditingController inputController = TextEditingController();


  RxInt wordCount = 0.obs;
  RxInt charCount = 0.obs;
  RxInt charCountNoSpaces = 0.obs;
  RxInt sentenceCount = 0.obs;
  RxInt paragraphCount = 0.obs;
  RxDouble avgWordLength = 0.0.obs;
  RxString readingTime = "0".obs;


  void updateStats(String text) {

    charCount.value = text.length;
    charCountNoSpaces.value = text.replaceAll(" ", "").length;


    List<String> words =
    text.trim().split(RegExp(r"\s+")).where((w) => w.isNotEmpty).toList();
    wordCount.value = words.length;


    List<String> sentences = text
        .split(RegExp(r"[.!?]+"))
        .where((s) => s.trim().isNotEmpty)
        .toList();
    sentenceCount.value = sentences.length;

    List<String> paragraphs =
    text.trim().split("\n").where((p) => p.trim().isNotEmpty).toList();
    paragraphCount.value = paragraphs.length;

    final cleanedWords = words
        .map((w) => w.replaceAll(RegExp(r"[^A-Za-z']"), ""))
        .where((w) => w.isNotEmpty)
        .toList();

    if (cleanedWords.isNotEmpty) {
      final totalLength = cleanedWords.fold<int>(0, (sum, w) => sum + w.length);
      avgWordLength.value = totalLength / cleanedWords.length;
    } else {
      avgWordLength.value = 0;
    }


    double minutes = wordCount.value / 200;
    if (minutes < 1) {
      readingTime.value = "${(minutes * 60).ceil()} sec";
    } else {
      readingTime.value = "${minutes.toStringAsFixed(1)} min";
    }
  }
  void reset() {
    inputController.clear();
   wordCount.value = 0;
    charCount.value = 0;
   charCountNoSpaces.value = 0;
    sentenceCount.value = 0;
    paragraphCount.value = 0;
    avgWordLength.value = 0.0;
    readingTime.value = "0";

  }
  @override
  void onInit() {
    super.onInit();
    inputController.addListener(() {
      updateStats(inputController.text);
    });
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }
}
