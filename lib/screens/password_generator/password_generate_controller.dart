import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxInt passwordLength = 8.obs;
  var clicked=false.obs;

  RxBool includeUppercase = true.obs;
  var showResult=false.obs;
  RxBool includeLowercase = true.obs;
  RxBool includeNumbers = true.obs;
  RxBool includeSymbols = true.obs;


  RxString generatedPassword = "".obs;


  final String _uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final String _lowercase = "abcdefghijklmnopqrstuvwxyz";
  final String _numbers   = "0123456789";
  final String _symbols   = "!@#\$%^&*";



  void setIncludeUperCase(bool val){
    includeUppercase.value=val;
  }
  void setLowerCase(bool val){
    includeLowercase.value=val;
  }
  void setIncludeNumbers(bool val){
    includeNumbers.value=val;
  }
  void setIncludeSymbols(bool val){
    includeSymbols.value=val;
  }
  void setLength(int length) {
    passwordLength.value = length;
  }
  void copyToClipboard() {
    if (generatedPassword.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: generatedPassword.value));
      Get.snackbar("Copied", "Password copied to clipboard",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void generatePassword() {
    String chars = "";
    if (includeUppercase.value) chars += _uppercase;
    if (includeLowercase.value) chars += _lowercase;
    if (includeNumbers.value) chars += _numbers;
    if (includeSymbols.value) chars += _symbols;

    if (chars.isEmpty) {
      generatedPassword.value = " Select at least one option!";
      return;
    }

    Random rnd = Random();
    generatedPassword.value = List.generate(
      passwordLength.value,
          (index) => chars[rnd.nextInt(chars.length)],
    ).join();
  }


  void clearPassword() {
    generatedPassword.value = "";
    clicked.value=false;
    showResult.value=false;
  }
}
